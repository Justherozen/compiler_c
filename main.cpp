#include <stdio.h>
#include "syntaxparser.hpp"
#include "treenode.h"
#include "adddefine.hpp"
#include <fstream>
#include "codegen.hpp"
#include <map>
std::map<std::string,llvm::Value*> addrtable;

extern FILE* yyin;
FILE* fp;
//#define YYDEBUG 1
extern int graphindex;
extern int yydebug;
extern int lexError;
extern int syntaxError;
extern struct Node* root;
extern int yyrestart(FILE*);
extern int yyparse();
extern IRGenerator generator;
int yylex();

int main(int argc,char**argv){
    
    if (argc <= 1) return 1;
    FILE* fp = fopen(argv[1], "r");
    if (!fp)
    {
        perror(argv[1]);
	    return 1;
    }
    FILE *newfp = fopen("temp.txt", "w");
	int c;
	c = fgetc(fp);
	int state = 0;
	while (c != EOF)
	{
		if (state == 0)
		{
			if (c != '/')
			{
				fputc(c, newfp);
				c = fgetc(fp);
			}
			else
			{
				c = fgetc(fp);
				if (c == EOF || c != '*')
				{
					fputc('/', newfp);
				}
				else
				{
					state = 1;
					c = fgetc(fp);
				}
			}
		}
		else
		{
			if (c == '*')
			{
				c = fgetc(fp);
				if (c == '/')
				{
					state = 0;
				}
			}
			c = fgetc(fp);
		}
	}
	//fputc(c, newfp);

	fclose(newfp);
    adddefine("temp.txt");
	newfp = fopen("temp.txt", "r");
    yyrestart(newfp);
    //yydebug=1;
    yyparse();

    //printf("%s\n",root->name);
    printf("lexerror: %d,\tsyntaxerror:%d\n",lexError,syntaxError);

    generator.createPrintf();
	generator.createScanf();
    tree_search(root,0);
	draw_syntax_tree();
    Program_codeGen(root);

	std::string IR;
	llvm::raw_string_ostream OS(IR);
	OS << *generator.module;
	OS.flush();

	std::ofstream ofs("test_out.ll", std::ofstream::out);
	ofs << IR;
	ofs.close();

    return 0;
/*
    if(argc>1){
        if(!(yyin=fopen(argv[1],"r"))){
            perror(argv[1]);
            return 1;
        }
    }
while (yylex() != 0);
    return 0;
*/
};