#ifndef TREENODE_H
#define TREENODE_H
#include <string.h>
#include <stdio.h>

typedef enum {
    LEX_INT=0,
    LEX_FLOAT=1,
    LEX_ID=2,
    LEX_TYPE=3,
    LEX_STRING=4,
    LEX_CHAR=5,
    OTHERS=6,
}NODE_TYPE;

extern FILE* fp;
struct Node{
    struct Node* child;//第一个孩子;
    struct Node* next_sib;//下一个兄弟节点
    char name[64];//节点名称
    union{
        int int_contant;
        float float_contant;
        char char_contant;
        char string_contant[256];//包含的内容
    };
    int from;//节点的类型,0表示lexical里面的,1表示syntax里面的;
    int column;//表示行数;
    NODE_TYPE type;// 0 表示int,1表示float,2表示ID,3表示type;
};
void tree_search(struct Node* cur,int depth);
void tree_search_vis(struct Node* cur,int depth,char fromname[32],int index,FILE* fp);
void draw_syntax_tree(void);
#endif