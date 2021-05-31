#include <iostream>
#include <stdexcept>
#include "llvm.hpp"
#include "Ast.hpp"
#include "IRGenerator.hpp"

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
	IRBuilder<> TmpB(&TheFunction->getEntryBlock(), TheFunction->getEntryBlock().begin());
	return TmpB.CreateAlloca(type, nullptr, VarName);
}

void print_height(int height)
{
	for (int i = 0; i < height; i++)
		std::cout << "	";
}

/* ---------------- Basic classes ---------------- */

OurType::OurType(OurTypeID type) : type(type) {}

Value *OurType::codeGen()
{
	LogErrorV("OurType");
	return nullptr;
}

OurTypeID OurType::getType()
{
	return type;
}

Type *OurType::getLLVMType()
{
	switch (type)
	{
	case MY_INT:
		return Type::getInt32Ty(generator.context);
		break;

	case MY_VOID:
		return Type::getVoidTy(generator.context);
		break;
    
    case MY_FLOAT:
		return Type::getFloatTy(generator.context);
		break;

	default:
		break;
	}
	return nullptr;
}

void OurType::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "OurType " << type << std::endl;
}

Identifier::Identifier(std::string id_name) : id_name(id_name) {}

Value *Identifier::codeGen()
{
	LogErrorV("Identifier");
	return nullptr;
}

std::string Identifier::getName()
{
	return id_name;
}

void Identifier::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "Identifier " << id_name << std::endl;
}

Parameter::Parameter(OurType *type, Identifier *var_name, bool is_array) : type(type), var_name(var_name), is_array(is_array) {}

OurType *Parameter::getType()
{
	return type;
}

Identifier *Parameter::getId()
{
	return var_name;
}

Value *Parameter::codeGen()
{
	LogErrorV("Parameter");
	return nullptr;
}

void Parameter::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "Parameter " << std::endl;

	type->print_tree(height + 1);

	var_name->print_tree(height + 1);
}

/* AstNode subclasses */

IntExpr::IntExpr(int val) : val(val) {}

Value *IntExpr::codeGen()
{
	LogErrorV("IntExpr");
	return generator.builder->getInt32(val);
}

void IntExpr::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "IntExpr " << val << std::endl;
}

Var::Var(Identifier *id, Expression *exp) : id(id), exp(exp) {}

Identifier *Var::getId()
{
	return id;
}

Expression *Var::getExpression()
{
	return exp;
}

Value *Var::codeGen()
{
	LogErrorV("Var");
	if (exp == nullptr)
	{
		std::string var_name = id->getName();
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
		var_value = generator.mymodule->getGlobalVariable(var_name);
		if (var_value == nullptr)
			throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		generator.builder->CreateLoad(var_value, "tmp_var");
		return var_value;
	}
	else
	{
		std::string var_name = id->getName();
		Value *array_addr = nullptr;
		Value *index_value = exp->codeGen();
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
			generator.builder->CreateLoad(ptr, "tmp_array_value");
			return ptr;
		}
		/* Search for variable in global space */
		array_addr = generator.mymodule->getGlobalVariable(var_name);
		if (array_addr == nullptr)
			throw std::logic_error("[ERROR]Undeclared variable " + var_name);
		ptr = generator.builder->CreateInBoundsGEP(array_addr, array_ref_v, "tmp_array_ptr");
		generator.builder->CreateLoad(ptr, "tmp_array_value");
		return ptr;
	}
}

void Var::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "Var" << std::endl;
	id->print_tree(1 + height);
	if (exp)
		exp->print_tree(1 + height);
}

BinaryExpr::BinaryExpr(Expression *lhs, BinaryOp op, Expression *rhs) : lhs(lhs), op(op), rhs(rhs) {}

