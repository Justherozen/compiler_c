#include <stdio.h>
#include "syntaxparser.hpp"
#include "treenode.h"
#include "semantic.h"
#include <fstream>
#include "codegen.hpp"

extern FILE* yyin;
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
    FILE* f = fopen(argv[1], "r");
    if (!f)
    {
        perror(argv[1]);
	    return 1;
    }
    yyrestart(f);
    //yydebug=1;
    yyparse();

    //printf("%s\n",root->name);
    printf("lexerror: %d,\tsyntaxerror:%d\n",lexError,syntaxError);

    generator.createPrintf();
	generator.createScanf();
	tree_search(root,0);
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