#include <iostream>
#include <stdexcept>
#include "llvm.hpp"
#include "treenode.h"
#include "codegen.hpp"
#include <llvm/Transforms/Scalar/LoopUnrollPass.h>

using namespace llvm;
extern std::map<std::string,llvm::Value*> addrtable;
IRGenerator generator;

static std::map<std::string, Value *> NamedValues;

Value *LogErrorV(const char *Str)
{
	std::cout << Str << std::endl;
	return nullptr;
}

AllocaInst *CreateEntryBlockAlloca(Function *TheFunction, StringRef VarName, Type *type)
{
	IRBuilder<> Tmp(&TheFunction->getEntryBlock(), TheFunction->getEntryBlock().begin());
	return Tmp.CreateAlloca(type, nullptr, VarName);
}

Value *Program_codeGen(struct Node* root){
	return ExtDeflist_codeGen(root->child);
}

Value *ExtDeflist_codeGen(struct Node *root){
	if(root == nullptr)
		return nullptr;
	else
		return ExtDef_codeGen(root);
}

Value *ExtDef_codeGen(struct Node *root){
	if(root == nullptr)
		return nullptr;
	struct Node *kid = root->child;
	while(root!=nullptr){
		if(strcmp(root->child->child->name,"Specifier")==0 && strcmp(root->child->child->next_sib->name,"ExtDecList")==0) {
			ExtDec_codeGen(root->child);
		}
		else if (strcmp(root->child->child->name,"Specifier")==0 &&strcmp(root->child->child->next_sib->name,"FunDec")==0 && 
		strcmp(root->child->child->next_sib->next_sib->name,"CompSt")==0){
			FunDec_codeGen(root->child);
		}
		//else 
			//Funst_codeGen(root->child);
		if(root->child->next_sib == nullptr)
			break;
		root = root->child->next_sib;
	}
	return nullptr;
}

Value *ExtDec_codeGen(struct Node* root){
	LogErrorV("Ext-VarDecl");
	/* Set init value */
	struct Node* vardec = root->child->next_sib->child;
	Type* tp;

	std::string tmp;
    char zero = 0;
    for (int i = 0; i < 255; i++) tmp = tmp + zero;
    Constant *getstrtype = ConstantDataArray::getString(generator.context,tmp);

	if(strcmp(root->child->child->string_contant,"int")==0)
		tp = Type::getInt32Ty(generator.context);
	else if(strcmp(root->child->child->string_contant,"float")==0)
		tp = Type::getDoubleTy(generator.context);
	else if(strcmp(root->child->child->string_contant,"string")==0)
		tp = getstrtype->getType();
	else
		tp = Type::getInt8Ty(generator.context);
	
	std::string var_type = root->child->child->string_contant;
	while(vardec !=nullptr){
		Value *init_value = nullptr;
		
		if(var_type == "int")
			init_value = generator.builder->getInt32(0);
		else if(var_type == "float")
			init_value = ConstantFP::get(generator.builder->getDoubleTy(), 0);
		else if(var_type=="string")
			init_value = ConstantDataArray::getString(generator.context,tmp);
		else if(var_type=="char")
			init_value = generator.builder->getInt8(0);
		Value *alloc = nullptr;
		/* is var */
		if (vardec->child->next_sib == nullptr){
			alloc = new GlobalVariable(*(generator.module), tp, false, GlobalValue::ExternalLinkage, (Constant *)init_value, vardec->child->string_contant);
		}
		/* is array */
		else
		{
			int range = vardec->child->next_sib->next_sib->int_contant;
			Type *array_type = ArrayType::get(tp, range);
			alloc = new GlobalVariable(*(generator.module), array_type, false, GlobalValue::ExternalLinkage, (Constant *)init_value, vardec->child->string_contant);
			std::vector<llvm::Constant *> const_array_elems;
			for (int i = 0; i < range; i++)
			{
				const_array_elems.push_back((Constant *)init_value);
			}
			llvm::Constant *const_array = llvm::ConstantArray::get((ArrayType *)array_type, const_array_elems);
			((GlobalVariable *)alloc)->setInitializer(const_array);
		}
		addrtable.insert(std::pair<std::string,llvm::Value*>(std::string(vardec->child->string_contant),alloc));
		if(vardec->next_sib == nullptr)
			break;
		vardec = vardec->next_sib->next_sib->child;
	}

	
	return nullptr;
}

