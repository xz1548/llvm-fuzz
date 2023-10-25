#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/InstrTypes.h"

#include <string>
#include <iostream>
#include <typeinfo>

using namespace std;
using namespace llvm;

void WriteModuleToFile(Module *mod, string file_out) {
	error_code ec;
	raw_fd_ostream out(file_out, ec);
	mod->print(out, nullptr);
	out.close();
}

void InsertFunc(Module *mod, Function *F) {
	LLVMContext &ctx = mod->getContext();
	IRBuilder<> builder(ctx);
	for(Function &FF : *mod) {
		if(&FF.getFunction() == F) break;
		for(BasicBlock &BB : FF) {
			for(auto it = BB.begin(); it != BB.end(); ) {
				Instruction &I = *it++;
				if(I.getOpcode() == Instruction::FAdd) {
					CallInst *callCheckAdd = builder.CreateCall(F, {I.getOperand(0), I.getOperand(1)});
					// callCheckAdd->insertBefore(&I);
					ReplaceInstWithInst(&I, callCheckAdd);
					// for(auto II = it; II != BB.end(); ) {
					// 	Instruction &EI = *II++;
					// 	EI.eraseFromParent();
					// }
					// Instruction *lastInst = &(BB.back());
					// while(lastInst->getOpcode() != Instruction::FAdd) {
					// 	lastInst->eraseFromParent();
					// 	lastInst = &(BB.back());
					// }
					// lastInst->eraseFromParent();
					break;
				}
			}
		}
	}
}

Function *AddFunc(Module *mod) {
	LLVMContext &ctx = mod->getContext();
	FunctionType *FT = FunctionType::get(Type::getDoubleTy(ctx), { Type::getDoubleTy(ctx), Type::getDoubleTy(ctx) }, false);
	Function *F= Function::Create(FT, Function::ExternalLinkage, "check_add", mod);
	BasicBlock *BB = BasicBlock::Create(ctx, "entry", F);

	IRBuilder<> builder(BB);

	Value *constant = ConstantFP::get(Type::getDoubleTy(ctx), 100.0);
	Value *Arg1 = F->arg_begin();
	Value *Arg2 = std::next(F->arg_begin());
	Value *FAdd = builder.CreateFAdd(Arg1, Arg2, "fadd_res");
	
	BasicBlock *biggerBB = BasicBlock::Create(ctx, "bigger", F);
	BasicBlock *smallerBB = BasicBlock::Create(ctx, "smaller", F);
	Instruction *cmpIns = CmpInst::Create(Instruction::FCmp, CmpInst::FCMP_OGT, FAdd, constant, "cmp_ins");
	Instruction *I = dyn_cast<Instruction>(FAdd);
	cmpIns->insertAfter(I);
	BranchInst *branchInst = BranchInst::Create(biggerBB, smallerBB, cmpIns);
	branchInst->insertAfter(cmpIns);
	
	IRBuilder<> biggerBuilder(biggerBB);
	Value *FRem = biggerBuilder.CreateFRem(FAdd, constant, "frem_res");
	biggerBuilder.CreateRet(FRem);

	IRBuilder<> smallerBuilder(smallerBB);
	smallerBuilder.CreateRet(FAdd);
	return F;
}

void HandleFile(string file_in, string file_out) {
	LLVMContext ctx;
	SMDiagnostic err;

	std::unique_ptr<Module> mod_ptr = parseIRFile(file_in, err, ctx);

	if (!mod_ptr) {
		std::cout << "testIR" << std::endl;
		return;
	}

	if (verifyModule(*mod_ptr, &errs())) {
		std::cout << "verifyModule success!" << std::endl;
		return;
	}

	Function *F = AddFunc(mod_ptr.get());
	InsertFunc(mod_ptr.get(), F);
	WriteModuleToFile(mod_ptr.get(), file_out);
}

int main(int argc, char **argv) {
	HandleFile(argv[1], argv[2]);
	return 0;
}
