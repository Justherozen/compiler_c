%code requires {
#include "codegen.hpp"
#include <iostream>
}
%{
#include <stdio.h>
#include <stdarg.h>
#include <iostream>
#include"treenode.h"
extern int yylineno;
typedef struct Node* node;
//#define YYSTYPE struct Node*
int emptyflag=0;
int emptystart=0;
int syntaxError=0;
struct Node *add_parsing_node(char* Name,int column);
void  fill_child_node(struct Node *parent,int num_args,...);
void tree_search(struct Node* cur,int depth);
extern int yylex(void);
void yyerror(const char *s) { 
    std::printf("Error: %s\n", s);
    std::exit(1); 
}
struct Node* root;
%}
%union {
  struct Node* node;
}

%locations
//终结符类型绑定
%token  <node>INT
%token  <node>FLOAT
%token  <node>STRING
%token  <node>MY_ID
%token  <node>SEMI
%token  <node>COMMA
%token  <node>ASSIGNOP
%token  <node>RELOP
%token  <node>PLUS
%token  <node>MINUS
%token  <node>STAR
%token  <node>DIV
%token  <node>AND
%token  <node>OR
%token  <node>DOT
%token  <node>NOT
%token  <node>TYPE
%token  <node>MY_LP
%token  <node>RP
%token  <node>LB
%token  <node>RB
%token  <node>MY_LC
%token  <node>MY_RC
%token  <node>STRUCT
%token  <node>RETURN 
%token  <node>IF
%token  <node>ELSE
%token  <node>WHILE

//非终结符类型绑定
%type <node>Program
%type <node>ExtDecList
%type <node>ExtDef
%type <node>ExtDefList
%type <node>Specifier
%type  <node>StructSpecifier
%type <node>OptTag
%type  <node>Tag
%type <node> VarDec
%type  <node>FunDec
%type  <node>VarList
%type <node>ParamDec
%type <node> CompSt
%type  <node>StmtList
%type  <node>Stmt
%type <node>DefList
%type <node>Def
%type <node>DecList
%type <node>Dec
%type <node>Exp
%type <node>Args

//结合性定义
%start Program
%right ASSIGNOP
%left OR
%left AND 
%left  RELOP
%left PLUS MINUS
%left STAR DIV
%right NOT 
%left UMINUS 
%left  DOT 
%left LB RB 
%left MY_LP RP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE
%% 
//初始的program,包含了多个ExtDef，每个ExtDef表示一个全局变量、结构体或函数的定义
Program: ExtDefList {
    $$=add_parsing_node("Program",@$.first_line);
    fill_child_node($$,1,$1);
    root=$$;
    if(emptyflag==0){
    root->column=emptystart;}
    } ;
//使用右递归
ExtDefList: ExtDef ExtDefList {
    $$=add_parsing_node("ExtDefList",@$.first_line);  
    fill_child_node($$,2,$1,$2);
    }
    | {
    $$=NULL;
    emptystart=yylineno;
    };
    
//表示全局变量，例如“int glob-al1, global2;”。
ExtDef:Specifier ExtDecList SEMI{
    $$=add_parsing_node("ExtDef",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
    };
    | Specifier FunDec CompSt{//函数体的定义,其中Specifier是返回类型，FunDec是函数头，CompSt表示函数体
    $$=add_parsing_node("ExtDef",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
    };
    |Specifier FunDec SEMI{//函数体声明
    $$=add_parsing_node("ExtDef",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
    };
    |error SEMI{//错误的所有类型
    syntaxError+=1;
    };
    |Specifier error SEMI{
    syntaxError+=1;
    };
    /*  |Specifier error{
    syntaxError+=1; //shift/reduce error
    }
    */
    |
    error Specifier SEMI{
    syntaxError+=1;
    }
ExtDecList: VarDec{//单个变量
    $$=add_parsing_node("ExtDecList",@$.first_line);
    fill_child_node($$,1,$1);
};
    | VarDec COMMA ExtDecList{//右递归的过程
    $$=add_parsing_node("ExtDecList",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
    };
    |
    VarDec error ExtDefList{//终结符位置需要考虑错误
    syntaxError+=1;
    }

Specifier: TYPE{//类型或者是结构体
    $$=add_parsing_node("Specifier",@$.first_line);
    fill_child_node($$,1,$1);
    };

VarDec:MY_ID{//int a中的a
    $$=add_parsing_node("VarDec",@$.first_line);
    fill_child_node($$,1,$1);
};
    | MY_ID LB INT RB{//int a[10]中的a[10]
        $$=add_parsing_node("VarDec",@$.first_line);
        fill_child_node($$,4,$1,$2,$3,$4);
    };
    | MY_ID LB RB{//int a[10]中的a[10]
        $$=add_parsing_node("VarDec",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);
    };
    |VarDec LB error RB{
    syntaxError+=1;
    }
FunDec:MY_ID MY_LP VarList RP{//函数头定义
    $$=add_parsing_node("FunDec",@$.first_line);
    fill_child_node($$,4,$1,$2,$3,$4);
};
    |  MY_ID MY_LP RP{//参数列表没有
    $$=add_parsing_node("FunDec",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
    };
    |MY_ID MY_LP error RP{
    syntaxError+=1;
    }
    |error MY_LP VarList RP{
        syntaxError+=1;
    }
VarList:ParamDec COMMA VarList{//参数列表，右递归
    $$=add_parsing_node("VarList",@$.first_line);
    fill_child_node($$,3,$1,$2,$3); 
};
    | ParamDec{//单独一个参数
    $$=add_parsing_node("VarList",@$.first_line);
    fill_child_node($$,1,$1);
    };
ParamDec:  Specifier VarDec{//类型+参数名
    $$=add_parsing_node("ParamDec",@$.first_line);
    fill_child_node($$,2,$1,$2);
};

CompSt:MY_LC DefList StmtList MY_RC{//先是一串变量定义+一串语句
        $$=add_parsing_node("CompSt",@$.first_line);
        fill_child_node($$,4,$1,$2,$3,$4);
};

StmtList:Stmt StmtList{//右递归或者空
        $$=add_parsing_node("StmtList",@$.first_line);
        fill_child_node($$,2,$1,$2);
};
        | {
         $$=NULL;
                  };
Stmt:Exp SEMI{//末尾是分号的表达式
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,2,$1,$2);
};        
|CompSt{//花括号括起来的语句块
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,1,$1);
}; 
|RETURN Exp SEMI{//return语句
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);
};
|IF MY_LP Exp RP Stmt %prec LOWER_THAN_ELSE{//IF语句，优先级没有if else语句高
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,5,$1,$2,$3,$4,$5);
};
|IF MY_LP Exp RP Stmt ELSE Stmt{//IF语句
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,7,$1,$2,$3,$4,$5,$6,$7);
};
|WHILE MY_LP Exp RP Stmt{//while
        $$=add_parsing_node("Stmt",@$.first_line);
        fill_child_node($$,5,$1,$2,$3,$4,$5);
};
|error SEMI {
    syntaxError+=1;
};
| Exp error SEMI{
    syntaxError+=1;
};
|RETURN Exp error{
    syntaxError+=1;
};
|RETURN error SEMI{
    syntaxError+=1;
}