Value *FunDec_codeGen(struct Node* root){
	LogErrorV("FunDecl");
	/* Set FunctionType */
	Type* tp;
	std::string func_tp = root->child->child->string_contant;

	std::string temp;
    char zero = 0;
    for (int i = 0; i < 255; i++) temp = temp + zero;
    Constant *getstrtype = ConstantDataArray::getString(generator.context,temp);

	if(func_tp=="int")
		tp = Type::getInt32Ty(generator.context);
	else if(func_tp=="float")
		tp = Type::getDoubleTy(generator.context);
	else
		tp = Type::getVoidTy(generator.context);
	FunctionType *func_type;
	struct Node *ID = root->child->next_sib->child;
	std::vector<Type *> arg_types;

	if (strcmp(ID->next_sib->next_sib->name,"RP")==0)
		func_type = FunctionType::get(tp, false);
	else
	{
		struct Node *paramdec = ID->next_sib->next_sib->child;
		Type* tmp;
		while (paramdec!=nullptr)
		{
			LogErrorV("Fun_arg");
			
			if(strcmp(paramdec->child->child->string_contant,"int")==0){
				if(paramdec->child->next_sib->child->next_sib==nullptr)
					tmp = Type::getInt32Ty(generator.context);
				else
				{
					int range = 1000;
					tmp = ArrayType::get(Type::getInt32Ty(generator.context), range);
				}
			}
			else if(strcmp(paramdec->child->child->string_contant,"float")==0){
				if(paramdec->child->next_sib->child->next_sib==nullptr)
					tmp = Type::getDoubleTy(generator.context);
				else
				{
					int range = 1000;
					tmp = ArrayType::get(Type::getDoubleTy(generator.context), range);
				}
			}
			else if(strcmp(paramdec->child->child->string_contant,"string")==0)
				tmp = getstrtype->getType();
			else
				tmp = Type::getInt8Ty(generator.context);
			
			arg_types.push_back(tmp);

			if(paramdec->next_sib == nullptr)
				break;
			
			paramdec = paramdec->next_sib->next_sib->child;
		}
		func_type = FunctionType::get(tp, arg_types, false);
	}
	/* Create function */
	Function *function = Function::Create(func_type, GlobalValue::ExternalLinkage, ID->string_contant, generator.module);
	/* Traverse through args and set their names */
	
	// if (strcmp(ID->next_sib->next_sib->name ,"RP")!=0)
	// {
	// 	Function::arg_iterator arg_iter = function->arg_begin();
	// 	struct Node* para_tmp = ID->next_sib->next_sib->child;
	// 	while (para_tmp !=nullptr)
	// 	{
	// 		Value *arg = arg_iter++;
	// 		arg->setName(para_tmp->child->next_sib->child->string_contant);
	// 		if(para_tmp->next_sib ==nullptr )
	// 			break;
	// 		para_tmp = para_tmp->next_sib->next_sib->child;
	// 	}
	// }

	generator.setCurFunction(function);


	/* Set insert point and insert function body */
	struct Node* compst = root->child->next_sib->next_sib;
	if (strcmp(compst->child->next_sib->name,"RC")!=0)
	{
		BasicBlock *new_block = BasicBlock::Create(generator.context, "entry", function);
		generator.builder->SetInsertPoint(new_block);

		if (strcmp(ID->next_sib->next_sib->name ,"RP")!=0)
		{
			Function::arg_iterator arg_iter = function->arg_begin();
			struct Node* para_tmp = ID->next_sib->next_sib->child;
			while (para_tmp !=nullptr)
			{
				Value *arg = arg_iter++;
				int i = 0;
				if (arg_types[i]->isPointerTy())
				{
					Value *alloc = generator.builder->CreateAlloca(arg_types[i++], nullptr, para_tmp->child->next_sib->child->string_contant);
					generator.builder->CreateStore(arg, alloc);
					// arg->setName(para_iter->getId()->getName());
				}
				else
				{
					Value *alloc = generator.builder->CreateAlloca(arg_types[i++], nullptr, para_tmp->child->next_sib->child->string_contant);
					generator.builder->CreateStore(arg, alloc);
				}
				
				if(para_tmp->next_sib ==nullptr)
					break;
				para_tmp = para_tmp->next_sib->next_sib->child;
			}
		}

		if(strcmp(compst->child->next_sib->name ,"DefList")==0 && strcmp(compst->child->next_sib->next_sib->name,"StmtList")==0){
			def_codeGen(compst->child->next_sib);
			stmt_codeGen(compst->child->next_sib->next_sib);
		}
		else if(strcmp(compst->child->next_sib->name ,"StmtList")==0)
			stmt_codeGen(compst->child->next_sib);
	}
	// if (ret_type->getLLVMType() != generator.builder->getVoidTy())
	// {
	// 	generator.builder->CreateRet(statement->codeGen());
	// }
	// else
	// {
	// 	generator.builder->CreateRetVoid();
	// }
	if (tp->isVoidTy())
		generator.builder->CreateRetVoid();
	else if (tp->isIntegerTy())
		generator.builder->CreateRet(generator.builder->getInt32(-1));
	else if(tp->isDoubleTy())
		generator.builder->CreateRet(ConstantFP::get(generator.builder->getDoubleTy(), -1));
	else
		generator.setCurFunction(nullptr);
	return nullptr;
}