Value *BinaryExpr::codeGen()
{
	LogErrorV("BinaryExpr");
	Value *L = lhs->codeGen();
	Value *R = rhs->codeGen();
	if (!L || !R)
	{
		LogErrorV("BinaryExpr: L or R is null");
		return nullptr;
	}
	switch (op)
	{
	case BINARYOP_ADD:
		return generator.builder->CreateAdd(L, R, "addtmp");
	case BINARYOP_SUB:
		return generator.builder->CreateSub(L, R, "subtmp");
	case BINARYOP_MUL:
		return generator.builder->CreateMul(L, R, "multmp");
	case BINARYOP_DIV:
		return generator.builder->CreateSDiv(L, R, "divtmp");
	case BINARYOP_LT:
		return generator.builder->CreateICmpSLT(L, R, "slttmp");
	case BINARYOP_LE:
		return generator.builder->CreateICmpSLE(L, R, "sletmp");
	case BINARYOP_GT:
		return generator.builder->CreateICmpSGT(L, R, "sgttmp");
	case BINARYOP_GE:
		return generator.builder->CreateICmpSGE(L, R, "sgetmp");
	case BINARYOP_EQ:
		return generator.builder->CreateICmpEQ(L, R, "eqtmp");
	case BINARYOP_NE:
		return generator.builder->CreateICmpNE(L, R, "netmp");
	default:
		return LogErrorV("invalid binary operator");
	}
}

void BinaryExpr::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "BinaryExpr " << std::endl;
	lhs->print_tree(height + 1);
	print_height(height + 1);
	std::cout << "|--"
			  << "BinaryOp " << op << std::endl;
	rhs->print_tree(height + 1);
}

CallExpr::CallExpr(Identifier *callee, std::vector<Expression *> *args) : callee(callee), args(args) {}

Value *CallExpr::codeGen()
{
	LogErrorV("CallExpr");
	if (callee->getName() == "printf")
	{
		std::string formatStr = "";
		std::vector<Value *> params;
		for (auto &arg : *(this->args))
		{
			Value *argValue = arg->codeGen();
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
			else if (argValue->getType()->isDoubleTy())
			{
				formatStr += "%lf";
			}
			else
			{
				throw std::logic_error("[ERROR]Invalid type to write.");
			}
			params.push_back(argValue);
		}
		formatStr += "\n";
		auto formatConst = ConstantDataArray::getString(generator.context, formatStr.c_str());
		auto formatStrVar = new GlobalVariable(*(generator.mymodule), ArrayType::get(generator.builder->getInt8Ty(), formatStr.size() + 1), true, GlobalValue::ExternalLinkage, formatConst, ".str");
		auto zero = Constant::getNullValue(generator.builder->getInt32Ty());
		Constant *indices[] = {zero, zero};
		auto varRef = ConstantExpr::getGetElementPtr(formatStrVar->getType()->getElementType(), formatStrVar, indices);
		params.insert(params.begin(), varRef);
		return generator.builder->CreateCall(generator.printf, makeArrayRef(params), "printf");
	}

	std::string callee_name = callee->getName();
	Function *callee_func = generator.mymodule->getFunction(callee_name);
	if (!callee_func)
		return LogErrorV("Unknown function referenced");

	if (callee_func->arg_size() != args->size())
		return LogErrorV("Incorrect # arguments passed");

	std::vector<Value *> args_vec;
	for (auto iter = args->begin(); iter != args->end(); iter++)
	{
		Expression *cur_func = *iter;
		args_vec.push_back(cur_func->codeGen());
		if (!args_vec.back())
			return nullptr;
	}

	return generator.builder->CreateCall(callee_func, args_vec, "tmp_call");
}

void CallExpr::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "CallExpr " << std::endl;
	callee->print_tree(height + 1);
	for (auto x : *args)
	{
		x->print_tree(height + 1);
	}
}

VarDec::VarDec(OurType *var_type, Identifier *var_id, Expression *var_value = nullptr, bool is_global = false,, unsigned int length = 0)
	: var_type(var_type), var_id(var_id), var_value(var_value), is_global(is_global), length(length)
{
}

