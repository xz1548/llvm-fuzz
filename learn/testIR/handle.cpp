#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/Verifier.h>

#include <string>

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
	for(auto it_m = mod->begin(); it_m != mod->end(); it_m++) {
        Function *func = &*it_m;
        for(auto it_b = func->begin(); it_b != func->end(); it_b++) {
            BasicBlock *bb = &*it_b;
            for(auto it_i = bb->begin(); it_i != bb->end(); it_i++) {
                Instruction *inst = &*it_i;
                // do something
                if(inst->getOpcode() == Instruction::FAdd) {
                    Instruction *new_inst = BinaryOperator::CreateFSub(inst->getOperand(0), inst->getOperand(1), "", inst);
                    inst->replaceAllUsesWith(new_inst);
                    inst->eraseFromParent();
                }
            }
        }
    }
}

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

	WriteModuleToFile(mod_ptr.get(), new_bc_file);
}

int main() {
    HandleFile("input.bc", "output.bc");
    return 0;
}
