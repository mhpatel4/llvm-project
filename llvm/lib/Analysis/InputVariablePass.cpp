// Pass that analyzes a C program and outputs all variables that take in external input like scanf, env variable, command line arguments, and file reads
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

struct InputVariablePass : public PassInfoMixin<InputVariablePass> {
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
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
                        inputVariables.push_back("Environment Variable Accessed: " + callInst->getArgOperand(0)->getName().str());
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
};