#include <llvm/IR/Module.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/InstrTypes.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/IR/InstrTypes.h"

#include <iostream>
#include <stdlib.h>
#include <time.h>

#define MAP_SIZE_POW2       16
#define MAP_SIZE            (1 << MAP_SIZE_POW2)
#define R(x) (random() % (x))

using namespace llvm;
using namespace std;

void WriteModuleToFile(Module *mod, string file_out) {
        error_code ec;
        raw_fd_ostream out(file_out, ec);
        mod->print(out, nullptr);
        out.close();
}

void InsertOnModule(Module *mod) {
	LLVMContext &C = mod->getContext();
	IntegerType *Int8Ty  = IntegerType::getInt8Ty(C);
	IntegerType *Int32Ty = IntegerType::getInt32Ty(C);

	GlobalVariable *AFLMapPtr =
      new GlobalVariable(*mod, PointerType::get(Int8Ty, 0), false, GlobalValue::ExternalLinkage, 0, "__area_ptr");

	GlobalVariable *AFLPrevLoc = new GlobalVariable(*mod, Int32Ty, false, GlobalValue::ExternalLinkage, 0, "__prev_loc", 0, GlobalVariable::GeneralDynamicTLSModel, 0, false);

	FunctionType *voidFuncType = FunctionType::get(Type::getVoidTy(C), false);
	FunctionCallee setupSHMCallee = mod->getOrInsertFunction("setup_shared_memory", voidFuncType);

	int inst_blocks = 0;
	for (auto &F : *mod) {
   		for (auto &BB : F) {
   		 	 BasicBlock::iterator IP = BB.getFirstInsertionPt();
   		 	 IRBuilder<> IRB(&(*IP));

   		 	 unsigned int cur_loc = R(MAP_SIZE);
   		 	 ConstantInt *CurLoc = ConstantInt::get(Int32Ty, cur_loc);

   		 	 /* Load prev_loc */

   		 	 LoadInst *PrevLoc = IRB.CreateLoad(Int32Ty, AFLPrevLoc, "afl_prev_loc");
   		 	 PrevLoc->setMetadata(mod->getMDKindID("nosanitize"), MDNode::get(C, None));
   		 	 Value *PrevLocCasted = IRB.CreateZExt(PrevLoc, IRB.getInt32Ty());

   		 	 /* Load SHM pointer */

   		 	 LoadInst *MapPtr = IRB.CreateLoad(PointerType::get(Int8Ty, 0), AFLMapPtr, "afl_map_ptr");
   		 	 MapPtr->setMetadata(mod->getMDKindID("nosanitize"), MDNode::get(C, None));
   		 	 Value *MapPtrIdx = IRB.CreateGEP(Int8Ty, MapPtr, IRB.CreateXor(PrevLocCasted, CurLoc));

   		 	 /* Update bitmap */

   		 	 LoadInst *Counter = IRB.CreateLoad(Int8Ty, MapPtrIdx, "map_ptr_idx");
   		 	 Counter->setMetadata(mod->getMDKindID("nosanitize"), MDNode::get(C, None));
   		 	 Value *Incr = IRB.CreateAdd(Counter, ConstantInt::get(Int8Ty, 1));
   		 	 IRB.CreateStore(Incr, MapPtrIdx)->setMetadata(mod->getMDKindID("nosanitize"), MDNode::get(C, None));

   		 	 /* Set prev_loc to cur_loc >> 1 */

   		 	 StoreInst *Store = IRB.CreateStore(ConstantInt::get(Int32Ty, cur_loc >> 1), AFLPrevLoc);
   		 	 Store->setMetadata(mod->getMDKindID("nosanitize"), MDNode::get(C, None));

   		 	 inst_blocks++;
		}

		if (F.getName() == "main") {
			BasicBlock &entryBlock = F.getEntryBlock();
			IRBuilder<> builder(&entryBlock, entryBlock.begin());

			builder.CreateCall(setupSHMCallee);
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

        InsertOnModule(mod_ptr.get());
		WriteModuleToFile(mod_ptr.get(), file_out);
}

int main(int argc, char **argv) {
        HandleFile(argv[1], argv[2]);
        return 0;
}
