#ifndef SEMANTIC_H
#define SEMANTIC_H
#include "symbol_table.h"
#include "treenode.h"
#include <string.h>
#include<stdlib.h>
#include <stdio.h>
#include <assert.h>
int semantic_check(struct Node*cur);
int Program_s(struct Node*cur);
int ExtDefList_s(struct Node* cur);
int ExtDef_s(struct Node*cur);
Info Specifier_s(struct Node*cur);//返回该节点的Info;
int ExtDecList(struct Node *cur,Info info);
FieldList Def_struct(struct Node*cur,char*struct_name);
FieldList VarDec_s(struct Node*cur,Info info);
FieldList Dec_struct(struct Node*cur,Info info);
char* safe_strcpy(char*des,char*source);
void error_s(int info,int column,char* content,char*content2);
char* safe_strcpy(char*des,char*source);//32位以内的strcpy,char a[31]='\0'
void FunDec_s(struct Node*cur,const int ifdef,const Info res_info,struct Symbol_bucket*scope);//节点,是否是声明,返回值类型;
int CompSt_s(struct Node*cur,struct Symbol_bucket*scope,Info res_info);
FieldList VarList_s(struct Node*cur,struct Symbol_bucket*scope);
FieldList ParamDec_s(struct Node*cur);
int DefList_s(struct Node*cur,struct Symbol_bucket*scope);
int Def_s(struct Node*cur,struct Symbol_bucket*scope);
int DecList_s(struct Node*cur,struct Symbol_bucket*scope,Info info);
int StmtList_s(struct Node*cur,struct Symbol_bucket*scope,Info res_info);
int Stmt_s(struct Node*cur,struct Symbol_bucket*scope,Info res_info);
int Dec_s(struct Node*cur,struct Symbol_bucket*scope,Info info);
int Arg_s(struct Node* cur,FieldList params);
Info Exp_s(struct Node*cur);//检查表达式得到info交给上层;
#endif