Value *def_codeGen(struct Node* root){
	struct Node *def = root->child;
	while(def !=nullptr){
		LogErrorV("VarDef");
		Type* tp;
		Value *alloc = nullptr;
        std::string tmp;
        char zero = 0;
        for (int i = 0; i < 255; i++) tmp = tmp + zero;
        Constant *getstrtype = ConstantDataArray::getString(generator.context,tmp);
		if(strcmp(def->child->child->string_contant ,"int")==0){
			tp = Type::getInt32Ty(generator.context);
		}
		else if(strcmp(def->child->child->string_contant,"float")==0){
			tp = Type::getDoubleTy(generator.context);
		}
		else if(strcmp(def->child->child->string_contant,"string")==0){
			tp = getstrtype->getType();
		}
		else if(strcmp(def->child->child->string_contant,"char")==0){
			tp =Type::getInt8Ty(generator.context);
		}
		std::string var_type = def->child->child->string_contant;
		struct Node *dec = def->child->next_sib->child;
		while(dec!=nullptr){
			Value *init_value = nullptr;
			if(var_type=="int")
				init_value = generator.builder->getInt32(0);
			else if(var_type=="float")
				init_value = ConstantFP::get(generator.builder->getDoubleTy(), 0);
			else if(var_type=="string")
				init_value = ConstantDataArray::getString(generator.context,tmp);
			else if(var_type=="char")
				init_value = generator.builder->getInt8(0);
			Value *alloc = nullptr;
			if (dec->child->child->next_sib == nullptr)
				alloc = generator.builder->CreateAlloca(tp, nullptr, dec->child->child->string_contant);
			else
			{
				int range = dec->child->child->next_sib->next_sib->int_contant;
				Type *array_type = ArrayType::get(tp, range);
				alloc = generator.builder->CreateAlloca(array_type, nullptr, dec->child->child->string_contant);
				if(var_type=="string"){
					for (int i = 0; i < range; i++)
					{
						Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
						generator.builder->CreateStore(init_value, ptr);
					}
				}
				else{
					for (int i = 0; i < range; i++)
					{
						Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
						generator.builder->CreateStore(init_value, ptr);
					}
				}
			}
			addrtable.insert(std::pair<std::string,llvm::Value*>(std::string(dec->child->child->string_contant),alloc));
			if(dec->next_sib == nullptr)
				break;
			dec = dec->next_sib->next_sib->child;
		}
		if(def->next_sib==nullptr)
			break;
		def = def->next_sib->child;
	}
	
	return nullptr;
}

