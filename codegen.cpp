#include <iostream>
#include <stdexcept>
#include "llvm.hpp"
#include "treenode.h"
#include "codegen.hpp"

using namespace llvm;

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
	if(strcmp(root->child->child->string_contant,"int")==0)
		tp = Type::getInt32Ty(generator.context);
	else if(strcmp(root->child->child->string_contant,"float")==0)
		tp = Type::getFloatTy(generator.context);
	std::string var_type = root->child->child->string_contant;
	while(vardec !=nullptr){
		Value *init_value = nullptr;
		
		if(var_type == "int")
			init_value = generator.builder->getInt32(0);
		else if(var_type == "float")
			init_value = ConstantFP::get(generator.builder->getFloatTy(), 0);
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
			alloc = new GlobalVariable(*(generator.module), array_type, false, GlobalValue::ExternalLinkage, nullptr, vardec->child->string_contant);
			for (int i = 0; i < range; i++)
			{
				Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
				generator.builder->CreateStore(init_value, ptr);
			}
		}
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
	if(func_tp=="int")
		tp = Type::getInt32Ty(generator.context);
	else if(func_tp=="float")
		tp = Type::getFloatTy(generator.context);
	else
		tp = Type::getVoidTy(generator.context);
	FunctionType *func_type;
	struct Node *ID = root->child->next_sib->child;
	if (strcmp(ID->next_sib->next_sib->name,"RP")==0)
		func_type = FunctionType::get(tp, false);
	else
	{
		struct Node *paramdec = ID->next_sib->next_sib->child;
		std::vector<Type *> arg_types;
		Type* tmp;
		if(strcmp(paramdec->child->child->string_contant,"int")==0)
			tmp = Type::getInt32Ty(generator.context);
		else if(strcmp(paramdec->child->child->string_contant,"float")==0)
			tmp = Type::getFloatTy(generator.context);
		arg_types.push_back(tmp);
		while (paramdec->next_sib!=nullptr)
		{
			paramdec = paramdec->next_sib->next_sib->child;
			if(strcmp(paramdec->child->child->string_contant,"int")==0)
				tmp = Type::getInt32Ty(generator.context);
			else if(strcmp(paramdec->child->child->string_contant,"float")==0)
				tmp = Type::getFloatTy(generator.context);
			arg_types.push_back(tmp);
		}
		func_type = FunctionType::get(tp, arg_types, false);
	}
	/* Create function */
	Function *function = Function::Create(func_type, GlobalValue::ExternalLinkage, ID->string_contant, generator.module);
	/* Traverse through args and set their names */
	if (strcmp(ID->next_sib->next_sib->name ,"RP")!=0)
	{
		Function::arg_iterator arg_iter = function->arg_begin();
		struct Node* para_tmp = ID->next_sib->next_sib->child;
		while (para_tmp !=nullptr)
		{
			Value *arg = arg_iter++;
			arg->setName(para_tmp->child->next_sib->child->string_contant);
			if(para_tmp->next_sib ==nullptr )
				break;
			para_tmp = para_tmp->next_sib->next_sib->child;
		}
	}

	generator.setCurFunction(function);
	/* Set insert point and insert function body */
	struct Node* compst = root->child->next_sib->next_sib;
	if (strcmp(compst->child->next_sib->name,"RC")!=0)
	{
		BasicBlock *new_block = BasicBlock::Create(generator.context, "entry", function);
		generator.builder->SetInsertPoint(new_block);
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
	else if(tp->isFloatTy())
		generator.builder->CreateRet(ConstantFP::get(generator.builder->getFloatTy(), -1));
	else
		generator.setCurFunction(nullptr);
	return nullptr;
}

