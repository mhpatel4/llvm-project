#include "llvm/Analysis/DataDependencyAnalysisPass.h"
#include "llvm/Analysis/InputAnalysisPass.h"
#include "llvm/Analysis/KeyPointAnalysisPass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <vector>
#include "llvm/IR/DebugInfo.h"
#include <queue>
#include "llvm/Analysis/ValueTracking.h"
#include "llvm/Transforms/Utils/Local.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/Metadata.h"
#include <unordered_set>
#include <sstream>

using namespace llvm;

PreservedAnalyses DataDependencyAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    analyzeDependencies(M, MAM);
    
    return PreservedAnalyses::all();
}

void DataDependencyAnalysisPass::analyzeDependencies(Module &M, ModuleAnalysisManager &MAM) {
    errs() << M << "\n";
    // Run InputAnalysisPass to gather input information
    InputAnalysisPass inputPass;
    inputPass.run(M, MAM);

    // Run KeyPointAnalysisPass to gather key point information
    KeyPointAnalysisPass keyPointPass;
    keyPointPass.run(M, MAM);

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
    
    // **Step 1: Collect Input Allocas**
    std::vector<AllocaInst*> inputAllocas = collectInputAllocas(M, inputs);
    // **Step 2: Iterate Over Key Points and Check Dependencies**
    for (const auto &kp : keyPoints) {
        int kpLine = kp.line;
        SeminalFeature feature;
        feature.keyPointLine = kpLine;

        // Find the instruction at the key point line
        Instruction *kpInst = nullptr;
        for (Function &F : M) {
            for (BasicBlock &BB : F) {
                for (Instruction &I : BB) {
                    if (I.getDebugLoc()) {
                        int line = I.getDebugLoc()->getLine();
                        if (line == kpLine) {
                            kpInst = &I;
                            break;
                        }
                    }
                }
                if (kpInst)
                    break;
            }
            if (kpInst)
                break;
        }

        if (!kpInst) {
            errs() << "  Warning: No instruction found at line " << kpLine << " for key point.\n";
            continue;
        }

        // Collect all operands of the key point instruction
        std::set<Value*> operands;
        for (unsigned i = 0; i < kpInst->getNumOperands(); ++i) {
            operands.insert(kpInst->getOperand(i));
        }

        // Trace dependencies from operands to input Allocas
        std::unordered_set<Value*> visited;
        for (auto *op : operands) {
            traceDependency(op, visited, feature.inputAllocas);
        }

        // Remove duplicates by converting to a set and back to vector
        std::unordered_set<AllocaInst*> uniqueAllocas(feature.inputAllocas.begin(), feature.inputAllocas.end());
        feature.inputAllocas.assign(uniqueAllocas.begin(), uniqueAllocas.end());

        if (!feature.inputAllocas.empty()) {
            seminalFeatures.push_back(feature);
        }
    }

    // **Step 3: Print Seminal Features**
    if (!seminalFeatures.empty()) {
        errs() << "Seminal Input Features:\n";
        errs() << "-----------------------\n";
        for (const auto &feature : seminalFeatures) {
            errs() << "Key Point at Line " << feature.keyPointLine << " influenced by:\n";
            for (const auto *alloca : feature.inputAllocas) {
                errs() << "  - " << *alloca << "\n";
            }
        }
    } else {
        errs() << "No seminal input features identified.\n";
    }

}