Value *stmt_codeGen(struct Node* root){
	Value* ptr;
	struct Node* stmt;
	if(strcmp(root->name,"Stmt") == 0)
		stmt = root;
	else
		stmt = root->child;
	while(stmt!=nullptr){
		if(strcmp(stmt->child->name ,"Exp")==0){
		    ptr = Exp_codeGen(stmt->child);
		}
		else if(strcmp(stmt->child->name, "CompSt")==0){
			struct Node* compst = stmt->child;
			if(strcmp(compst->child->next_sib->name, "DefList")==0 && strcmp(compst->child->next_sib->next_sib->name,"StmtList")==0){
				def_codeGen(compst->child->next_sib);
				ptr = stmt_codeGen(compst->child->next_sib->next_sib);
			}
			else if(strcmp(compst->child->next_sib->name , "StmtList")==0)
				ptr = stmt_codeGen(compst->child->next_sib);
		}
		else if(strcmp(stmt->child->name ,"RETURN")==0){
			ptr = Return_codeGen(stmt);
		}
		else if(strcmp(stmt->child->name , "IF")==0){
			ptr = If_codeGen(stmt);
		}
		else if(strcmp(stmt->child->name, "WHILE")==0){
			ptr = While_codeGen(stmt);
		}
        if(stmt->next_sib == nullptr)
			break;
		stmt = stmt->next_sib->child;
	}
	return ptr;
}

Value *Exp_codeGen(struct Node* root){
	Value *ptr;
	if(strcmp(root->child->name ,"Exp")==0){
		std::string opt = root->child->next_sib->name;
		if(opt == "ASSIGNOP"){
			ptr = assign_codeGen(root);
		}
		else if(opt == "AND"||opt == "OR"||opt == "RELOP"||opt == "PLUS"
		||opt == "MINUS"||opt == "STAR"||opt == "DIV" ){
			ptr = Binary_codeGen(root);
		}
	}
	else if(strcmp(root->child->name , "LP")==0){
		ptr = Exp_codeGen(root->child->next_sib);
	}
	else if(strcmp(root->child->name ,"ID")==0){
		if(root->child->next_sib == nullptr){
			ptr = Var_codeGen(root);
		}
		else if(strcmp(root->child->next_sib->name ,"LB")==0){
			ptr = Var_codeGen(root);
		}
		else if(strcmp(root->child->next_sib->name ,"LP")==0)
			ptr = CallExpr_codeGen(root);
	}
	else if(strcmp(root->child->name,"Not")==0){
		//
	}
	else{
		if(strcmp(root->child->name ,"INT")==0)
			ptr = int_codeGen(root->child);
		else if(strcmp(root->child->name ,"FLOAT")==0)
			ptr = float_codeGen(root->child);
		else if(strcmp(root->child->name ,"STRING")==0)
			ptr = string_codeGen(root->child);
		else
			ptr = char_codeGen(root->child);
	}
	return ptr;
}

