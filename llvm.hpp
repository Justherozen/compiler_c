#pragma once

#include <llvm-10/llvm/IR/BasicBlock.h>
#include <llvm-10/llvm/IR/Module.h>
#include <llvm-10/llvm/IR/Function.h>
#include <llvm-10/llvm/IR/LLVMContext.h>
#include <llvm-10/llvm/IR/LegacyPassManager.h>
#include <llvm-10/llvm/IR/CallingConv.h>
#include <llvm-10/llvm/IR/IRPrintingPasses.h>
#include <llvm-10/llvm/IR/IRBuilder.h>
#include <llvm-10/llvm/IR/GlobalVariable.h>
#include <llvm-10/llvm/IRReader/IRReader.h>
#include <llvm-10/llvm/IR/ValueSymbolTable.h>
#include <llvm-10/llvm/ExecutionEngine/MCJIT.h>
#include <llvm-10/llvm/ExecutionEngine/Interpreter.h>
#include <llvm-10/llvm/ExecutionEngine/GenericValue.h>
#include <llvm-10/llvm/ExecutionEngine/SectionMemoryManager.h>
#include <llvm-10/llvm/Support/SourceMgr.h>
#include <llvm-10/llvm/Support/ManagedStatic.h>
#include <llvm-10/llvm/Support/TargetSelect.h>
#include <llvm-10/llvm/Support/MemoryBuffer.h>
#include <llvm-10/llvm/Support/raw_ostream.h>
#include <llvm-10/llvm/Support/DynamicLibrary.h>
#include <llvm-10/llvm/Target/TargetMachine.h>