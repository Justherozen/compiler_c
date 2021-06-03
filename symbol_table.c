#include "symbol_table.h"
//目标设计：散列表+符号表栈
//主要逻辑:
//全局符号表: 一个散列表,构成是结构体数组链表,通过Imperative style形式维护;
/*
| |->a->b
| |->c
| |->d->e->f
| |->a2
栈:
--
a->f
c->d->a2
b->e
--
每一层作用域定义的变量在栈的同一层,记录在局部符号表
*/
//局部符号表: （工具人）一个二层链表,每次进入一个语句块,需要为这一层的语句块新建一个链表用来串联层中新定义的变量，每次离开一个语句块，则需要顺着代表该层的语句块的链表将所有本层定义变量全部删除；
//每进入一个作用域,局部符号表的链表新建一个元素a到末尾,返回这个元素a到外层(给一个函数),这个就是作用域;在该作用域中,新建的元素都要纵向的和a链接;退出作用域的时候顺着a删除;对于函数int temp(int a){int b=a;};b,a应该在一个作用域里面;
/*
c
^
|
b->b1->b2
^
|
a->a1->a2
*/
/*
1.完成不测作用域的符号表,完成基本结构+2.1，
2.要求2.2可能的实现: 用上述的局部符号表串表达;亦或者使用十字链表;
3.要求2.1需要求改产生式,声明和定义的冲突,拟才用一个flag表示;
4.要求2.3结构等价,可以在符号表里面实现一个check infoA,B的布尔函数解决;

*/
//结构体也需要一个符号表来存;暂记

