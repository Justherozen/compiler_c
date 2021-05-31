%{
#include "syntaxparser.hpp"
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "Ast.hpp"
#include <iostream>
using namespace std;
int yycolumn = 1;
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno; \
	yylloc.first_column = yycolumn; yylloc.last_column = yycolumn + yyleng - 1; \
    yycolumn += yyleng;


%}
%option yylineno
letter_ [a-zA-Z_]
digit [0-9]
digits [0-9]+
FLOAT   {digits}\.{digits}|(\.{digits}|{digits}\.|{digits}\.{digits}|{digits})([eE][+-]?{digits})
FLOATERROR (\.{digits}|{digits}\.|{digits}\.{digits})([eE][+-]?)
ID {letter_}({letter_}|{digit})*
AND "&&"
OR "||"
NOT "!"
STRUCT "struct"
RETURN "return"
WHILE "while"
IF "if"
ELSE "else"
WhiteSpace  [ \t\r\n]+
VOID "void"
TYPE "int"|"float"
LCOMMENT "/*"
COMMENT "//"
TRUE "true"
FALSE "false"
LP  "("
RP ")"
LB "["
RB "]"
LC "{"
RC "}"
SEMI ";"
COMMA ","
ASSIGNOP "="
PLUS "+"
MINUS "-"
STAR "*"
DOT "."
DIV "/"
%%
{LP}                                                    { return LP; }
{RP}                                                    { return RP; }
{LB}                                                    { return LB; }
{RB}                                                    { return RB; }
{LC}                                                    { return LC; }
{RC}                                                    { return RC; }
{COMMA}                                                 { return COMMA; }
{ASSIGNOP}                                              { return ASSIGN; }
{STAR}                                                  { return MUL; }
{DIV}                                                    { return DIV; }
{PLUS}                                                   { return PLUS; }
{MINUS}                                                 { return MINUS; }
"!="                                                    { return UNEQUAL; }
">="                                                    { return GE; }
">"                                                     { return GT; }
"<="                                                    { return LE; }
"<"                                                     { return LT; }
"=="                                                    { return EQUAL; }
{SEMI}                                                  { return SEMI; }
{WHILE}                                                 { return WHILE; }
{ELSE}			                                        { return ELSE; }
{IF}			                                        { return IF; }
{TYPE}			                                        { return INT; }
{VOID}			                                        { return VOID; }
{RETURN}		                                        { return RETURN; }
{TRUE}		                                            { return TRUE; }
{FALSE}		                                            { return FALSE; }
{ID}                                                    {   
                                                            string * temp=new string(yytext, yyleng);
                                                            yylval.identifier = new Identifier(*temp);
                                                            return ID;
                                                                      }
{digits}                                                {   int itmp;     
                                                            sscanf(yytext, "%d", &itmp);
                                                            yylval.iVal = itmp; 
                                                            return NUM;}
{LCOMMENT} { 
    char a=getchar();char b=getchar();while(a!='*'||b!='/'){
        a=b;
        b=getchar();
    if(b=='\0'){
        printf("unterminated comment at Line %d: Missing \"*/.\"\n",yylineno);
        break;}
        }    
    }
{COMMENT} {
    char a=getchar();
    while(a!='\n')a=getchar();
    }
{WhiteSpace}+ { }
"\n" {yycolumn=1;}
%%
int yywrap() {return 1;}