Value* assign_codeGen(struct Node* root){
	LogErrorV("AssignStatement");
	struct Node *lexp = root->child;
	struct Node *rexp = lexp->next_sib->next_sib;
	Value *lvalue = nullptr;
	Value *rvalue = Exp_codeGen(rexp);
	if (lexp->child->next_sib==nullptr)
	{
		std::string var_name = lexp->child->string_contant;
		Value *var_value = nullptr;
		/* Search for variable in current function */
		var_value = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (var_value == nullptr)
		{
			/* Search for variable in global */
			printf("look up global");
			var_value = generator.module->getGlobalVariable(var_name);
			if (var_value == nullptr)
				throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		}
		lvalue = generator.builder->CreateLoad(var_value, "tmp_var_value");
		if(lvalue->getType()!=rvalue->getType()){
			rvalue = generator.builder->CreateIntCast(rvalue, Type::getInt32Ty(generator.context), true);
			//rvalue = generator.builder->CreateSIToFP(rvalue,Type::getDoubleTy(generator.context));
		}
		return generator.builder->CreateStore(rvalue, var_value);
	}
	else
	{
		std::string var_name = lexp->child->string_contant;
		Value *array_addr = nullptr;
		Value *index_value = Exp_codeGen(lexp->child->next_sib->next_sib);
		if (index_value == nullptr)
		{
			LogErrorV("[ERROR]Var: Void expression");
			return nullptr;
		}
		Value *ptr = nullptr;
		/* Construct ArrayRef */
		std::vector<Value *> array_ref_v;
		array_ref_v.push_back(generator.builder->getInt32(0));
		array_ref_v.push_back(index_value);
		std::vector<Value *> array_pointer_v;
		array_pointer_v.push_back(index_value);
		/* Search for variable in current function */
		array_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (array_addr == nullptr)
		{
			/* Search for variable in global space */
			array_addr = generator.module->getGlobalVariable(var_name);
			if (array_addr == nullptr)
				throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		}
		Value *array_value = generator.builder->CreateLoad(array_addr, "tmp_var_value");
		if (array_value->getType()->isPointerTy())
		{
			ptr = generator.builder->CreateGEP(array_value, array_pointer_v, "tmp_array_pointer");
			return generator.builder->CreateStore(Exp_codeGen(rexp), ptr);
		}
		else if (array_value->getType()->isArrayTy())
		{
			ptr = generator.builder->CreateGEP(array_addr, array_ref_v, "tmp_array_ptr");
			return generator.builder->CreateStore(Exp_codeGen(rexp), ptr);
		}
		return nullptr;
	}
}

Value *Binary_codeGen(struct Node *root){
	LogErrorV("BinaryExpr");
	struct Node* lexp = root->child;
	struct Node* rexp = root->child->next_sib->next_sib;
	Value *L = Exp_codeGen(lexp);
	Value *R = Exp_codeGen(rexp);

	std::string tmp;
    char zero = 0;
    for (int i = 0; i < 255; i++) tmp = tmp + zero;
    Constant *getstrtype = ConstantDataArray::getString(generator.context,tmp);

	if (!L || !R)
	{
		LogErrorV("BinaryExpr: L or R is null");
		return nullptr;
	}
	std::string op = root->child->next_sib->name;
	if(op == "PLUS"){
		if(L->getType()->isDoubleTy()||R->getType()->isDoubleTy())
			return generator.builder->CreateFAdd(L, R, "add_d_tmp");
		else
			return generator.builder->CreateAdd(L, R, "addtmp");
	}
	else if(op == "MINUS"){
		if(L->getType()->isDoubleTy()||R->getType()->isDoubleTy())
			return generator.builder->CreateFSub(L, R, "sub_d_tmp");
		else
			return generator.builder->CreateSub(L, R, "subtmp");
	}
	else if(op == "STAR"){
		if(L->getType()->isDoubleTy()||R->getType()->isDoubleTy())
			return generator.builder->CreateFMul(L, R, "mul_d_tmp");
		else
			return generator.builder->CreateMul(L, R, "multmp");
	}
	else if(op == "DIV"){
		//if(L->getType()->isDoubleTy()||R->getType()->isDoubleTy())
		Value* lvalue = generator.builder->CreateSIToFP(L,Type::getDoubleTy(generator.context));
		Value* rvalue = generator.builder->CreateSIToFP(R,Type::getDoubleTy(generator.context));	
		return generator.builder->CreateFDiv(lvalue, rvalue, "div_d_tmp");
		// else	
		// 	return generator.builder->CreateSDiv(L, R, "divtmp");
	}
	else if(op == "RELOP"){
		std::string opt = root->child->next_sib->string_contant;
		if(opt == "<")
			return generator.builder->CreateICmpSLT(L, R, "slttmp");
		else if(opt == "<=")
			return generator.builder->CreateICmpSLE(L, R, "sletmp");
		else if(opt == ">")
			return generator.builder->CreateICmpSGT(L, R, "sgttmp");
		else if(opt == ">=")
			return generator.builder->CreateICmpSGE(L, R, "sgetmp");
		else if(opt == "=="){
			// if(L->getType()==getstrtype->getType()&&R->getType()==getstrtype->getType()){
			// 	std::vector<Value *> array_ref_v;
			// 	Value *lptr = nullptr;
			// 	Value *rptr = nullptr;
			// 	Value * larray_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(lexp->child->string_contant);
			// 	Value * rarray_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(rexp->child->string_contant);
			// 	array_ref_v.push_back(generator.builder->getInt32(0));
			// 	array_ref_v.push_back(generator.builder->getInt32(0));
			// 	lptr = generator.builder->CreateGEP(larray_addr, array_ref_v, "tmp_array_pointer_l");
			// 	rptr = generator.builder->CreateGEP(rarray_addr, array_ref_v, "tmp_array_pointer_r");
			// 	Value *lvar_value = generator.builder->CreateLoad(lptr, "tmp_array_value_l");
			// 	Value *rvar_value = generator.builder->CreateLoad(rptr, "tmp_array_value_r");
			// 	Value* is_eq =  generator.builder->CreateICmpEQ(lvar_value, rvar_value, "eqtmp");
			// 	return is_eq;
			// }
			// else
			return generator.builder->CreateICmpEQ(L, R, "eqtmp");
		}
		else if(opt == "!=")
			return generator.builder->CreateICmpNE(L, R, "netmp");
	}
	else if(op == "AND")
		return generator.builder->CreateAnd(L,R, "andtmp");
	else if(op == "OR")
		return generator.builder->CreateOr(L,R, "ortmp");
	else
		return LogErrorV("invalid binary operator");
}