/*基本内容*/
#define SYMBOL_LEN 0x3fff
struct Symbol_bucket global_head[SYMBOL_LEN];
struct Symbol_bucket struct_head[SYMBOL_LEN];
struct Symbol_bucket* scope_table=NULL;//作用域控制链表;
struct dec_func*dec_func_head=NULL;//函数定义链表,最后遍历检查;
void push_function_dec(char*name,int column){
	if(dec_func_head==NULL){
		dec_func_head=(struct dec_func*)malloc(sizeof(struct dec_func));
		strcpy(dec_func_head->name,name);
		dec_func_head->column=column;
		dec_func_head->next=NULL;
	}else{
		struct dec_func*temp=dec_func_head;
		while(temp->next!=NULL){
			temp=temp->next;
		}
		temp->next=(struct dec_func*)malloc(sizeof(struct dec_func));
		strcpy(temp->next->name,name);
		temp->next->column=column;
		temp->next->next=NULL;
	}
}
void check_function_def(){
	struct dec_func*temp=dec_func_head;
	while(temp!=NULL){
		char*name=temp->name;
		int queryifdef=-1;
		Info uselessinfo=(Info)(malloc(sizeof(struct InfoNode)));
		int result=query_symbol(&uselessinfo,name,&queryifdef,0);
		if(queryifdef!=1){
			printf("Error type %d at Line %d: ", 18, temp->column);
			printf("Undefined function \"%s\".\n",temp->name);
		}

		temp=temp->next;
	}
}
struct Symbol_bucket* init_symboltable(){
	for(int i=0;i<SYMBOL_LEN;i++){
		global_head[i].head=NULL;
		struct_head[i].head=NULL;
	}
	scope_table=malloc(sizeof(struct Symbol_bucket));
	scope_table->next=NULL;
	scope_table->head=NULL;
	return scope_table;
}
struct Symbol_bucket*enter_scope(){
	struct Symbol_bucket *newscope=malloc(sizeof(struct Symbol_bucket));
	newscope->next=NULL;
	newscope->head=NULL;
	struct Symbol_bucket *temp=scope_table;
	while(temp->next!=NULL){
		temp=temp->next;
	}
	temp->next=newscope;
	return newscope;
}
struct Symbol_bucket* exit_scope(){
	struct Symbol_bucket*temp=scope_table;
	struct Symbol_bucket* before_temp=scope_table;
	while(temp->next!=NULL){
		before_temp=temp;
		temp=temp->next;
	}
	if(temp==scope_table){
		printf("It is the only scope,fail to exit this scope\n");
		assert(0);
	}else if(temp->head!=NULL){
			struct Symbol_node* temp_scope=temp->head;//scope链表的最后一个scope的表头
			struct Symbol_node* before_temp_scope=temp_scope;//scope链表的一个scope之前一个scope的表头
			int nodenum=0;
			while(temp_scope->comstnext!=NULL){
				before_temp_scope=temp_scope;
				temp_scope=temp_scope->comstnext;
				nodenum+=1;
			}
			struct  Symbol_node** scope_list=(struct Symbol_node**)malloc(sizeof(struct Symbol_node**)*(nodenum+2));
			temp_scope=temp->head;//scope链表的最后一个scope的表头
			before_temp_scope=temp_scope;//scope链表的一个scope之前一个scope的表头
			nodenum=0;
			scope_list[nodenum]=temp_scope;//第一个
			while(temp_scope->comstnext!=NULL){
				scope_list[nodenum]=temp_scope;//放了每一个节点
				before_temp_scope=temp_scope;
				temp_scope=temp_scope->comstnext;
				nodenum+=1;
			}
			scope_list[nodenum]=temp_scope;//最后一个;scopelist里面存的是要退出scope里的每一个node的数组
			int tempnodenum=nodenum;
			//首先找到这个symbol在table里面的前一项,然后横向删除,然后纵向删除;
			for(;nodenum>=0;nodenum--){//从后往前删除
				int value=hash_name(scope_list[nodenum]->field.name);
				if(global_head[value].head==NULL){
					printf("fail to drop table, %s not found!\n",scope_list[nodenum]->field.name);
					assert(0);
				}
				struct Symbol_node*temp=global_head[value].head;//hash值链表的头部;
				int findindex=0;
				if(temp==scope_list[nodenum]){//global_head的头部就是要找的
					global_head[value].head=scope_list[nodenum]->hashnext;
					//PR("drops:%s \n",scope_list[nodenum]->field.name);
					free(scope_list[nodenum]);
				}else{//global_head的头部不是要找的;b,head->a->b temp = head;temp=a;temp->hashnext=b;退出;
				while(temp->hashnext!=NULL){//从头部向后开始查找
					if(temp->hashnext==scope_list[nodenum]){
						findindex=1;
						break;
					}
					temp=temp->hashnext;
				}
				if(findindex==0){
					printf("fail to drop table, %s not found!\n",scope_list[nodenum]->field.name);
					assert(0);
				}
				printf("successfully drops:%s \n",scope_list[nodenum]->field.name);
				temp->hashnext=scope_list[nodenum]->hashnext;;
				free(scope_list[nodenum]);
				}
			}
			free(scope_list);
			scope_list=NULL;
	}
	before_temp->next=NULL;
	free(temp);
	temp=NULL;
	return before_temp;//返回前一个scope
}

void show_global_table(){
	printf("-----------------------global_table_below----------------------\n");
	for(int i=0;i<SYMBOL_LEN;i++){
		if(global_head[i].head!=NULL){
			printf("i:%d ",i);
			struct Symbol_node*temp=global_head[i].head;
			while(temp!=NULL){
					printf("name:%s type:%d ,",temp->field.name,temp->field.info->kind);
					temp=temp->hashnext;
			}
			printf("\n");
		};
	};
	printf("-----------------------global_table_above----------------------\n");
}
void show_scope_table(){
	printf("-----------------------scope_table_below----------------------\n");
	struct Symbol_bucket*temp=scope_table;
	int cnt=0;
	while(temp!=NULL){
		printf("cnt: %d ",cnt);	
		struct Symbol_node *temp1=temp->head;
		while(temp1!=NULL){
			printf("%s ",temp1->field.name);
			temp1=temp1->comstnext;
		}
		printf("\n");
		temp=temp->next;
		cnt+=1;
	}

	printf("-----------------------scope_table_above----------------------\n");
}
void show_struct_table(){
	printf("-----------------------scope_struct_below----------------------\n");
		for(int i=0;i<SYMBOL_LEN;i++){
		if(struct_head[i].head!=NULL){
			printf("i:%d ",i);
			struct Symbol_node*temp=struct_head[i].head;
			while(temp!=NULL){
					printf("name:%s type:%d ,",temp->structsymbol_name,temp->field.info->kind);
					temp=temp->hashnext;
			}
			printf("\n");
		};
	};

	printf("-----------------------scope_struct_above----------------------\n");
}

