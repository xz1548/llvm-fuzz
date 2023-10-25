#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Verifier.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Transforms/Utils/BasicBlockUtils.h>

#include <string>
#include <iostream>
#include <typeinfo>

using namespace std;
using namespace llvm;

void WriteModuleToFile(Module *mod, string new_bc_file) {
	error_code ec;
	raw_fd_ostream out(new_bc_file, ec);
	mod->print(out, nullptr);
	// WriteBitcodeToFile(*mod, out);
	out.close();
}

void ChangeFaddToFsub(Module *mod) {
	for (Function &F : *mod) {
		for (BasicBlock &BB : F) {
			for (Instruction &I : BB) {
				if (I.getOpcode() == Instruction::FAdd) {
					Instruction *newInst = BinaryOperator::CreateFSub(I.getOperand(0), I.getOperand(1), "sub");
					ReplaceInstWithInst(&I, newInst);
					break;
				}	
			}
		}
	}
}

// void ChangeFaddToFsub(Module *mod) {
// 	IRBuilder<> builder(mod->getContext());
// 	for (Function &F : *mod) {
// 		for (BasicBlock &BB : F) {
// 			// for (Instruction &I : BB) {
// 			for (auto it = BB.begin(), end = BB.end(); it!= end; ) {
// 				Instruction &instruction = *it++;
// 				if (auto *BO = dyn_cast<BinaryOperator>(&instruction)) {
// 					if (BO->getOpcode() == Instruction::FAdd) {
// 						Value *LHS = BO->getOperand(0);
//            			 	Value *RHS = BO->getOperand(1);
// 						Value *fsub = builder.CreateFSub(LHS, RHS);
//            			 	ReplaceInstWithInst(BO, llvm::cast<llvm::Instruction>(fsub));
//           			}
//         		}
// 			}
//       		// }
//     	}
//   	}
// }

// void ChangeFaddToFsub(Module *mod) {
// 	IRBuilder<> builder(mod->getContext());
// 	for(auto it_m = mod->begin(); it_m != mod->end(); it_m++) {
//         Function *func = &*it_m;
//         for(auto it_b = func->begin(); it_b != func->end(); it_b++) {
//             BasicBlock *bb = &*it_b;
//             for(auto it_i = bb->begin(); it_i != bb->end(); it_i++) {
//                 Instruction &instruction = *it_i;
// 				if (auto binOp = llvm::dyn_cast<llvm::BinaryOperator>(&instruction)) {
//                      if (binOp->getOpcode() == llvm::Instruction::FAdd) {
//                          // 创建一个新的减法指令
//                          builder.SetInsertPoint(&instruction);
//                          llvm::Value* fsub = builder.CreateFSub(binOp->getOperand(0), binOp->getOperand(1));
//  
//                          // 用新的减法指令替换旧的加法指令
//                          llvm::ReplaceInstWithInst(binOp, llvm::cast<llvm::Instruction>(fsub));
//                      }
//                  } else {
//     				llvm::dbgs() << "Not a BinaryOperator: " << instruction << "\n"; // 调试输出
// 				}
//             }
//         }
//     }
// }

// void ChangeFaddToFsub(llvm::Module* module) {
//     llvm::IRBuilder<> builder(module->getContext());
// 
//     for (auto& function : *module) {
//         for (auto& basicBlock : function) {
//             for (auto it = basicBlock.begin(), end = basicBlock.end(); it!= end; ) {
//                 llvm::Instruction& instruction = *it++;
// 					std::cout << typeid(instruction).name() << std::endl;
//                 // 检查指令是否为加法指令
//                 if (auto binOp = llvm::dyn_cast<llvm::BinaryOperator>(&instruction)) {
//                     if (binOp->getOpcode() == llvm::Instruction::FAdd) {
//                         // 创建一个新的减法指令
//                         builder.SetInsertPoint(&instruction);
//                         llvm::Value* fsub = builder.CreateFSub(binOp->getOperand(0), binOp->getOperand(1));
// 
//                         // 用新的减法指令替换旧的加法指令
//                         llvm::ReplaceInstWithInst(binOp, llvm::cast<llvm::Instruction>(fsub));
//                     }
//                 }
//             }
//         }
//     }  
// }

void HandleFile(string bc_file, string new_bc_file) {
	LLVMContext ctx;
    SMDiagnostic err;

    std::unique_ptr<Module> mod_ptr = parseIRFile(bc_file, err, ctx);

    if(!mod_ptr){
        err.print("testIR", errs());
        return;
    }

    if(verifyModule(*mod_ptr, &errs())) {
        errs() << "Error: Module failed verification!\n";
        return;
    }
	ChangeFaddToFsub(mod_ptr.get());
	WriteModuleToFile(mod_ptr.get(), new_bc_file);
}

int main(int argc, char **argv) {
    HandleFile(argv[1], argv[2]);
    return 0;
}
