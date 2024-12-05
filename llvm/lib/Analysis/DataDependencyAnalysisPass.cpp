#include "llvm/Analysis/DataDependencyAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"
#include <queue>
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Transforms/Utils/Local.h"
#include <unordered_set>
#include <sstream>
#include <regex>

using namespace llvm;

PreservedAnalyses DataDependencyAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeDependencies(M, MAM);
    
    return PreservedAnalyses::all();
}

void DataDependencyAnalysisPass::analyzeDependencies(Module &M, ModuleAnalysisManager &MAM) {
    // errs() << M << "\n";
    // Run InputAnalysisPass to gather input information
    InputAnalysisPass inputPass;
    inputPass.run(M, MAM);

    // Run KeyPointAnalysisPass to gather key point information
    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(M, MAM);

    // Retrieve information from passes
    const std::unordered_map<std::string, dbgObj>& varNameAndScope = inputPass.varNameInformation;
    // Check if variable scopes are updated from block to function
    errs() << "varNameAndScope contents after using blockMapping to get scopes of functions:\n";
    for (const auto &entry : varNameAndScope) {
        const dbgObj &obj = entry.second;
        
        errs() << "Variable name: " << obj.varName << " , Pointer value: " << obj.ptrValue << " , Scope: " << obj.scope << " , Function : " << obj.funcName <<"\n";
    }   
    errs() << "\n";

    const std::vector<InputInfo> &inputs = inputPass.getInputInfo();
    const std::vector<KeyPointInfo> &keyPoints = keyPointPass.getKeyPoints();
    
    // Debug output: Print information stored in inputInfo with arguments
    errs() << "Input Functions Identified:\n";
    for (const auto &input : inputs) {
        if (input.funcName == "__isoc99_scanf") {
            errs() << "  - Found input function: scanf at Line " << input.line << ".";
        } else {
            errs() << "  - Found input function: " << input.funcName << " at Line " << input.line << ".";
        }
        errs() << "\n";
    }

    // Debug output: Print information stored in keyPoints
    errs() << "\nKey Points Identified:\n";
    for (const auto &keyPoint : keyPoints) {
        errs() << "  - Key point at line " << keyPoint.line << " of type " << keyPoint.type << "\n";
    }
    errs() << "\n";

    std::unordered_set<std::string> relevantTypes = {"loop", "func_ptr_call", "branch", "switch"};

    std::unordered_map<const KeyPointInfo *, std::vector<AllocaVarPair>> keyPointVariables;
    for (const auto &keyPoint : keyPoints) {
        if (relevantTypes.find(keyPoint.type) == relevantTypes.end()) {
            continue; // Skip non-relevant keypoints
        }

        // Declare a local vector to accumulate AllocaVarPairs
        std::vector<AllocaVarPair> allocaVarPairs;

        Instruction *keyInst = keyPoint.inst;
        if (!keyInst) continue; // Safety check

        std::string funcName = keyPoint.funcName;

        // Debug information
        errs() << "Analyzing Keypoint Instruction at Line:" << keyPoint.line << " in Function: "<< funcName << "\n";
        keyInst->print(llvm::errs());
        errs() << "\nOperands and Dependencies:\n";

        std::unordered_set<Value*> visited;

        // Traverse each operand of the keypoint instruction
        for (unsigned i = 0; i < keyInst->getNumOperands(); ++i) {
            Value* operand = keyInst->getOperand(i);
            printDefiningInstruction(M, MAM, varNameAndScope, funcName, operand, visited, &allocaVarPairs);
        }

        errs() << "\n AllocaPairs for KeyPoint:\n";
        for (const auto &allocaEntry : allocaVarPairs) {
            allocaEntry.allocaInst->print(llvm::errs());
            errs() << "\n";
            errs() << "   - with variable name: " << allocaEntry.varName << "\n";
        }

        errs() << "\n";

        keyPointVariables[&keyPoint] = allocaVarPairs;
    }

    errs() << "Input Variables that influence program runtime:\n";

    for (const auto &input : inputs) {
        for (Value *operand : input.modifiedOperands) {
            for (const auto &[keyPoint, allocaVarPairs] : keyPointVariables) {
                for (const auto &allocaEntry : allocaVarPairs) {
                    if (operand == allocaEntry.allocaInst) { // Match found
                        errs() << "- Line " << input.line << ": " << allocaEntry.varName << " (KeyPoint at Line " << keyPoint->line << ", Type: " << keyPoint->type << ")\n";
                    }
                }
            }
        }
    }
}