Value *int_codeGen(struct Node* root){
	LogErrorV("IntExp");
	return generator.builder->getInt32(root->int_contant);
}

Value *float_codeGen(struct Node* root){
	LogErrorV("FloatExp");
	return ConstantFP::get(generator.builder->getDoubleTy(), root->float_contant);
}

Value *char_codeGen(struct Node* root){
	LogErrorV("CharExp");
	return generator.builder->getInt8(root->char_contant);
}

Value *string_codeGen(struct Node* root)
{
	LogErrorV("StringExp");
    std::string tmp=root->string_contant;
    int tmp_len = tmp.size();
    char zero = 0;
    for (int i = 0; i < 255 - tmp_len; i++) tmp = tmp + zero;
    Constant *strtmp=ConstantDataArray::getString(generator.context,tmp);
    return strtmp;
}

Value *Var_codeGen(struct Node* root){
	LogErrorV("Var");
	if (root->child->next_sib == nullptr)
	{
		std::string var_name = root->child->string_contant;
		Value *var_ptr = nullptr;
		/* Search for variable in current function */
		var_ptr = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (var_ptr == nullptr)
				{
					/* Search for variable in global */
					var_ptr = generator.module->getGlobalVariable(var_name);
					if (var_ptr == nullptr)
						throw std::logic_error("[ERROR]Var: Undeclared variable " + var_name);
				}
		Value *var_value = generator.builder->CreateLoad(var_ptr, "tmp_var_value");

		return var_value;
	}
	else
	{
		std::string var_name = root->child->string_contant;
		Value *array_addr = nullptr;
		Value *index_value = Exp_codeGen(root->child->next_sib->next_sib);
		Value *ptr = nullptr;
		/* Construct ArrayRef */
		std::vector<Value *> array_ref_v;
		array_ref_v.push_back(generator.builder->getInt32(0));
		array_ref_v.push_back(index_value);
		std::vector<Value *> array_pointer_v;
		array_pointer_v.push_back(index_value);
		/* Search for variable in current function */
		array_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (array_addr == nullptr)
		{
			/* Search for variable in global space */
			array_addr = generator.module->getGlobalVariable(var_name);
			if (array_addr == nullptr)
				throw std::logic_error("[ERROR]Var: Undeclared variable " + var_name);
		}
		Value *array_value = generator.builder->CreateLoad(array_addr, "tmp_var_value");
		if (array_value->getType()->isPointerTy())
		{
			ptr = generator.builder->CreateGEP(array_value, array_pointer_v, "tmp_array_pointer");
			return generator.builder->CreateLoad(ptr, "tmp_array_value");
		}
		else if (array_value->getType()->isArrayTy())
		{
			ptr = generator.builder->CreateGEP(array_addr, array_ref_v, "tmp_array_ptr");
			return generator.builder->CreateLoad(ptr, "tmp_array_value");
		}
		return nullptr;
	}
	
}

