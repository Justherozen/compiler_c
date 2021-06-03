#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H
#include <stdio.h>
#include <stdlib.h>
#include "treenode.h"
#include <string.h>
#include <assert.h>


typedef struct FieldListNode* FieldList;

typedef struct InfoNode* Info;
//typedef struct FieldList_* FieldList;
struct FieldListNode{//类型信息+名字+后继，符号表中每一个变量的完整信息
	char name[32];//域的名字;和树节点名字长度一样;
	Info info;//域的类型;
	FieldList nextfield;//下一个域
};
struct InfoNode{//类型信息
	enum { BASIC=0,ARRAY=1,STRUCTURE=2,FUNCTION=3,STRUCT_NAME_=4} kind;
	union{
		//基本类型
		int basic;//0表示int,1表示float;
		//数组类型信息包括元素类型与数组大小构成
		struct{ Info elem;int size;}array_;
		//结构体类型的信息是一个链表
		struct{FieldList structure;//结构体的包含的数据   
                char *name;//结构体名字
                }structure_;
		struct{
			Info returnparam;//返回的参数类型
			int paramnums;//输入的参数数量
			FieldList params;//函数的具体参数;
			}function;
}u;
};



struct Symbol_node{//符号表中每一个节点，包括节点的信息fieldlist、十字链表后续，种类等信息
	enum { VARIABLE=0, STRUCT_NAME=1, FUNCTION_NAME=2 } kind;
	struct Symbol_node* hashnext;//在hashtable中同一个值的下一个;
	struct Symbol_node* comstnext;//控制作用域,退出compst时删除相应的元素,初始化为NULL;
	struct FieldListNode field;//用来存类型+名字;
	//char name[32];
	char* structsymbol_name;//sturct 里面的元素专用,防止超过32位;
	int ifdef;//是定义还是声明?定义是1,声明是0 
	int depth;//深度信息,备用;
};

struct Symbol_bucket{
	struct Symbol_node* head;//指向该hash值的第一个节点;
	struct Symbol_bucket*next;//仅在用于控制作用域的局部符号表(链表)中使用

};//全局符号表头;
struct dec_func{
	char name[32];
	int column;
	struct dec_func* next;
};

int insert_symbol_hash(Info Info,char* name,int ifdef,int depth);
int insert_symbol_compst(struct Symbol_node*p,struct Symbol_bucket* scope );//使用的时候p 的 hashnext,comstnext需要首先赋值NULL;
int query_symbol(Info* Info,char*name,int*ifdef,int depth);//给名字查Info和ifdef;如果不存在返回-1,否则返回0;这里查的depth和里面的depth相等的时候才认为存在,因此相当于只是查当前作用域的;
int query_symbol_exist(Info* Info,char*name,int*ifdef,int depth);//给名字查Info和ifdef;如果不存在返回-1,否则返回0;这里查的depth<=查到的时候认为存在,因此相当于查所有作用域的;
int query_struct_name(char*name);//仅仅指查名字;
int query_symbol_name(char*name,int depth);//仅仅指查名字,并且只查当前层;
int query_struct(Info*Info,char*name);//结构体域里面使用的;
int insert_struct(Info Info,char*name);
struct Symbol_bucket* init_symboltable();
int delete_symbol(Info Info,char*name,int*ifdef);//删除符号;
int check_Info(Info A,Info B);//结构等价判断;0表示不同,1表示相同;
unsigned int hash_name(char*name);

struct Symbol_bucket *enter_scope();//进入作用域;返回一个函数头;
struct Symbol_bucket* exit_scope();//出作用域,删除;返回尾部作用域;
void show_global_table();
void show_scope_table();
void show_struct_table();

int check_Info_array_strong(Info A,Info B);
void push_function_dec(char*name,int column);
void check_function_def();

int query_symbol_exist2(Info* Info,char*name,int*ifdef,int depth,int*kind);


#endif