#include "treenode.h"
int graphindex=0;
extern FILE* fp;
extern struct Node* root;
void tree_search(struct Node* cur,int depth){
  if(cur==NULL){
    return;
  }
  for(int i=0;i<depth;i++){
    printf("  ");
  }
    printf("%s",cur->name);
    if(cur->from==1){
        printf(" (%d)",cur->column);
    }
    else if(cur->from==0){
        if(cur->type==LEX_INT){
            printf(": %d",cur->int_contant);
        } 
        else if(cur->type==LEX_FLOAT){
            printf(": %f",cur->float_contant);
        }
        else if(cur->type==LEX_ID){
            printf(": %s",cur->string_contant);
        }
        else if(cur->type==LEX_TYPE){
            printf(": %s",cur->string_contant);
        }
        else{
            ;
        }
    }
    printf("\n");
    tree_search(cur->child,depth+1);
    tree_search(cur->next_sib,depth);
}
void draw_syntax_tree(){
    FILE* fp=fopen("./drawsyntextree.dot","w");
    fprintf(fp,"digraph first2{");
    tree_search_vis(root,0,"Program",0,fp);
    fprintf(fp,"}");
    fclose(fp);
}

void tree_search_vis(struct Node* cur,int depth,char fromname[32],int index,FILE* fp){
    if(cur==NULL){
        return;
    }
    if(strcmp(cur->name,"Program")==0){
        fprintf(fp,"Program_0[label=\"Program\"]");
        tree_search_vis(cur->child,depth+1,"Program",0,fp);
    }
    else{
    fprintf(fp,"%s_%d",fromname,index);
    fprintf(fp,"->");
    fprintf(fp,"%s_%d;\n",cur->name,graphindex);
    fprintf(fp,"%s_%d[label=\"%s",cur->name,graphindex,cur->name);
    if(cur->from==1){
      fprintf(fp,"\\nline:%d",cur->column);
    }
    else if(cur->from==0){
      if(cur->type==LEX_INT){
        fprintf(fp,"\\nvalue:%d",cur->int_contant);
      } 
      else if(cur->type==LEX_FLOAT){
        fprintf(fp,"\\nvalue:%f",cur->float_contant);
      }
      else if(cur->type==LEX_ID){
        fprintf(fp,"\\nvalue:%s",cur->string_contant);
      }
      else if(cur->type==LEX_TYPE){
        fprintf(fp,"\\nvalue:%s",cur->string_contant);
      }
      else{
        ;
      }
    }
    fprintf(fp,"\"];\n");
    int curnum=graphindex;
    graphindex++;
    tree_search_vis(cur->child,depth+1,cur->name,curnum,fp);
    tree_search_vis(cur->next_sib,depth,fromname,index,fp);
    }
}

