#include "llvm/Transforms/Utils/InputVariablePass.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

PreservedAnalyses InputVariablePass::run(Function &F, FunctionAnalysisManager &) {
    std::vector<std::string> inputVariables;

    for (auto &BB : F) {
        for (auto &I : BB) {
            if (auto *callInst = dyn_cast<CallInst>(&I)) {
                Function *calledFunction = callInst->getCalledFunction();

                // Check for standard input via scanf
                if (calledFunction && calledFunction->getName() == "scanf") {
                    for (unsigned i = 1; i < callInst->arg_size(); ++i) {
                        if (auto *arg = dyn_cast<Instruction>(callInst->getArgOperand(i))) {
                            if (arg->getName() != "") {
                                inputVariables.push_back("Standard Input Variable: " + arg->getName().str());
                            }
                        }
                    }
                }

                // Check for command-line arguments
                if (calledFunction && calledFunction->getName() == "main") {
                    if (callInst->getArgOperand(0)->getName() == "argc") {
                        inputVariables.push_back("Command-Line Argument: argc");
                    }
                    if (callInst->getArgOperand(1)->getName() == "argv") {
                        inputVariables.push_back("Command-Line Argument: argv");
                    }
                }

                // Check for environment variables
                if (calledFunction && calledFunction->getName() == "getenv") {
                    if (auto *arg = dyn_cast<Instruction>(callInst->getArgOperand(0))) {
                        if (arg->getName() != "") {
                            inputVariables.push_back("Environment Variable Accessed: " + arg->getName().str());
                        }
                    }
                }
            }
        }
    }

    // Output identified input variables
    for (const auto &var : inputVariables) {
        errs() << var << "\n";
    }

    return PreservedAnalyses::all(); // No modifications to the function
}

// Entry point for dynamically loaded pass
llvm::PassPluginLibraryInfo getInputVariablePluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "InputVariablePass", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &PM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "inputvariable") {
                    PM.addPass(InputVariablePass());
                    return true;
                  }
                  return false;
                });
          }};
}

#ifndef LLVM_INPUTVARIABLE_LINK_INTO_TOOLS
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getInputVariablePluginInfo();
}
#endif