int insert_symbol_hash(Info info,char* name,int ifdef,int depth){
	//to be done;
	int value=hash_name(name);
	if(global_head[value].head==NULL){
		struct Symbol_node* newhead=malloc(sizeof(struct Symbol_node));
		newhead->field.info=info;
		newhead->hashnext=NULL;
		strcpy(newhead->field.name,name);
		newhead->depth=depth;
		newhead->ifdef=ifdef;
		global_head[value].head=newhead;
	}else{
		struct Symbol_node* head=global_head[value].head;
		struct Symbol_node* newhead=malloc(sizeof(struct Symbol_node));
		newhead->field.info=info;
		newhead->hashnext=head;
		strcpy(newhead->field.name,name);
		newhead->ifdef=ifdef;
		newhead->depth=depth;
		global_head[value].head=newhead;
	}

	return 0;
}
int insert_symbol_compst(struct Symbol_node* p,struct Symbol_bucket* scope){
	
	char *symbol_name=p->field.name;
	if(p->comstnext!=NULL||p->hashnext!=NULL){
		printf("the comstnext/hashnext of the node to be inserted should be NULL!\n");
		assert(0);

	}
	int value=hash_name(symbol_name);
	if(scope==NULL){
		printf("Scope is NULL!\n");
		assert(0);
	}else
	{
		struct Symbol_node*tempnode=scope->head;
		if(tempnode==NULL){
			scope->head=p;
			
		}else{
			while(tempnode->comstnext!=NULL){
				tempnode=tempnode->comstnext;
			}//找到当前控制域的尾节点;
			tempnode->comstnext=p;
		}
		if(global_head[value].head==NULL){
			global_head[value].head=p;
		}else{
			struct Symbol_node*head=global_head[value].head;
			p->hashnext=head;
			global_head[value].head=p;
		}
	}
}

int insert_struct(Info info,char*name){
	int value=hash_name(name);
	//printf("in insert struct\n");
	if(struct_head[value].head==NULL){
		struct Symbol_node*temp=malloc(sizeof(struct Symbol_node));
		temp->field.info=info;
		temp->hashnext=NULL;
		//strcpy(temp->field.name,name);
		char*structsymbol_name=(char*)malloc(strlen(name)+1);
		strcpy(structsymbol_name,name);
		temp->structsymbol_name=structsymbol_name;
		struct_head[value].head=temp;
	}else{
		//结构体不允许重名;
		struct Symbol_node*head=struct_head[value].head;
		if(strcmp(head->field.name,name)==0){
			//printf("In insert_struct redifined struct\n");
			return -1;
		}
		else{
			struct Symbol_node*temp=malloc(sizeof(struct Symbol_node));
			temp->field.info=info;
			temp->hashnext=head;
			strcpy(temp->field.name,name);
			struct_head[value].head=temp;//头插;
		}
		;
	}
	return 0;
}