Value *Return_codeGen(struct Node *root){
	LogErrorV("ReturnStatement");
	generator.builder->CreateRet(Exp_codeGen(root->child->next_sib));
	return nullptr;
}

Value *CallExpr_codeGen(struct Node *root){
	std:: string func_name = root->child->string_contant;
	LogErrorV("CallExpr");

	if (func_name == "printf")
	{
		std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
		while (args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			if (argValue->getType() == generator.builder->getInt32Ty())
			{
				formatStr += "%d";
			}
			else if (argValue->getType() == generator.builder->getInt8Ty())
			{
				formatStr += "%c";
			}
			else if (argValue->getType() == generator.builder->getInt1Ty())
			{
				formatStr += "%d";
			}
			else if (argValue->getType()== generator.builder->getDoubleTy())
			{
				formatStr += "%.1lf";
			}
			else
			{
				throw std::logic_error("[ERROR]Invalid type to write.");
			}
			params.emplace_back(argValue);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}
		formatStr += "\n";
		auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printf");
	}

if (func_name == "printf10d")
	{
		std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
		while (args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			formatStr += "%10d";	
			params.emplace_back(argValue);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}
		auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printf");
	}


    else if (func_name == "printstring"){
        std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
		while (args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			auto iter = addrtable.find(std::string(args->child->child->string_contant));
			if(iter == addrtable.end()){
				printf("Not found");
			}
			formatStr += "%s";
			params.emplace_back(iter->second);
			params.emplace_back(argValue);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}
		formatStr += "\n";
		auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printstring");
    }

else if (func_name == "printstringsameline"){
        std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
		while (args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			auto iter = addrtable.find(std::string(args->child->child->string_contant));
			if(iter == addrtable.end()){
				printf("Not found");
			}
			formatStr += "%s";
			params.emplace_back(iter->second);
			params.emplace_back(argValue);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}
		//formatStr += "\n";
		auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printstringsameline");
    
    }


    else if (func_name == "scanfstring"){
        std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
		while (args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			auto iter = addrtable.find(std::string(args->child->child->string_contant));
			if(iter == addrtable.end()){
				printf("Not found");
			}
			//formatStr += "%s";
			params.emplace_back(iter->second);
			params.emplace_back(argValue);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}
		formatStr += "%[^\n]";
        auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		//params[0] = generator.builder->CreateGlobalStringPtr(formatStr, "scanf_format");
        llvm::Value* ret = generator.builder->CreateCall(generator.scanf, makeArrayRef(params), "scanfstring");
        //generator.builder->CreateCall(generator.ourscanf, generator.builder->CreateGlobalStringPtr("%*c", "scanf_newline"), "scanf");
		return ret;
    }

	else if (func_name == "scanf")
	{
		std::string formatStr = "";
		std::vector<Value *> params;
		Node *args = root->child->next_sib->next_sib;
        //params.emplace_back(nullptr);
		while(args!=nullptr)
		{
			Value *argValue = Exp_codeGen(args->child);
			auto iter = addrtable.find(std::string(args->child->child->string_contant));
			if(iter == addrtable.end()){
				printf("Not found");
			}
			if (argValue->getType() == generator.builder->getInt32Ty())
			{
				formatStr += "%d";
			}
			else if (argValue->getType() == generator.builder->getInt8Ty())
			{
				formatStr += "%c";
			}
			else if (argValue->getType() == generator.builder->getInt1Ty())
			{
				formatStr += "%d";
			}
			else if (argValue->getType()== generator.builder->getDoubleTy())
			{
				formatStr += "%lf";
			}
			else
			{
				throw std::logic_error("[ERROR]Invalid type to write.");
			}
			params.emplace_back(iter->second);
			if(args->child->next_sib == nullptr)
				break;
			args = args->child->next_sib->next_sib;
		}

		//formatStr += "%*[^\n]";
        auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		//params[0] = generator.builder->CreateGlobalStringPtr(formatStr, "scanf_format");
        llvm::Value* ret = generator.builder->CreateCall(generator.scanf, makeArrayRef(params), "scanf");
        //generator.builder->CreateCall(generator.ourscanf, generator.builder->CreateGlobalStringPtr("%*c", "scanf_newline"), "scanf");
		return ret;
	}

	Function *callee_func = generator.module->getFunction(func_name);
	std::vector<Value *> args_vec;
	if (!callee_func)
		return LogErrorV("Unknown function referenced");
	struct Node* args = root->child->next_sib->next_sib;
	int arg_size = 0;
	if(strcmp(args->name ,"RP")==0){
		arg_size = 0;
		return generator.builder->CreateCall(callee_func, args_vec, "tmp_call");
	}
	else{
		arg_size = 1;
		while(args->child->next_sib!=nullptr){
			arg_size++;
			args = args->child->next_sib->next_sib;
		}
	}

	if (callee_func->arg_size() != arg_size)
		return LogErrorV("Incorrect # arguments passed");

	args = root->child->next_sib->next_sib;
	args_vec.push_back(Exp_codeGen(args->child));
	while(args->child->next_sib!=nullptr){
		args = args->child->next_sib->next_sib;
		args_vec.push_back(Exp_codeGen(args->child));
	}
	return generator.builder->CreateCall(callee_func, args_vec, "tmp_call");
}