// Helper function to collect input Allocas from InputAnalysisPass
std::vector<AllocaInst*> DataDependencyAnalysisPass::collectInputAllocas(Module &M, const std::vector<InputInfo> &inputs) {
    // Roundabout way to get DiLocalVariable for dbg_declare
    std::string IRString;
    raw_string_ostream IRStream(IRString);
    M.print(IRStream, nullptr);
    IRStream.flush();

    std::istringstream stream(IRString);
    std::string line;
    std::vector<std::string> dbgDeclareLines;

    while (std::getline(stream, line)) { 
        if (line.find("dbg_declare") != std::string::npos) 
            { dbgDeclareLines.push_back(line);
        }
    }

    for (const auto &dbgLine : dbgDeclareLines) {
        errs() << "dbg_declare line: " << dbgLine << "\n";
        // Extract needed infor from dbgLine
        std::size_t startPos = dbgLine.find("ptr") + 4;
        std::size_t endPos = dbgLine.find(",", startPos);
        std::string allocaName = dbgLine.substr(startPos, endPos - startPos);
    }

    std::unordered_map<std::string, std::string> dbgDeclareToVarMap;

    // Extract the metadata ID (e.g., "!15") from the dbg_declare line
    for (const auto &dbgLine : dbgDeclareLines) {
        std::size_t startPos = dbgLine.find("!"); // Find the first !
        if (startPos == std::string::npos) continue;

        std::size_t endPos = dbgLine.find(",", startPos);
        if (endPos == std::string::npos) continue;

        std::string metadataID = dbgLine.substr(startPos, endPos - startPos);
        errs() << "Extracted metadataID: " << metadataID << "\n";

        std::string debugLine;
        std::string metadataIDSearch = metadataID + " = !";  // Create search pattern for matching the metadataID

        // Reset the stream to start from the beginning again to find the metadata match
        stream.clear();
        stream.seekg(0, std::ios::beg);

        // Find the matching debug line for the metadataID
        while (std::getline(stream, debugLine)) {
            if (debugLine.find(metadataIDSearch) != std::string::npos) {
                errs() << "Found debug line for " << metadataID << ": " << debugLine << "\n";

                // Step 4: Extract the variable name (e.g., 'n' from !DILocalVariable(name: "n", ...)
                std::size_t nameStartPos = debugLine.find("name: \"") + 7;  // After "name: \""
                if (nameStartPos == std::string::npos) continue;

                std::size_t nameEndPos = debugLine.find("\"", nameStartPos);
                if (nameEndPos == std::string::npos) continue;

                std::string varName = debugLine.substr(nameStartPos, nameEndPos - nameStartPos);
                errs() << "Extracted variable name: " << varName << "\n";

                // Step 5: Add the mapping in dbgDeclareToVarMap
                dbgDeclareToVarMap[dbgLine] = varName;
            }
        }
    }
    // Step 6: Optionally, print the final map content
    errs() << "dbgDeclareToVarMap contents:\n";
    for (const auto &entry : dbgDeclareToVarMap) {
        errs() << "dbg_declare line: " << entry.first << ", Variable name: " << entry.second << "\n";
    }

    std::vector<AllocaInst*> inputAllocas;
    for (const auto &input : inputs) {
            // Find the instruction at the input line
            Instruction *callInst = nullptr;
            for (Function &F : M) {
                for (BasicBlock &BB : F) {
                    for (Instruction &I : BB) {
                        if (I.getDebugLoc()) {
                            int line = I.getDebugLoc()->getLine();
                            if (line == input.line) {
                                // Assuming the input instruction is a CallInst
                                if (auto *ci = dyn_cast<CallInst>(&I)) {
                                    callInst = ci;
                                    break;
                                }
                            }
                        }
                    }
                    if (callInst)
                        break;
                }
                if (callInst)
                    break;
            }

            if (callInst->getNumOperands() < 2)
                continue;

            // Typically, operand 0 is the format string, so iterate from operand 1 onwards
            for (unsigned i = 1; i < callInst->getNumOperands(); ++i) {
                Value *varPtr = callInst->getOperand(i);

                // Debug output
                errs() << "Processing input function call at line " << input.line << " (Operand " << i << "):\n";
                errs() << "  varPtr: ";
                varPtr->print(errs());
                errs() << "\n";

                // **Find the underlying AllocaInst**
                Value *underlying = getUnderlyingObject(varPtr);

                // **Check if the underlying object is an AllocaInst**
                AllocaInst *allocaInst = dyn_cast<AllocaInst>(underlying);
                if (!allocaInst) {
                    errs() << "  Warning: Underlying object is not an AllocaInst.\n";
                    continue;
                }
                inputAllocas.push_back(allocaInst);
            }
        }

    return inputAllocas;
}

// // Helper function to collect input Allocas from InputAnalysisPass
// std::vector<AllocaInst*> DataDependencyAnalysisPass::collectInputAllocas(Module &M, const std::vector<InputInfo> &inputs) {
//     std::vector<AllocaInst*> inputAllocas;