Value *VarDec::codeGen()
{
	LogErrorV("VarDec");
	/* Set init value */
	Value *init_value = nullptr;
	if (var_value == nullptr)
	{
		switch (var_type->getType())
		{
		case MY_INT:
			init_value = generator.builder->getInt32(0);
			break;
		case MY_VOID:
			break;
		default:
			break;
		}
	}
	else
		init_value = var_value->codeGen();
	Value *alloc = nullptr;
	if (is_global)
	{
		/* is var */
		if (length == 0)
			alloc = new GlobalVariable(*(generator.mymodule), var_type->getLLVMType(), false, GlobalValue::ExternalLinkage, (Constant *)init_value, var_id->getName());
		/* is array */
		else
		{
			Type *array_type = ArrayType::get(var_type->getLLVMType(), length);
			alloc = new GlobalVariable(*(generator.mymodule), array_type, false, GlobalValue::ExternalLinkage, nullptr, var_id->getName());
			for (int i = 0; i < length; i++)
			{
				Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
				generator.builder->CreateStore(init_value, ptr);
			}
		}
	}
	else
	{
		if (length == 0)
			alloc = generator.builder->CreateAlloca(var_type->getLLVMType(), nullptr, var_id->getName());
		else
		{
			Type *array_type = ArrayType::get(var_type->getLLVMType(), length);
			alloc = generator.builder->CreateAlloca(array_type, nullptr, var_id->getName());
			for (int i = 0; i < length; i++)
			{
				Value *ptr = generator.builder->CreateConstGEP2_32(array_type, alloc, 0, i, "tmp_array_ptr");
				generator.builder->CreateStore(init_value, ptr);
			}
		}
	}
	return alloc;
}

void VarDec::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "VarDec" << std::endl;

	var_type->print_tree(height + 1);

	var_id->print_tree(height + 1);
	if (length != 0)
	{
		print_height(height + 1);
		std::cout << "|--"
				  << "length " << length << std::endl;
	}
}

FunDec::FunDec(OurType *ret_type, Identifier *fun_id, std::vector<Parameter *> *paras, CompSt *statement)
	: ret_type(ret_type), fun_id(fun_id), paras(paras), statement(statement) {}

Value *FunDec::codeGen()
{
	LogErrorV("FunDec");
	/* Set FunctionType */
	FunctionType *func_type;
	if (paras == nullptr)
		func_type = FunctionType::get(ret_type->getLLVMType(), false);
	else
	{
		std::vector<Type *> arg_types;
		for (auto &para_iter : *paras)
		{
			arg_types.insert(arg_types.end(), para_iter->getType()->getLLVMType());
		}
		func_type = FunctionType::get(ret_type->getLLVMType(), arg_types, false);
	}
	/* Create function */
	Function *function = Function::Create(func_type, GlobalValue::ExternalLinkage, fun_id->getName(), generator.mymodule);
	/* Traverse through args and set their names */
	if (paras != nullptr)
	{
		Function::arg_iterator arg_iter = function->arg_begin();
		auto para_iter = paras->begin();
		while (para_iter != paras->end())
		{
			Value *arg = arg_iter++;
			arg->setName((*para_iter++)->getId()->getName());
		}
	}

	generator.setCurFunction(function);
	/* Set insert point and insert function body */
	if (statement != nullptr)
	{
		BasicBlock *new_block = BasicBlock::Create(generator.context, "entry", function);
		generator.builder->SetInsertPoint(new_block);
		statement->codeGen();
	}
	// if (ret_type->getLLVMType() != generator.builder->getVoidTy())
	// {
	// 	generator.builder->CreateRet(statement->codeGen());
	// }
	// else
	// {
	// 	generator.builder->CreateRetVoid();
	// }
	if (ret_type->getLLVMType()->isVoidTy())
		generator.builder->CreateRetVoid();
	else if (ret_type->getLLVMType()->isIntegerTy())
		generator.builder->CreateRet(generator.builder->getInt32(-1));

	generator.setCurFunction(nullptr);
	return function;
}

void FunDec::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "FunDec" << std::endl;

	ret_type->print_tree(height + 1);
	fun_id->print_tree(height + 1);
	if (paras != NULL)
	{
		for (auto x : *paras)
		{
			x->print_tree(1 + height);
		}
	}
	else
	{
		print_height(height + 1);
		std::cout << "|--"
				  << "Parameter void" << std::endl;
	}
	statement->print_tree(1 + height);
}

AssignStatement::AssignStatement(Var *left, Expression *right) : left(left), right(right)
{
}