DefList:Def DefList{//声明时的右递归
    $$=add_parsing_node("DefList",@$.first_line);
    fill_child_node($$,2,$1,$2);
};
    | {
    $$=NULL;               
    };
Def:Specifier DecList SEMI{
    $$=add_parsing_node("Def",@$.first_line);
    fill_child_node($$,3,$1,$2,$3);

};|
    Specifier error SEMI{
      syntaxError+=1;
    };
  | 
    Specifier DecList error{
      syntaxError+=1;
    };
DecList:Dec{
    $$=add_parsing_node("DecList",@$.first_line);
    fill_child_node($$,1,$1);

};
    | Dec COMMA DecList{;//左递归
        $$=add_parsing_node("DecList",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);
    }
Dec:VarDec{//int a
    $$=add_parsing_node("Dec",@$.first_line);
    fill_child_node($$,1,$1);

};
    |VarDec ASSIGNOP Exp{//int a=1
    $$=add_parsing_node("Dec",@$.first_line);
    fill_child_node($$,3,$1,$2,$3);
        };

Exp:Exp ASSIGNOP Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

};
        | Exp AND Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        | Exp OR Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        | Exp RELOP Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        | Exp PLUS Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |Exp MINUS Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |Exp STAR Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |Exp DIV Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |MY_LP Exp RP{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |MINUS Exp %prec UMINUS{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,2,$1,$2);

        };
        |NOT Exp{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,2,$1,$2);

        };
        |MY_ID MY_LP Args RP{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,4,$1,$2,$3,$4);
        };
        |MY_ID MY_LP RP{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |MY_ID LB Exp RB{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,4,$1,$2,$3,$4);

        };
        |Exp DOT MY_ID{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

        };
        |MY_ID{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,1,$1);

        };
        |INT {
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,1,$1);

        };
        |FLOAT{
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,1,$1);
        
        };
        |STRING {
        $$=add_parsing_node("Exp",@$.first_line);
        fill_child_node($$,1,$1);
        
        };
        |Exp ASSIGNOP error{
          syntaxError+=1;
        };
        |Exp AND error{
          syntaxError+=1;
        };
        |Exp OR error{
          syntaxError+=1;
        }
        |Exp RELOP error{
          syntaxError+=1;
        }
        |Exp PLUS error{
          syntaxError+=1;
        }
        |Exp MINUS error{
          syntaxError+=1;
        }
        |Exp STAR error{
          syntaxError+=1;
        }
        |Exp DIV error{
          syntaxError+=1;
        }
        |MY_LP error RP{
          syntaxError+=1;
        }
        |MINUS error{
          syntaxError+=1;
        }
        |NOT error{
          syntaxError+=1;
        }
        |MY_ID MY_LP error RP{
          syntaxError+=1;
        }
        |Exp LB error RB{
          syntaxError+=1;
        }
        
Args:Exp COMMA Args{//实参列表
        $$=add_parsing_node("Args",@$.first_line);
        fill_child_node($$,3,$1,$2,$3);

};
          | Exp{
        $$=add_parsing_node("Args",@$.first_line);
        fill_child_node($$,1,$1);

          };
%%

int yyerror(char*msg){
  syntaxError+=1;
  printf("Error type B at Line %d: %s.\n",yylineno,msg);
}


struct Node* add_parsing_node(char* Name,int column){
 struct Node* Root=(struct Node*)malloc(sizeof(struct Node));
 Root->child=NULL;
 Root->next_sib=NULL; 
 strcpy(Root->name,Name);
 Root->from=1;
 Root->type=OTHERS;
 Root->column=column;

#ifdef DEBUGBISONNOW
printf("name: %s\tline:%d\n",Name,column);
#endif
return Root;
}

void  fill_child_node(struct Node *parent,int num_args,...){//填充生成树的儿子
va_list able;
va_start(able,num_args);
struct Node * indexnode=NULL;
parent->child=va_arg(able,struct Node*);;
indexnode=parent->child;
for(int i=1;i<num_args;i++){
   indexnode->next_sib=va_arg(able,struct Node*);
   if(indexnode->next_sib!=NULL){
     indexnode=indexnode->next_sib;
   }
}
}

