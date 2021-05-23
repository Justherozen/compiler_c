
%{
#include "syntax.tab.h"
#include "treenode.h"
//#define DEBUGNOW
//#define DEBUGBISONNOW
int lexError=0;
extern int emptyflag;

void printfdebug(char *str){
    #ifdef DEBUGNOW
    printf("debug:Line %d :input  %s : %s\n",yylineno,str,yytext);
    #endif
}

struct Node* root;

void  fill_yylval(char * Name,NODE_TYPE Type);
    int yycolumn = 1;
    #define YY_USER_ACTION \
        yylloc.first_line = yylloc.last_line = yylineno; \
        yylloc.first_column = yycolumn; \
        yylloc.last_column = yycolumn + yyleng - 1; \ 
        yycolumn += yyleng;
%}
%option yylineno
letter_ [A-Za-z_]
digit [0-9]
digits [0-9]+
OCT 0[0-7]+
OCTERROR 0[0-7]*[8-9]+[0-9]*
HEX 0[xX][0-9a-fA-F]+
HEXERROR 0[xX][0-9a-fA-F]*[g-zG-Z]+[0-9a-zA-Z]*
DEC   0|([1-9][0-9]*)
DECERROR [0-9]+[a-wA-Wy-zY-Z]+[0-9a-dA-Df-zF-Z]*|[0-9]+[0-9]+[a-dA-Df-zF-Z]+[0-9]*[0-9a-dA-Df-zF-Z]*
FLOAT   {digits}\.{digits}|(\.{digits}|{digits}\.|{digits}\.{digits}|{digits})([eE][+-]?{digits})
FLOATERROR (\.{digits}|{digits}\.|{digits}\.{digits})([eE][+-]?)
ID {letter_}({letter_}|{digit})*
TYPE int|float
LP  "("
RP ")"
LB "["
RB "]"
LC "{"
RC "}"
LCOMMENT "/*"
COMMENT "//"
RELOP >|<|>=|<=|==|!=
SEMI ";"
COMMA ","
ASSIGNOP "="
PLUS "+"
MINUS "-"
STAR "*"
DOT "."
DIV "/"
AND "&&"
OR "||"
NOT "!"
STRUCT "struct"
RETURN "return"
WHILE "while"
IF "if"
ELSE "else"
WhiteSpace  [ \t\r\n]+
%%
{HEX} {
    printfdebug("HEX");
    fill_yylval("INT",LEX_INT);
    sscanf(yytext,"%x",&yylval.node->int_contant);
    emptyflag=1;
    return INT;
    }
{HEXERROR} {
    printf("Error type A at Line %d: Illegal hexadecimal number\'%s\'.\n",yylineno, yytext);
    lexError+=1;
    fill_yylval("INT",LEX_INT);
    yylval.node->int_contant=0;
    emptyflag=1;
    return INT;
}
{OCT} {
    printfdebug("OCT");
    fill_yylval("INT",LEX_INT);
    sscanf(yytext,"%o",&yylval.node->int_contant);
    emptyflag=1;
    return INT;
}
{OCTERROR} {
    printf("Error type A at Line %d: Illegal octal number\'%s\'.\n",yylineno, yytext);
    lexError+=1;
    fill_yylval("INT",LEX_INT);
    yylval.node->int_contant=0; 
    emptyflag=1;
    return INT;
}
{DEC} {
    printfdebug("DEC");
    fill_yylval("INT",LEX_INT);
    sscanf(yytext,"%d",&yylval.node->int_contant);
    emptyflag=1;
    return INT;
}
{DECERROR} {
    printf("Error type A at Line %d: Illegal decerror number\'%s\'.\n",yylineno, yytext);
    lexError+=1;
    fill_yylval("INT",LEX_INT);
    yylval.node->int_contant=0;
    emptyflag=1;
    return INT;
}
{FLOAT} {
    printfdebug("FLOAT");
    fill_yylval("FLOAT",LEX_FLOAT);
    sscanf(yytext,"%f",&yylval.node->float_contant);
    emptyflag=1;
    return FLOAT;
    }
{FLOATERROR} {
    printf("Error type A at Line %d: Illegal floating point number\'%s\'.\n",yylineno, yytext);
    fill_yylval("FLOAT",LEX_FLOAT);
    yylval.node->float_contant=0;
    lexError+=1;
    emptyflag=1;
    return FLOAT;
    }
{LCOMMENT} { 
    char a=input();char b=input();while(a!='*'||b!='/'){
        a=b;
        b=input();
    if(b=='\0'){
        printf("unterminated comment at Line %d: Missing \"*/.\"\n",yylineno);
        break;}
        }    
    }
{COMMENT} {
    char a=input();
    while(a!='\n')a=input();
    }
{SEMI} {printfdebug("SEMI");
        fill_yylval("SEMI",OTHERS);    
        emptyflag=1;
        return SEMI;}
{COMMA} {printfdebug("comma");
        fill_yylval("COMMA",OTHERS);
        emptyflag=1;
       return COMMA; }
{ASSIGNOP} {printfdebug("assignop");
        fill_yylval("ASSIGNOP",OTHERS);
        emptyflag=1;
        return ASSIGNOP;}
{RELOP} {printfdebug("RELOP");
        fill_yylval("RELOP",OTHERS);
        emptyflag=1;
        return RELOP;}
{PLUS} {printfdebug("plus");
        fill_yylval("PLUS",OTHERS);
        emptyflag=1;
        return PLUS;}
{MINUS} {printfdebug("minus");
        fill_yylval("MINUS",OTHERS);
        emptyflag=1;
        return MINUS;}
{STAR} {printfdebug("star");
        fill_yylval("STAR",OTHERS);
        emptyflag=1;
        return STAR;}
{DIV} {printfdebug("div");
        fill_yylval("DIV",OTHERS);
        emptyflag=1;
        return DIV;}
{AND}  {printfdebug("and");
        fill_yylval("AND",OTHERS);
        emptyflag=1;
        return AND;}
{OR}  {printfdebug("or");
        fill_yylval("OR",OTHERS);
        emptyflag=1;
        return OR;}
{DOT} {printfdebug("dot");
        fill_yylval("DOT",OTHERS);
        emptyflag=1;
        return DOT;}
{NOT} {printfdebug("not");
        fill_yylval("NOT",OTHERS);
        emptyflag=1;
        return NOT;}
{TYPE} {printfdebug("type");
        emptyflag=1;
        fill_yylval("TYPE",LEX_TYPE);
        strcpy(yylval.node->string_contant,yytext);
        return TYPE;}
{LP}  {printfdebug("LP");
        emptyflag=1;
        fill_yylval("LP",OTHERS);
        return LP;}
{RP} {printfdebug("RP");
        emptyflag=1;
        fill_yylval("RP",OTHERS);
        return RP;}
{LB} {printfdebug("LB");
        emptyflag=1;
        fill_yylval("LB",OTHERS);
        return LB;}
{RB} {printfdebug("RB");
        emptyflag=1;
        fill_yylval("RB",OTHERS);
        return RB;}
{LC} {printfdebug("LC");
        emptyflag=1;
        fill_yylval("LC",OTHERS);
        return LC;}
{RC} {printfdebug("RC");
        emptyflag=1;
        fill_yylval("RC",OTHERS);
        return RC;}
{STRUCT} {printfdebug("STRUCT");
        emptyflag=1;
        fill_yylval("STRUCT",OTHERS);
        return STRUCT;}
{RETURN}  {printfdebug("return");
        emptyflag=1;
        fill_yylval("RETURN",OTHERS);
        return RETURN;}
{IF}  {printfdebug("if");
        emptyflag=1;
        fill_yylval("IF",OTHERS);
        return IF;}
{ELSE}  {printfdebug("else");
        emptyflag=1;
        fill_yylval("ELSE",OTHERS);
        return ELSE;}
{WHILE} {printfdebug("while");
        emptyflag=1;
        fill_yylval("WHILE",OTHERS);
        return WHILE;}
{ID} {printfdebug("ID");
        emptyflag=1;
        fill_yylval("ID",LEX_ID);
        strcpy(yylval.node->string_contant,yytext);
        return ID;}
{WhiteSpace}+ { }
"\n" {yycolumn=1;}
.   {
    lexError+=1;
    printf("Error type A at Line %d:\'%s\' undeclared.\n",yylineno, yytext);
    }
%%
int yywrap()
{ 
    return 1;
}

void  fill_yylval(char * Name,NODE_TYPE Type){
    yylval.node=(struct Node*)malloc(sizeof(struct Node));
    yylval.node->child=NULL;
    yylval.node->next_sib=NULL;
    yylval.node->column=yylineno;
    strcpy(yylval.node->name,Name);
    yylval.node->from=0;
    yylval.node->type=Type;
}



