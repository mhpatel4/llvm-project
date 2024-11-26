#include "llvm/Analysis/DefUseChainAnalysisPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/PassManager.h"

using namespace llvm;

PreservedAnalyses DefUseChainAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeModule(M);

    // Print the Def-Use Chains
    errs() << "Def-Use Chains:\n";
    for (const auto &entry : defUseChains) {
        const std::string &varName = entry.first;
        const DefUseInfo &duInfo = entry.second;

        errs() << "Variable: " << varName << "\n";

        // Print Definitions
        errs() << "  Definitions:\n";
        for (const DefInfo &def : duInfo.defs) {
            if (def.line != -1)
                errs() << "    Line " << def.line << " in function '" << def.funcName << "' (" << def.instType << ")\n";
            else
                errs() << "    Function '" << def.funcName << "' (" << def.instType << ")\n";
        }

        // Print Uses
        errs() << "  Uses:\n";
        for (const UseInfo &use : duInfo.uses) {
            if (use.line != -1)
                errs() << "    Line " << use.line << " in function '" << use.funcName << "' (" << use.instType << ")\n";
            else
                errs() << "    Function '" << use.funcName << "' (" << use.instType << ")\n";
        }

        errs() << "\n";
    }

    return PreservedAnalyses::all();
}

void DefUseChainAnalysisPass::analyzeModule(Module &M) {
    for (Function &F : M) {
        if (F.isDeclaration())
            continue;

        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                // Get debug location
                int line = -1;
                if (DILocation *Loc = I.getDebugLoc()) {
                    line = Loc->getLine();
                }

                // Analyze Definitions
                // Consider instructions that define variables (e.g., AllocaInst, LoadInst, StoreInst, CallInst, BinaryOperator, etc.)
                if (auto *StoreInstPtr = dyn_cast<StoreInst>(&I)) {
                    // For StoreInst, the defined variable is the pointer operand
                    Value *ptr = StoreInstPtr->getPointerOperand();
                    std::string varName = getVariableName(ptr);
                    if (!varName.empty()) {
                        defUseChains[varName].defs.emplace_back(line, F.getName().str(), "Store");
                    }
                }
                else if (auto *AllocaInstPtr = dyn_cast<AllocaInst>(&I)) {
                    std::string varName = getVariableName(&I);
                    if (!varName.empty()) {
                        defUseChains[varName].defs.emplace_back(line, F.getName().str(), "Alloca");
                    }
                }
                else if (auto *LoadInstPtr = dyn_cast<LoadInst>(&I)) {
                    std::string varName = getVariableName(&I);
                    if (!varName.empty()) {
                        defUseChains[varName].defs.emplace_back(line, F.getName().str(), "Load");
                    }
                }
                else if (auto *CallInstPtr = dyn_cast<CallInst>(&I)) {
                    std::string varName = getVariableName(&I);
                    if (!varName.empty()) {
                        defUseChains[varName].defs.emplace_back(line, F.getName().str(), "Call");
                    }
                }
                else if (auto *BinOpPtr = dyn_cast<BinaryOperator>(&I)) {
                    std::string varName = getVariableName(&I);
                    if (!varName.empty()) {
                        defUseChains[varName].defs.emplace_back(line, F.getName().str(), BinOpPtr->getOpcodeName());
                    }
                }
                // Add more instruction types as needed

                // Analyze Uses
                for (unsigned opIdx = 0; opIdx < I.getNumOperands(); ++opIdx) {
                    Value *operand = I.getOperand(opIdx);
                    if (Instruction *operandInst = dyn_cast<Instruction>(operand)) {
                        std::string varName = getVariableName(operandInst);
                        if (!varName.empty()) {
                            defUseChains[varName].uses.emplace_back(line, F.getName().str(), I.getOpcodeName());
                        }
                    }
                }
            }
        }
    }
}

// Helper function to get the variable name from a Value*
// Returns an empty string if the name cannot be determined
std::string DefUseChainAnalysisPass::getVariableName(const Value *V) {
    // Attempt to get the variable name from debug info
    if (const Instruction *I = dyn_cast<Instruction>(V)) {
        if (const DILocation *Loc = I->getDebugLoc()) {
            if (const DIScope *Scope = Loc->getScope()) {
                // Retrieve the subprogram (function) from the scope
                if (const DISubprogram *SP = Scope->getSubprogram()) {
                    // Iterate over the variables in the subprogram to find a matching variable
                    for (unsigned i = 0; i < SP->getNumVariables(); ++i) {
                        if (const DIVariable *Var = SP->getVariable(i)) {
                            // Check if this variable is associated with the current instruction
                            // This is a simplification; in practice, more robust checks may be needed
                            // For example, matching storage location or other attributes
                            // Here, we'll assume that if the variable has the same name as the Value, it's a match
                            if (Var->getName() == V->getName()) {
                                StringRef VarName = Var->getName();
                                if (!VarName.empty()) {
                                    return VarName.str();
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Fallback: Use the Value's name if available
    if (V->hasName()) {
        return V->getName().str();
    }

    // If V is a constant or unnamed, return an empty string
    return "";
}