Value *def_codeGen(struct Node* root){
	struct Node *def = root->child;
	while(def !=nullptr){
		Type* tp;
		if(strcmp(def->child->child->string_contant ,"int")==0){
			printf("int-------");
			tp = Type::getInt32Ty(generator.context);
		}

		else if(strcmp(def->child->child->string_contant,"float")==0){
			printf("float-------");
			tp = Type::getFloatTy(generator.context);
		}
		std::string var_type = root->child->child->string_contant;
		struct Node *dec = def->child->next_sib->child;
		while(dec!=nullptr){
			Value *init_value = nullptr;
			if(var_type=="int")
				init_value = generator.builder->getInt32(0);
			else if(var_type=="float")
				init_value = ConstantFP::get(generator.builder->getFloatTy(), 0);
			Value *alloc = nullptr;
			if (dec->child->child->next_sib == nullptr)
				alloc = generator.builder->CreateAlloca(tp, nullptr, dec->child->child->string_contant);
			else
			{
				int range = dec->child->child->next_sib->next_sib->int_contant;
				Type *array_type = ArrayType::get(tp, range);
				alloc = generator.builder->CreateAlloca(array_type, nullptr, dec->child->child->string_contant);
				for (int i = 0; i < range; i++)
				{
					Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
					generator.builder->CreateStore(init_value, ptr);
				}
			}
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
	struct Node* stmt = root->child;
	while(stmt->next_sib!=nullptr){
		if(strcmp(stmt->child->name ,"Exp")==0){
		    ptr = Exp_codeGen(stmt->child);
		}
		else if(strcmp(stmt->child->name, "Compst")==0){
			struct Node* compst = stmt->child;
			if(strcmp(compst->child->next_sib->name, "DefList")==0 && strcmp(compst->child->next_sib->next_sib->name,"StmtList")==0){
				def_codeGen(compst->child->next_sib);
				ptr = stmt_codeGen(compst->child->next_sib->next_sib);
			}
			else if(strcmp(compst->child->next_sib->name , "StmtList")==0)
				ptr = stmt_codeGen(compst->child->next_sib);
		}
		else if(strcmp(stmt->child->name ,"RETURN")==0){
			ptr = Return_codeGen(stmt->child);
		}
		else if(strcmp(stmt->child->name , "IF")==0){
			ptr = If_codeGen(stmt->child);
		}
		else if(strcmp(stmt->child->name, "WHILE")==0){
			ptr = While_codeGen(stmt->child);
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
		if(strcmp(root->child->next_sib->name ,"LP")==0)
			ptr = CallExpr_codeGen(root->child);
		else 
			ptr = Var_codeGen(root); 
	}
	else if(strcmp(root->child->name,"Not")==0){
		//
	}
	else{
		if(strcmp(root->child->name ,"INT")==0)
			ptr = int_codeGen(root->child);
		else 
			ptr = float_codeGen(root->child);
	}
	return ptr;
}

Value* assign_codeGen(struct Node* root){
	LogErrorV("AssignStatement");
	struct Node *lexp = root->child;
	struct Node *rexp = lexp->next_sib->next_sib;
	if (strcmp(lexp->child->name,"ID")==0)
	{
		std::string var_name = lexp->child->string_contant;
		Value *var_value = nullptr;
		/* Search for variable in current function */
		var_value = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (var_value == nullptr)
		{
			/* Search for variable in global */
			var_value = generator.module->getGlobalVariable(var_name);
			if (var_value == nullptr)
				throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		}
		return generator.builder->CreateStore(Exp_codeGen(rexp), var_value);
	}
	else
	{
		std::string var_name = lexp->child->child->string_contant;
		Value *array_addr = nullptr;
		Value *index_value = Exp_codeGen(lexp->child->next_sib->next_sib);
		Value *ptr = nullptr;
		/* Construct ArrayRef */
		std::vector<Value *> array_ref_v;
		array_ref_v.push_back(generator.builder->getInt32(0));
		array_ref_v.push_back(index_value);
		/* Search for variable in current function */
		array_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (array_addr == nullptr)
		{
			/* Search for variable in global space */
			array_addr = generator.module->getGlobalVariable(var_name);
			if (array_addr == nullptr)
				throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		}
		ptr = generator.builder->CreateInBoundsGEP(array_addr, array_ref_v, "tmp_array_ptr");
		return generator.builder->CreateStore(Exp_codeGen(rexp), ptr);
	}
}

Value *Binary_codeGen(struct Node *root){
	LogErrorV("BinaryExpr");
	Value *L = Exp_codeGen(root->child);
	Value *R = Exp_codeGen(root->child->next_sib->next_sib);
	if (!L || !R)
	{
		LogErrorV("BinaryExpr: L or R is null");
		return nullptr;
	}
	std::string op = root->child->next_sib->name;
	if(op == "PLUS")
		return generator.builder->CreateAdd(L, R, "addtmp");
	else if(op == "MINUS")
		return generator.builder->CreateSub(L, R, "subtmp");
	else if(op == "STAR")
		return generator.builder->CreateMul(L, R, "multmp");
	else if(op == "DIV")
		return generator.builder->CreateSDiv(L, R, "divtmp");
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
		else if(opt == "==")
			return generator.builder->CreateICmpEQ(L, R, "eqtmp");
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
	return ConstantFP::get(generator.builder->getFloatTy(), root->float_contant);
}

Value *Var_codeGen(struct Node* root){
	LogErrorV("Var");
	if (root->child->next_sib == nullptr)
	{
		std::string var_name = root->child->child->string_contant;
		Value *var_value = nullptr;
		/* Search for variable in current function */
		var_value = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (var_value != nullptr)
		{
			if (var_value->getType()->isPointerTy())
				return generator.builder->CreateLoad(var_value, "tmp_value");
			else
				return var_value;
		}
		/* Search for variable in global */
		var_value = generator.module->getGlobalVariable(var_name);
		if (var_value == nullptr)
			throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		generator.builder->CreateLoad(var_value, "tmp_var");
		return var_value;
	}
	else
	{
		std::string var_name = root->child->child->string_contant;
		Value *array_addr = nullptr;
		Value *index_value = Exp_codeGen(root->child->next_sib->next_sib);
		Value *ptr = nullptr;
		/* Construct ArrayRef */
		std::vector<Value *> array_ref_v;
		array_ref_v.push_back(generator.builder->getInt32(0));
		array_ref_v.push_back(index_value);
		/* Search for variable in current function */
		array_addr = generator.getCurFunction()->getValueSymbolTable()->lookup(var_name);
		if (array_addr != nullptr)
		{
			ptr = generator.builder->CreateInBoundsGEP(array_addr, array_ref_v, "tmp_array_ptr");
			return generator.builder->CreateLoad(ptr, "tmp_array_value");
		}
		/* Search for variable in global space */
		array_addr = generator.module->getGlobalVariable(var_name);
		if (array_addr == nullptr)
			throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		ptr = generator.builder->CreateInBoundsGEP(array_addr, array_ref_v, "tmp_array_ptr");
		return generator.builder->CreateLoad(ptr, "tmp_array_value");
	}
}

Value *Return_codeGen(struct Node *root){
	LogErrorV("ReturnStatement");
	if (root->child->next_sib->next_sib == nullptr)
	{
		generator.builder->CreateRetVoid();
	}
	else
	{
		generator.builder->CreateRet(Exp_codeGen(root->child->next_sib));
	}
	return nullptr;
}

Value *CallExpr_codeGen(struct Node *root){
	std:: string func_name = root->child->string_contant;
	LogErrorV("CallExpr");

	// if (func_name == "printf")
	// {
	// 	std::string formatStr = "";
	// 	std::vector<Value *> params;
	// 	for (auto &arg : *(this->args))
	// 	{
	// 		Value *argValue = arg->codeGen();
	// 		if (argValue->getType() == generator.builder->getInt32Ty())
	// 		{
	// 			formatStr += "%d";
	// 		}
	// 		else if (argValue->getType() == generator.builder->getInt8Ty())
	// 		{
	// 			formatStr += "%c";
	// 		}
	// 		else if (argValue->getType() == generator.builder->getInt1Ty())
	// 		{
	// 			formatStr += "%d";
	// 		}
	// 		else if (argValue->getType()->isDoubleTy())
	// 		{
	// 			formatStr += "%lf";
	// 		}
	// 		else
	// 		{
	// 			throw std::logic_error("[ERROR]Invalid type to write.");
	// 		}
	// 		params.push_back(argValue);
	// 	}
	// 	formatStr += "\n";
	// 	auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
	// 	auto formatStrVar = new GlobalVariable(*(generator.module), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
	// 	auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
	// 	Constant *indices[] = {zero, zero};
	// 	auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
	// 	params.insert(params.begin(), varRef);
	// 	return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printf");
	// }

	Function *callee_func = generator.module->getFunction(func_name);
	if (!callee_func)
		return LogErrorV("Unknown function referenced");
	struct Node* args = root->child->next_sib->next_sib;
	int arg_size = 0;
	if(strcmp(args->name ,"RP")==0)
		arg_size = 0;
	else{
		arg_size = 1;
		while(args->child->next_sib!=nullptr){
			arg_size++;
			args = args->child->next_sib->next_sib;
		}
	}

	if (callee_func->arg_size() != arg_size)
		return LogErrorV("Incorrect # arguments passed");

	std::vector<Value *> args_vec;
	args = root->child->next_sib->next_sib;
	args_vec.push_back(Exp_codeGen(args->child));
	while(args->child->next_sib!=nullptr){
		args = args->child->next_sib->next_sib;
		args_vec.push_back(Exp_codeGen(args->child));
	}
	return generator.builder->CreateCall(callee_func, args_vec, "tmp_call");
}

Value* If_codeGen(struct Node *root){
	return 0;
}

Value* While_codeGen(struct Node *root){
	return 0;
}