void DataDependencyAnalysisPass::printDefiningInstruction(Module &M, ModuleAnalysisManager &MAM, const std::unordered_map<std::string, dbgObj>& varNameAndScope, std::string funcName, Value* val, std::unordered_set<Value*> &visited, std::vector<AllocaVarPair>* allocaVarPairs, int depth, int maxDepth) {
    if (depth > maxDepth || !val || visited.find(val) != visited.end())
        return;

    visited.insert(val);

    // Skip constant values
    if (isa<Constant>(val))
        return;

    // Handle function arguments
    if (Argument* arg = dyn_cast<Argument>(val)) {
        errs() << "  - Function Argument: " << arg->getName() << "\n";
        return;
    }

    // Handle global variables
    if (GlobalVariable* gv = dyn_cast<GlobalVariable>(val)) {
        errs() << "  - Global Variable: " << gv->getName() << "\n";
        return;
    }

    // Get the defining instruction
    if (Instruction* defInst = dyn_cast<Instruction>(val)) {
        errs() << "  - Defining Instruction: ";
        defInst->print(llvm::errs());
        errs() << "\n";

        // Check if the instruction is an AllocaInst
        if (AllocaInst* allocaInst = dyn_cast<AllocaInst>(defInst)) {
            std::string printedStr;
            raw_string_ostream rso(printedStr);
            defInst->print(rso);
            rso.flush();

            std::size_t startPos = printedStr.find("%");
            std::size_t equalPos = printedStr.find(" = ");
            std::size_t endPos = (equalPos != std::string::npos) ? equalPos : printedStr.length();
            printedStr = printedStr.substr(startPos, endPos - startPos);

            std::string varName;
            for (const auto &entry : varNameAndScope) {
                const dbgObj &obj = entry.second;
                if (obj.ptrValue == printedStr && funcName == obj.funcName) {
                    varName = obj.varName;
                    errs() << "       " << printedStr << " with variable name: " << obj.varName << "\n";
                    break; // Found the variable name, no need to continue
                }
            }

            // Add to the vector if the variable name is found
            if (allocaVarPairs && !varName.empty()) {
                allocaVarPairs->emplace_back(AllocaVarPair{allocaInst, varName});
            }
        }

        // If it's a LoadInst, find corresponding StoreInst(s)
        if (LoadInst* loadInst = dyn_cast<LoadInst>(defInst)) {
            Value* pointer = loadInst->getPointerOperand();
            // Iterate over all instructions in the module to find stores to this pointer
            for (Function &F : M) {
                for (BasicBlock &BB : F) {
                    for (Instruction &I : BB) {
                        if (StoreInst* storeInst = dyn_cast<StoreInst>(&I)) {
                            if (storeInst->getPointerOperand() == pointer) {
                                Value* storedValue = storeInst->getValueOperand();
                                // Recursively traverse the stored value
                                printDefiningInstruction(M, MAM, varNameAndScope, funcName, storedValue, visited, allocaVarPairs, depth + 1, maxDepth);
                            }
                        }
                    }
                }
            }
        }

        // Recursively traverse the operands of the defining instruction
        for (unsigned i = 0; i < defInst->getNumOperands(); ++i) {
            Value* operand = defInst->getOperand(i);
            printDefiningInstruction(M, MAM, varNameAndScope, funcName, operand, visited, allocaVarPairs, depth + 1, maxDepth);
        }
    }
}