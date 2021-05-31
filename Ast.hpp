#pragma once

#include "llvm.hpp"
#include <vector>
#include <iostream>
#include <string>
#include <stdlib.h>
using namespace llvm;

class AstNode;
class OurType;
class Identifier;
class Parameter;
class Expression;
class Statement;
class Declaration;
class IntExpr;
class BinaryExpr;
class CallExpr;
class VarDec;
class FunDec;
class Var;
class AssignStatement;
class CompSt;
class ReturnStatement;
class IfStatement;
class WhileStatement;
class ExpressionStmt;

using Program = std::vector<Declaration *>;
using Extdeflist= std::vector<Declaration *>;
using Parameterlist = std::vector<Parameter *>;
using Arglist = std::vector<Expression *>;
using Statementlist = std::vector<Statement *>;

class AstNode
{
public:
    int line_;
    int col_;
	virtual ~AstNode() {}
	virtual Value *codeGen() = 0;
	virtual void print_tree(int height) = 0;
void set_location(int line, int col) {
    this->line_ = line;
    this->col_ = col;
}
std::string get_location() {
    return "line " + std::string(std::to_string(this->line_)) +
           " , col " + std::string(std::to_string(this->col_)) + " : ";
}

std::pair<int, int> get_location_pairs(){
    return std::make_pair(this->line_, this->col_);
}

};

/* ---------------- Basic classes ---------------- */

enum OurTypeID
{
	MY_INT,
	MY_VOID,
    MY_FLOAT
};

class OurType : public AstNode
{
private:
	OurTypeID type;

public:
	OurType(OurTypeID type);
	virtual Value *codeGen();
	virtual void print_tree(int height);
	OurTypeID getType();
	Type *getLLVMType();
};

class Identifier : public AstNode
{
private:
	std::string id_name;

public:
	virtual void print_tree(int height);
	Identifier(std::string id_name);
	virtual Value *codeGen();
	std::string getName();
};

class Parameter : public AstNode
{
private:
	OurType *type;
	Identifier *var_name;
	bool is_array;

public:
	Parameter(OurType *type, Identifier *var_name, bool is_array);
	virtual void print_tree(int height);
	virtual Value *codeGen();
	OurType *getType();
	Identifier *getId();
};

/* ---------------- Advanced classes ---------------- */

class Expression : public AstNode
{
};

class Statement : public AstNode
{
};

class Declaration : public Statement
{
};

class IntExpr : public Expression
{
private:
	int val;

public:
	IntExpr(int val);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class BinaryExpr : public Expression
{
public:
	enum BinaryOp
	{
		BINARYOP_ADD,
		BINARYOP_SUB,
		BINARYOP_MUL,
		BINARYOP_DIV,
		BINARYOP_LT,
		BINARYOP_LE,
		BINARYOP_GT,
		BINARYOP_GE,
		BINARYOP_EQ,
		BINARYOP_NE
	};

private:
	Expression *lhs;
	Expression *rhs;
	BinaryOp op;

public:
	BinaryExpr(Expression *lhs, BinaryOp op, Expression *rhs);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class CallExpr : public Expression
{
private:
	Identifier *callee;
	std::vector<Expression *> *args;

public:
	CallExpr(Identifier *callee, std::vector<Expression *> *args);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class VarDec : public Declaration
{
private:
	OurType *var_type;
	Identifier *var_id;
	unsigned int length;	   // optional for array
	Expression *var_value; // optional
	bool is_global;

public:
	VarDec(OurType *var_type, Identifier *var_id, Expression *var_value, bool is_global,unsigned int length,);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};
class CompSt : public Statement
{
private:
	Statementlist *stmt_list;

public:
	CompSt(Statementlist *stmt_list);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};
class FunDec : public Declaration
{
private:
	OurType *ret_type;
	Identifier *fun_id;
	std::vector<Parameter *> *paras;
	CompSt *statement;

public:
	FunDec(OurType *ret_type, Identifier *fun_id, std::vector<Parameter *> *paras, CompSt *statement);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class Var : public Expression
{
private:
	Identifier *id;
	Expression *exp;

public:
	Var(Identifier *id, Expression *exp);
	Identifier *getId();
	Expression *getExpression();
	virtual void print_tree(int height);
	virtual Value *codeGen();
};
class AssignStatement : public Statement, public Expression
{
private:
	Var *left;
	Expression *right;

public:
	AssignStatement(Var *left, Expression *right);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class ExpressionStmt : public Statement
{
private:
	Expression *expression;

public:
	ExpressionStmt(Expression *expression);
	Expression *getExpression();
	virtual Value *codeGen();
	virtual void print_tree(int height);
};

class ReturnStatement : public Statement
{
private:
	Expression *expr;

public:
	ReturnStatement(Expression *expr);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class IfStatement : public Statement
{
private:
	Expression *Pif;
	Statement *Pthen;
	Statement *Pelse;

public:
	IfStatement(Expression *Pif, Statement *Pthen, Statement *Pelse);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

class WhileStatement : public Statement
{
private:
	Expression *condition;
	Statement *statement;

public:
	WhileStatement(Expression *condition, Statement *statement);
	virtual void print_tree(int height);
	virtual Value *codeGen();
};

using Program = std::vector<Declaration *>;
using Extdeflist = std::vector<Declaration *>;
using Parameterlist = std::vector<Parameter *>;
using Statementlist = std::vector<Statement *>;
using Arglist = std::vector<Expression *>;