Value *AssignStatement::codeGen()
{
	LogErrorV("AssignStatement");
	Value *obj = generator.getCurFunction()->getValueSymbolTable()->lookup(left->getId()->getName());
	generator.builder->CreateStore(right->codeGen(), obj);
	return obj;
}

void AssignStatement::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "AssignStatement" << std::endl;
	left->print_tree(1 + height);
	right->print_tree(1 + height);
}

ExpressionStmt::ExpressionStmt(Expression *expression) : expression(expression)
{
}

Expression *ExpressionStmt::getExpression()
{
	return expression;
}

Value *ExpressionStmt::codeGen()
{
	LogErrorV("ExpressionStmt");
	return expression->codeGen();
}

void ExpressionStmt::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "ExpressionStmt" << std::endl;
	expression->print_tree(1 + height);
}

CompSt::CompSt(Statementlist *stmt_list) : stmt_list(stmt_list)
{
}

Value *CompSt::codeGen()
{
	LogErrorV("CompSt");
	for (auto &iter : *stmt_list)
	{
		iter->codeGen();
	}
	return nullptr;
}

void CompSt::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "CompSt" << std::endl;
	for (auto x : *stmt_list)
	{
		x->print_tree(1 + height);
	}
}

ReturnStatement::ReturnStatement(Expression *expr) : expr(expr)
{
}

Value *ReturnStatement::codeGen()
{
	LogErrorV("ReturnStatement");
	if (expr == nullptr)
	{
		generator.builder->CreateRetVoid();
	}
	else
	{
		generator.builder->CreateRet(expr->codeGen());
	}
	return nullptr;
}

void ReturnStatement::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "ReturnStatement" << std::endl;
	expr->print_tree(height + 1);
}

IfStatement::IfStatement(Expression *Pif, Statement *Pthen, Statement *Pelse) : Pif(Pif), Pthen(Pthen), Pelse(Pelse)
{
}

Value *IfStatement::codeGen()
{
	LogErrorV("IfStatement");
	Value *cond_value = this->Pif->codeGen();
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
	thenValue = this->Pthen->codeGen();
	generator.builder->CreateBr(end_block);

	generator.builder->SetInsertPoint(else_block);
	if (this->Pelse != nullptr)
	{
		elseValue = this->Pelse->codeGen();
	}
	generator.builder->CreateBr(end_block);
	generator.builder->SetInsertPoint(end_block);

	return nullptr;
}

void IfStatement::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "IfStatement" << std::endl;

	Pif->print_tree(1 + height);

	Pthen->print_tree(1 + height);
	if (Pelse)
		Pelse->print_tree(1 + height);
}

WhileStatement::WhileStatement(Expression *condition, Statement *statement) : condition(condition), statement(statement)
{
}

Value *WhileStatement::codeGen()
{
	LogErrorV("WhileStatement");
	Function *cur_function = generator.getCurFunction();
	BasicBlock *condition_block = BasicBlock::Create(generator.context, "condition", cur_function);
	BasicBlock *loop_block = BasicBlock::Create(generator.context, "loop", cur_function);
	BasicBlock *end_block = BasicBlock::Create(generator.context, "afterLoop", cur_function);

	// Cond
	generator.builder->CreateBr(condition_block);
	generator.builder->SetInsertPoint(condition_block);
	Value *cond_value = this->condition->codeGen();
	cond_value = generator.builder->CreateICmpNE(cond_value, ConstantInt::get(Type::getInt1Ty(generator.context), 0, true), "whileCond");
	auto branch = generator.builder->CreateCondBr(cond_value, loop_block, end_block);
	condition_block = generator.builder->GetInsertBlock();

	// Loop
	generator.builder->SetInsertPoint(loop_block);
	this->statement->codeGen();
	generator.builder->CreateBr(condition_block);

	// End
	generator.builder->SetInsertPoint(end_block);

	return nullptr;
}

void WhileStatement::print_tree(int height)
{
	print_height(height);
	std::cout << "|--"
			  << "WhileStatement" << std::endl;

	condition->print_tree(1 + height);

	statement->print_tree(1 + height);
}