int query_struct(Info*info,char*name){//存在 return 0,不存在return -1
	int value=hash_name(name);
	if(struct_head[value].head==NULL){
		return -1;//不存在
	}
	else{
		struct Symbol_node*temp=struct_head[value].head;
		int flag=0;
		while(temp!=NULL){
			if(strcmp(temp->structsymbol_name,name)==0){
				*info=temp->field.info;
				flag=1;
				return 0;//找到
			}
			temp=temp->hashnext;
			if(temp==NULL){
				break;
			}
		}
		if(flag==0){
			return -1;//没找到;
		}
		
	}

}
int query_struct_name(char*name){
	Info nullinfo=(Info)malloc(sizeof(struct InfoNode));
	
	return query_struct(&nullinfo,name);
}
int query_symbol_name(char*name,int depth){
	Info nullinfo=(Info)malloc(sizeof(struct InfoNode));
	int nulldef;
	return query_symbol(&nullinfo,name,&nulldef,depth);
}
int query_symbol_exist2(Info* info,char*name,int*ifdef,int depth,int*kind){//存在 return 0,不存在return -1
	int value=hash_name(name);
//	printf("In query%s\n",name);
	if(global_head[value].head==NULL){
	//	printf("OMG!!!!!!!We don't have this symbol!!");
		return -1;//没有命名,
	}else{
		struct Symbol_node*temp=global_head[value].head;
		int flag=0;
		while(temp!=NULL){
			if(strcmp(temp->field.name,name)==0&&depth>=temp->depth){//进入一个局部作用域之后depth+=1,因此当要找的depth小于depth的时候说明该层的前一层有;
			//	printf("able:%d\n",temp->info->kind);
				*info=temp->field.info;
				// if(temp->field.info==NULL){
				// 	printf("GG\n");
				// }
				*ifdef=temp->ifdef;
				*kind=temp->kind;
				flag=1;
				return 0;
			}
			temp=temp->hashnext;
			if(temp==NULL){
				break;
			}
		}
		if(flag==0){
			return -1;//没有找到
		}
	}

}



int query_symbol(Info* info,char*name,int*ifdef,int depth){//存在 return 0,不存在return -1
	int value=hash_name(name);
//	printf("In query%s\n",name);
	if(global_head[value].head==NULL){
	//	printf("OMG!!!!!!!We don't have this symbol!!");
		return -1;//没有命名,
	}else{
		struct Symbol_node*temp=global_head[value].head;
		// printf("herer");
		// if(temp->hashnext==NULL){
		// 	printf("herer");
		// }
		int flag=0;
		while(temp!=NULL){
			if(strcmp(temp->field.name,name)==0&&depth==temp->depth){//在同一层才算被找到,否则不算;
			//	printf("able:%d\n",temp->info->kind);
				*info=temp->field.info;
				*ifdef=temp->ifdef;
				flag=1;
				return 0;
			}
			temp=temp->hashnext;
			if(temp==NULL){
				break;
			}
		}
		if(flag==0){
		//	printf("OMG2!!!!!!!We don't have this symbol!!");
			return -1;//没有找到
		}
	}
}
int query_symbol_exist(Info* info,char*name,int*ifdef,int depth){
		int value=hash_name(name);
//	printf("In query%s\n",name);
	if(global_head[value].head==NULL){
	//	printf("OMG!!!!!!!We don't have this symbol!!");
		return -1;//没有命名,
	}else{
		struct Symbol_node*temp=global_head[value].head;
		// printf("herer");
		// if(temp->hashnext==NULL){
		// 	printf("herer");
		// }
		int flag=0;
		while(temp!=NULL){
			if(strcmp(temp->field.name,name)==0&&depth>=temp->depth){//进入一个局部作用域之后depth+=1,因此当要找的depth小于depth的时候说明该层的前一层有;
			//	printf("able:%d\n",temp->info->kind);
				*info=temp->field.info;
				// if(temp->field.info==NULL){
				// 	printf("GG\n");
				// }
				*ifdef=temp->ifdef;
				flag=1;
				return 0;
			}
			temp=temp->hashnext;
			if(temp==NULL){
				break;
			}
		}
		if(flag==0){
		//	printf("OMG2!!!!!!!We don't have this symbol!!");
			return -1;//没有找到
		}
	}




}



