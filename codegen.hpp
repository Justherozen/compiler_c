#pragma once

#include <iostream>
#include <vector>
#include <map>
#include <string>
#include "llvm.hpp"
#include "treenode.h"

using namespace llvm;

class IRGenerator
{
public:
	LLVMContext context;
	IRBuilder<> *builder;
	Module *module;
	Function *mainFunction;
	Function *cur_function;
	std::vector<Function *> funcStack;

	std::map<std::string, Type *> arrayMap;
	Function *printf, *scanf;

	IRGenerator()
	{
		builder = new IRBuilder<>(context);
		module = new Module("main", context);
		cur_function = nullptr;
	}

	void generate(struct Node* root);
	GenericValue run();
	ExecutionEngine *genExeEngine();

	void setCurFunction(Function *func)
	{
		cur_function = func;
	}

	Function *getCurFunction()
	{
		return cur_function;
	}

	void pushFunction(Function *func)
	{
		funcStack.push_back(func);
	}

	void popFunction()
	{
		funcStack.pop_back();
	}

	Function *createPrintf()
	{
		std::vector<Type *> arg_types;
		arg_types.push_back(builder->getInt8PtrTy());
		auto printf_type = FunctionType::get(builder->getInt32Ty(), makeArrayRef(arg_types), true);
		auto func = Function::Create(printf_type, Function::ExternalLinkage, Twine("printf"), module);
		func->setCallingConv(CallingConv::C);
		printf = func;
		return func;
	}

	Function *createScanf()
	{
		auto scanf_type = FunctionType::get(builder->getInt32Ty(), true);
		auto func = Function::Create(scanf_type, Function::ExternalLinkage, Twine("scanf"), module);
		func->setCallingConv(CallingConv::C);
		scanf = func;
		return func;
	}
};

Value *LogErrorV(const char *Str);
AllocaInst *CreateEntryBlockAlloca(Function *TheFunction, StringRef VarName, Type *type);

Value *Program_codeGen(struct Node* root);
Value *ExtDeflist_codeGen(struct Node *root);
Value *ExtDef_codeGen(struct Node *root);
Value *ExtDec_codeGen(struct Node* root);
Value *FunDec_codeGen(struct Node* root);
Value *def_codeGen(struct Node* root);
Value *stmt_codeGen(struct Node* root);
Value *Exp_codeGen(struct Node* root);
Value* assign_codeGen(struct Node* root);
Value *Binary_codeGen(struct Node *root);
Value *int_codeGen(struct Node* root);
Value *float_codeGen(struct Node* root);
Value *string_codeGen(struct Node* root);
Value *Var_codeGen(struct Node* root);
Value *Return_codeGen(struct Node *root);
Value *CallExpr_codeGen(struct Node *root);
Value* If_codeGen(struct Node *root);
Value* While_codeGen(struct Node *root);


