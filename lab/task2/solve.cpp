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

void ChangeFaddResult(Module *mod) {
	for(Function &F : *mod) {
		for(BasicBlock &BB : F) {
			for(auto it = BB.begin(), end = BB.end(); it != end;) {
				Instruction &I = *it++;
				if (I.getOpcode() == Instruction::FAdd) {
					// Value *fadd = BinaryOperator::CreateFAdd(I.getOperand(0), I.getOperand(1), "fadd");
					// BasicBlock *falseBB = BasicBlock::Create(mod->getContext(), "falseBB", &F);
					BasicBlock *falseBB = BB.splitBasicBlock(it, "falseBB");
					
					Instruction *lastInst = &(BB.back());
					lastInst->eraseFromParent();
					
					Value* constant = ConstantFP::get(Type::getDoubleTy(mod->getContext()), 100.0);
					Instruction *cmp_ins = CmpInst::Create(Instruction::FCmp, CmpInst::FCMP_OGT, &I, constant, "cmp_ins");

					cmp_ins->insertAfter(&I);

					// llvm::ValueToValueMapTy VMap;
					BasicBlock *trueBB = BasicBlock::Create(mod->getContext(), "trueBB", &F);
					BranchInst *branchInst = BranchInst::Create(trueBB, falseBB, cmp_ins);
					branchInst->insertAfter(cmp_ins);
					
					IRBuilder<> builder(trueBB);
					// builder.CreateRet(&I);
					builder.CreateBr(falseBB);

					PHINode* phiNode = PHINode::Create(I.getType(), 2, "phi");
					phiNode->addIncoming(&I, &BB);
                    phiNode->addIncoming(constant, trueBB);
					phiNode->insertBefore(&(*falseBB->getFirstInsertionPt()));
					for(Instruction &II : *falseBB) {
						if (&(*falseBB->begin()) == &II) continue;
						II.replaceUsesOfWith(&I, phiNode);
					}
					break;
				}
			}	
		}
	}
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

	ChangeFaddResult(mod_ptr.get());
	WriteModuleToFile(mod_ptr.get(), file_out);
}

int main(int argc, char **argv) {
	HandleFile(argv[1], argv[2]);
	return 0;
}