int delete_symbol(Info info,char*name,int*ifdef){
	//to be done;

	return 0;
}
int check_info(Info A,Info B){
	FieldList A_f=A->u.structure_.structure;
	FieldList B_f=B->u.structure_.structure;
	if(A==B){
		return 1;
	}
	else{
		if(A==NULL){
			printf("Type A is NULL\n");
			assert(0);
			return 0;
		}else if(B==NULL){
			printf("Type B is NULL\n");
			assert(0);
			return 0;
		}
		if(A->kind!=B->kind){
			return 0;
		}
		else{
			// FieldList A_f=A->u.structure_.structure;
			// FieldList B_f=B->u.structure_.structure;
			switch (A->kind){
				case BASIC:{
					//printf("BASIC: A:%d B:%d \n",A->u.basic,B->u.basic);
					return A->u.basic==B->u.basic;
					break;}
				case ARRAY:{//维度一样就行了;
					// if(A->u.array_.size!=B->u.array_.size){
					// 	return 0;
					// }
					// //否则size一样,比较info
					// int result1=check_info(A->u.array_.elem,B->u.array_.elem);
					// return result1;
					//数组弱等价: 维度一样;
					int result2=0;
					int cnt1=0;int cnt2=0;
					Info temp1=A;Info temp2=B;
				//	printf("A:%d size:%d\n",A->kind,A->u.array_.size);
					// if(A->u.array_.elem==NULL){
					// 	printf("here\n");
					// }
					//printf("next kind:%d\n",A->u.array_.elem->u.array_.elem->kind)	;
					while(temp1!=NULL){
						temp1=temp1->u.array_.elem;
						cnt1+=1;
						if(temp1->kind!=ARRAY)break;
					}
					while(temp2!=NULL){
						temp2=temp2->u.array_.elem;
						cnt2+=1;
						if(temp2->kind!=ARRAY)break;//我去这里tm居然有错的!
					}
				//	printf("cnt1:%d cnt2:%d \n",cnt1,cnt2);
					result2=(cnt1==cnt2);
					return result2;
					break;}
				case STRUCTURE:{
					//神必报错:a label can only be part of a statement and a declaration is not a statement,加了一个大括号就好了;
					PR("HERE\n");
					FieldList A_f=A->u.structure_.structure;
					FieldList B_f=B->u.structure_.structure;
					while(A_f!=NULL&&B_f!=NULL){
						A_f=A_f->nextfield;
						B_f=B_f->nextfield;
						;
					}
					if(A_f!=NULL||B_f!=NULL){
						return 0;
					}
					//保证两者等长度;
					A_f=A->u.structure_.structure;
					B_f=B->u.structure_.structure;
					int flag=0;
					while(A_f!=NULL&&B_f!=NULL){

					//	PR("A: %d,B: %d\n",A_f->info->kind,B_f->info->kind);
						if(A_f->info->kind!=B_f->info->kind){
							return 0;
						}
						if(A_f->info->kind==ARRAY){
							int array_result=check_info_array_strong(A_f->info,B_f->info);
							if(array_result==0)return 0;
							else return 1;
						}else{
							if(check_info(A_f->info,B_f->info)==0){
								return 0;
							};
						}
						A_f=A_f->nextfield;
						B_f=B_f->nextfield;
						;
					}
					return 1;
					break;
				}
				case FUNCTION:{
					//To be done;
					//printf("FUNCTION check_info: To be done\n");
					if(A->u.function.paramnums!=B->u.function.paramnums){
						return 0;//函数参数个数不一样;
					}
					if(check_info(A->u.function.returnparam,B->u.function.returnparam)==0){
						return 0;
					}
					FieldList A_f=A->u.function.params;
					FieldList B_f=B->u.function.params;
					int flag=0;
					while(A_f!=NULL&&B_f!=NULL){
						if(check_info(A_f->info,B_f->info)==0){
							return 0;
						};
						A_f=A_f->nextfield;
						B_f=B_f->nextfield;						
					}
					return 1;
					break;
				}
				default:
					printf("check_info bug,A->kind cant't find!\n");assert(0);return 0;
			}

		}
	}

	return 0;
}

int check_info_array_strong(Info A,Info B){
//	PR("Strong!\n");
	if(A->u.array_.size!=B->u.array_.size){
		return 0;
	}
	//否则size一样,比较info
	int result1;
	if(A->u.array_.elem->kind!=B->u.array_.elem->kind){
		return 0;
	}
	if(A->u.array_.elem->kind==ARRAY){
		result1=check_info_array_strong(A->u.array_.elem,B->u.array_.elem);
	}else{
	result1=check_info(A->u.array_.elem,B->u.array_.elem);}
	return result1;
}

//备用项;
unsigned int hash_name(char*name){
	unsigned int val=0,i;
	for(;*name;++name){
		val=(val<<2)+*name;
		if(i=val&~0x3fff)val=(val^(i>>12))&0x3fff;//0x3fff实际上是全局符号表的长度
	}
	return val;
}