//     for (const auto &input : inputs) {
//         // Find the instruction at the input line
//         Instruction *callInst = nullptr;
//         for (Function &F : M) {
//             for (BasicBlock &BB : F) {
//                 for (Instruction &I : BB) {
//                     if (I.getDebugLoc()) {
//                         int line = I.getDebugLoc()->getLine();
//                         if (line == input.line) {
//                             // Assuming the input instruction is a CallInst
//                             if (auto *ci = dyn_cast<CallInst>(&I)) {
//                                 callInst = ci;
//                                 break;
//                             }
//                         }
//                     }
//                 }
//                 if (callInst)
//                     break;
//             }
//             if (callInst)
//                 break;
//         }

//         if (callInst->getNumOperands() < 2)
//             continue;

//         // Typically, operand 0 is the format string, so iterate from operand 1 onwards
//         for (unsigned i = 1; i < callInst->getNumOperands(); ++i) {
//             Value *varPtr = callInst->getOperand(i);

//             // Debug output
//             errs() << "Processing input function call at line " << input.line << " (Operand " << i << "):\n";
//             errs() << "  varPtr: ";
//             varPtr->print(errs());
//             errs() << "\n";

//             // **Find the underlying AllocaInst**
//             Value *underlying = getUnderlyingObject(varPtr);

//             // **Check if the underlying object is an AllocaInst**
//             AllocaInst *allocaInst = dyn_cast<AllocaInst>(underlying);
//             if (!allocaInst) {
//                 errs() << "  Warning: Underlying object is not an AllocaInst.\n";
//                 continue;
//             }
//             inputAllocas.push_back(allocaInst);
//         }
//     }
//     return inputAllocas;
// }

// Helper function to trace dependencies from a Value to input Allocas
void DataDependencyAnalysisPass::traceDependency(Value *V, std::unordered_set<Value*> &visited, std::vector<AllocaInst*> &inputAllocas) {
    if (!V)
        return;

    if (visited.find(V) != visited.end())
        return;

    visited.insert(V);

    // If V is an AllocaInst, add it to inputAllocas
    if (auto *allocaInst = dyn_cast<AllocaInst>(V)) {
        inputAllocas.push_back(allocaInst);
        return;
    }

    // If V is a LoadInst, trace the pointer operand
    if (auto *loadInst = dyn_cast<LoadInst>(V)) {
        traceDependency(loadInst->getPointerOperand(), visited, inputAllocas);
        return;
    }

    // If V is a StoreInst, trace both the value being stored and the pointer operand
    if (auto *storeInst = dyn_cast<StoreInst>(V)) {
        traceDependency(storeInst->getValueOperand(), visited, inputAllocas);
        traceDependency(storeInst->getPointerOperand(), visited, inputAllocas);
        return;
    }

    // If V is a BinaryOperator, trace both operands
    if (auto *binOp = dyn_cast<BinaryOperator>(V)) {
        traceDependency(binOp->getOperand(0), visited, inputAllocas);
        traceDependency(binOp->getOperand(1), visited, inputAllocas);
        return;
    }

    // If V is a CallInst, trace all arguments
    if (auto *callInst = dyn_cast<CallInst>(V)) {
        for (unsigned i = 0; i < callInst->getNumOperands(); ++i) {
            Value *arg = callInst->getArgOperand(i);
            traceDependency(arg, visited, inputAllocas);
        }
        return;
    }

    // If V is a SelectInst, trace condition, true value, and false value
    if (auto *selectInst = dyn_cast<SelectInst>(V)) {
        traceDependency(selectInst->getCondition(), visited, inputAllocas);
        traceDependency(selectInst->getTrueValue(), visited, inputAllocas);
        traceDependency(selectInst->getFalseValue(), visited, inputAllocas);
        return;
    }

    // If V is a PHINode, trace all incoming values
    if (auto *phiNode = dyn_cast<PHINode>(V)) {
        for (unsigned i = 0; i < phiNode->getNumIncomingValues(); ++i) {
            Value *incoming = phiNode->getIncomingValue(i);
            traceDependency(incoming, visited, inputAllocas);
        }
        return;
    }

    // Add more cases as needed for other instruction types

    // For other types of Values, attempt to find their defining instructions and trace operands
    if (auto *defInst = dyn_cast<Instruction>(V)) {
        for (unsigned i = 0; i < defInst->getNumOperands(); ++i) {
            Value *operand = defInst->getOperand(i);
            traceDependency(operand, visited, inputAllocas);
        }
    }
}