Value* If_codeGen(struct Node *root){
	LogErrorV("IfStatement");
	Value *cond_value =Exp_codeGen(root->child->next_sib->next_sib);
	Value *thenValue = nullptr;
	Value *elseValue = nullptr;
	Function *cur_function = generator.getCurFunction();
	cond_value = generator.builder->CreateICmpNE(cond_value, ConstantInt::get(generator.builder->getInt1Ty(), 0, true), "if_condition");
	BasicBlock *then_block = BasicBlock::Create(generator.context, "then", cur_function);
	BasicBlock *else_block = BasicBlock::Create(generator.context, "else", cur_function);
	BasicBlock *end_block = BasicBlock::Create(generator.context, "end", cur_function);

	//Then
	auto branch = generator.builder->CreateCondBr(cond_value, then_block, else_block);
	generator.builder->SetInsertPoint(then_block);
	thenValue = stmt_codeGen(root->child->next_sib->next_sib->next_sib->next_sib);
	generator.builder->CreateBr(end_block);

	generator.builder->SetInsertPoint(else_block);
	if (root->child->next_sib->next_sib->next_sib->next_sib->next_sib != nullptr)
	{
		elseValue = stmt_codeGen(root->child->next_sib->next_sib->next_sib->next_sib->next_sib->next_sib);
	}
	generator.builder->CreateBr(end_block);
	generator.builder->SetInsertPoint(end_block);

	return nullptr;
}

Value* While_codeGen(struct Node *root){
	LogErrorV("WhileStatement");
	Function *cur_function = generator.getCurFunction();
	BasicBlock *condition_block = BasicBlock::Create(generator.context, "condition", cur_function);
	BasicBlock *loop_block = BasicBlock::Create(generator.context, "loop", cur_function);
	BasicBlock *end_block = BasicBlock::Create(generator.context, "afterLoop", cur_function);

	// Cond
	generator.builder->CreateBr(condition_block);
	generator.builder->SetInsertPoint(condition_block);
	Value *cond_value = Exp_codeGen(root->child->next_sib->next_sib);
	cond_value = generator.builder->CreateICmpNE(cond_value, ConstantInt::get(Type::getInt1Ty(generator.context), 0, true), "whileCond");
	auto branch = generator.builder->CreateCondBr(cond_value, loop_block, end_block);
	condition_block = generator.builder->GetInsertBlock();

	// Loop
	generator.builder->SetInsertPoint(loop_block);
	stmt_codeGen(root->child->next_sib->next_sib->next_sib->next_sib);
	generator.builder->CreateBr(condition_block);

	// End
	generator.builder->SetInsertPoint(end_block);

	return nullptr;
}

