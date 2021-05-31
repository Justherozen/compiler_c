%locations
%{
#include "Ast.hpp"
#include <string>
#include <iostream>

using namespace std;

void yyerror(const char *s) { 
    std::printf("Error: %s\n", s);
    std::exit(1); 
}
#define SET_LOCATION(dest) (dest)->set_location(yylloc.first_line, yylloc.first_column)
extern int yylex(void);
Program *root;
%}

%code requires{#include "Ast.hpp"}
%nonassoc LOWERTHANELSE 
%nonassoc ELSE
%union {
    int iVal;
    OurType* ourType;
    Program* program;
    Identifier* identifier;
    Parameter* parameter;
    Expression* expression;
    Statement* statement;
    Extdeflist* extdeflist;
    Parameterlist* parameterlist;
    Statementlist* statementlist;
    Declaration* extdef;
    IntExpr* intExpr;
    Var* var;
    CallExpr* callExpr;
    VarDec* varDec;
    FunDec* funDec;
    CompSt* compSt;
    IfStatement* ifStatement;
    WhileStatement* whileStatement;
    ReturnStatement* returnStatement;
    BinaryExpr::BinaryOp op;
    ExpressionStmt* expressionstmt;
    Arglist* arglist;
}

%token  LP RP LB RB LC RC COMMA MUL DIV UNEQUAL PLUS MINUS ASSIGN
        GE GT LE LT EQUAL SEMI WHILE ELSE  
        IF INT VOID RETURN TRUE FALSE AND TYPE OR NOT  FLOAT


%token<iVal> NUM
%token<identifier> ID
%type <program> program
%type <extdeflist> extdeflist
%type <extdef> extdef
%type <varDec> varDec lvarDec
%type <funDec> funDec
%type <ourType> specifier
%type <compSt> compSt
%type <parameterlist> parameterlist params
%type <parameter> parameter
%type <statementlist> statementlist
%type <statement> statement elseclause 
%type <expressionstmt>   expressionstmt
%type <whileStatement>  iterationstmt
%type <ifStatement> selectionstmt
%type <returnStatement> returnstmt
%type <expression> expression  simpleexpression  additiveexpression term factor
%type <var> var
%type <op> relop mulop addop
%type <callExpr> call
%type <arglist> args arglist

%%
program: extdeflist { root=$1; }
    ;
extdeflist: extdeflist extdef {$$=$1;$$->push_back($2);}
    |   extdef {$$=new Extdeflist(); $$->push_back($1);};
extdef: varDec {$$=$1;SET_LOCATION($$);} 
    |   funDec {$$=$1;/*SET_LOCATION($$)*/;}
    ;
varDec: specifier ID SEMI {$$=new VarDec($1,$2,nullptr,true,0);/*SET_LOCATION($$)*/;}//单个数字
    | specifier ID LB NUM RB SEMI{$$=new VarDec($1,$2,nullptr,true,$4);/*SET_LOCATION($$)*/;};//数组

specifier : INT {$$=new OurType(OurTypeID::MY_INT);/*SET_LOCATION($$)*/;} 
    |   VOID {$$=new OurType(OurTypeID::MY_VOID);/*SET_LOCATION($$)*/;}
    |   FLOAT {$$=new OurType(OurTypeID::MY_FLOAT);/*SET_LOCATION($$)*/;}
    ;
funDec : specifier ID LP params RP compSt{$$=new FunDec($1,$2,$4,$6);/*SET_LOCATION($$)*/;}
    |    specifier ID LP params RP {$$=new FunDec($1,$2,$4,nullptr);/*SET_LOCATION($$)*/;}
    ;
params : parameterlist {$$=$1;/*SET_LOCATION($$)*/;}
    |    VOID {$$=NULL;/*SET_LOCATION($$)*/;}
    ;
parameterlist : parameterlist COMMA parameter {$$=$1;$$->push_back($3);/*SET_LOCATION($$)*/;}
    |   parameter {$$=new Parameterlist();$$->push_back($1);/*SET_LOCATION($$)*/;}
    ;
parameter : specifier ID {$$= new Parameter($1,$2,false);/*SET_LOCATION($$)*/;}
    |   specifier ID LB RB {$$= new Parameter($1,$2,true);/*SET_LOCATION($$)*/;}
    ;
compSt : LC statementlist  RC {$$=new CompSt($2);/*SET_LOCATION($$)*/;}
    ;
statementlist : statementlist statement {$$=$1;$1->push_back($2);/*SET_LOCATION($$)*/;}
    |      statementlist lvarDec {$$=$1;$1->push_back($2);/*SET_LOCATION($$)*/;}
    |       {$$=new Statementlist();}
    ;
lvarDec : specifier ID SEMI {$$=new VarDec($1,$2,nullptr,false,0);/*SET_LOCATION($$)*/;}
    | specifier ID LB NUM RB SEMI{$$=new VarDec($1,$2,nullptr,false,$4);/*SET_LOCATION($$)*/;}
    ;
statement :  selectionstmt {$$=$1;/*SET_LOCATION($$)*/;} 
    |        expressionstmt {$$=$1;/*SET_LOCATION($$)*/;}
    |       compSt  {$$=$1;/*SET_LOCATION($$)*/;}
    |       iterationstmt {$$=$1;/*SET_LOCATION($$)*/;}
    |       returnstmt    {$$=$1;/*SET_LOCATION($$)*/;}
    ;
selectionstmt :  IF LP expression RP statement elseclause {$$=new IfStatement($3,$5,$6);/*SET_LOCATION($$)*/;}
;
elseclause: ELSE statement {$$=$2;/*SET_LOCATION($$)*/;}
    | %prec LOWERTHANELSE {$$=NULL;/*SET_LOCATION($$)*/;} 
    ;
expressionstmt : expression SEMI {$$=new ExpressionStmt($1);/*SET_LOCATION($$)*/;}
    | SEMI {$$=NULL;/*SET_LOCATION($$)*/;}
    ;
iterationstmt : WHILE LP expression RP statement {$$=new WhileStatement($3,$5);/*SET_LOCATION($$)*/;}
    ;
returnstmt  : RETURN SEMI {$$=new ReturnStatement(NULL);/*SET_LOCATION($$)*/;} 
    |         RETURN expression SEMI {$$=new ReturnStatement($2);/*SET_LOCATION($$)*/;}
    ;
expression : var ASSIGN expression {$$=new AssignStatement($1,$3);/*SET_LOCATION($$)*/;}
    |        simpleexpression   {$$=$1;/*SET_LOCATION($$)*/;}
    ;
var : ID {$$=new Var($1,NULL);/*SET_LOCATION($$)*/;}
    | ID LB expression RB {$$=new Var($1,$3);/*SET_LOCATION($$)*/;}
    ;
simpleexpression : additiveexpression relop additiveexpression {$$=new BinaryExpr($1,$2,$3);/*SET_LOCATION($$)*/;}
    | additiveexpression {$$=$1;/*SET_LOCATION($$)*/;}
    ;
relop : UNEQUAL {$$=BinaryExpr::BinaryOp::BINARYOP_NE;/*SET_LOCATION($$)*/;}
    | GE  {$$=BinaryExpr::BinaryOp::BINARYOP_GE;/*SET_LOCATION($$)*/;}
    | GT  {$$=BinaryExpr::BinaryOp::BINARYOP_GT;/*SET_LOCATION($$)*/;}
    | LE  {$$=BinaryExpr::BinaryOp::BINARYOP_LE;/*SET_LOCATION($$)*/;}
    | LT  {$$=BinaryExpr::BinaryOp::BINARYOP_LT;/*SET_LOCATION($$)*/;}
    | EQUAL {$$=BinaryExpr::BinaryOp::BINARYOP_EQ;/*SET_LOCATION($$)*/;}
    ;
additiveexpression : additiveexpression addop term {$$=new BinaryExpr($1,$2,$3);/*SET_LOCATION($$)*/;}
    |              term {$$=$1;/*SET_LOCATION($$)*/;}
    |              TRUE {$$=new IntExpr(1);/*SET_LOCATION($$)*/;}
    |              FALSE {$$=new IntExpr(0);/*SET_LOCATION($$)*/;}
    ;
addop : PLUS {$$=BinaryExpr::BinaryOp::BINARYOP_ADD;/*SET_LOCATION($$)*/;}
    |   MINUS {$$=BinaryExpr::BinaryOp::BINARYOP_SUB;/*SET_LOCATION($$)*/;}
    ;
term : term mulop factor {$$=new BinaryExpr($1,$2,$3);/*SET_LOCATION($$)*/;}
    |   factor {$$=$1;/*SET_LOCATION($$)*/;}
    ;
mulop : MUL {$$=BinaryExpr::BinaryOp::BINARYOP_MUL;/*SET_LOCATION($$)*/;}
    |   DIV {$$=BinaryExpr::BinaryOp::BINARYOP_DIV;/*SET_LOCATION($$)*/;}
    ;
factor :   LP expression RP {$$=$2;/*SET_LOCATION($$)*/;}
    | var {$$=$1;/*SET_LOCATION($$)*/;}
    | call {$$=$1;/*SET_LOCATION($$)*/;}
    | NUM {$$=new IntExpr($1);/*SET_LOCATION($$)*/;}
    ;
call : ID LP args RP {$$ =new CallExpr($1,$3);/*SET_LOCATION($$)*/;}
    ;
args : arglist {$$=$1;/*SET_LOCATION($$)*/;}
    | {$$=NULL;}
    ;
arglist : arglist COMMA expression {$$=$1;$$->push_back($3);/*SET_LOCATION($$)*/;}
    | expression {$$=new Arglist();$$->push_back($1); /*SET_LOCATION($$)*/;}
    ;
%%
