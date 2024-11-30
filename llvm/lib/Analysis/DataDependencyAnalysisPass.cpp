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
#include <regex>

using namespace llvm;

PreservedAnalyses DataDependencyAnalysisPass::run(Module &M, ModuleAnalysisManager &MAM) {
    std::string IRString;
    raw_string_ostream IRStream(IRString);
    M.print(IRStream, nullptr);
    IRStream.flush();

    std::istringstream stream(IRString);
    std::string line;
    std::unordered_map<std::string, std::string> scopeMap;
    std::vector<std::string> blockLines;
    
    while (std::getline(stream, line)) { 
        if (line.find("= distinct !DILexicalBlock") != std::string::npos) { 
            blockLines.push_back(line);
        }
    }

    // std::size_t blockScopeStart = debugLine.find("scope:", scopeStartPos);
    // std::size_t blockScopeEnd = debugLine.find("scope:", scopeStartPos);
    // if (scopeEndPos == std::string::npos) {
    //     // Comma after scope identifier not found; assume end of line
    //     scopeEndPos = debugLine.length();
    // }
    // std::string scope = debugLine.substr(scopeStartPos, scopeEndPos - scopeStartPos);

    std::regex regex(R"(!(\d+) = distinct !DILexicalBlock\(scope: !(\d+),)");
    for (const auto &line : blockLines) {
        std::smatch match;
        if (std::regex_search(line, match, regex)) {
            std::string block = "!" + match[1].str();
            std::string scope = "!" + match[2].str();
            scopeMap[block] = scope;
            errs() << "1: " << scope << "\n";
        }
    }

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
    std::unordered_map<AllocaInst*, std::string> inputAllocas = collectInputAllocas(M, MAM, inputs);

    errs() << "Content of inputAllocas:\n";
    for (const auto &entry : inputAllocas) {
        AllocaInst *allocaInst = entry.first;
        std::string varName = entry.second;

        // Print the AllocaInst pointer (you can use its name or just its address)
        errs() << "AllocaInst: ";
        if (allocaInst) {
            allocaInst->print(errs());  // Print the allocaInst details
        } else {
            errs() << "Null AllocaInst\n";
        }

        // Print the associated variable name
        errs() << "Variable name: " << varName << "\n";
    }
    
    // // **Step 2: Iterate Over Key Points and Check Dependencies**
    // for (const auto &kp : keyPoints) {
    //     int kpLine = kp.line;
    //     SeminalFeature feature;
    //     feature.keyPointLine = kpLine;

    //     // Find the instruction at the key point line
    //     Instruction *kpInst = nullptr;
    //     for (Function &F : M) {
    //         for (BasicBlock &BB : F) {
    //             for (Instruction &I : BB) {
    //                 if (I.getDebugLoc()) {
    //                     int line = I.getDebugLoc()->getLine();
    //                     if (line == kpLine) {
    //                         kpInst = &I;
    //                         break;
    //                     }
    //                 }
    //             }
    //             if (kpInst)
    //                 break;
    //         }
    //         if (kpInst)
    //             break;
    //     }

    //     if (!kpInst) {
    //         errs() << "  Warning: No instruction found at line " << kpLine << " for key point.\n";
    //         continue;
    //     }

    //     // Collect all operands of the key point instruction
    //     std::set<Value*> operands;
    //     for (unsigned i = 0; i < kpInst->getNumOperands(); ++i) {
    //         operands.insert(kpInst->getOperand(i));
    //     }

    //     // Trace dependencies from operands to input Allocas
    //     std::unordered_set<Value*> visited;
    //     for (auto *op : operands) {
    //         traceDependency(op, visited, feature.inputAllocas);
    //     }

    //     // Remove duplicates by converting to a set and back to vector
    //     std::unordered_set<AllocaInst*> uniqueAllocas(feature.inputAllocas.begin(), feature.inputAllocas.end());
    //     feature.inputAllocas.assign(uniqueAllocas.begin(), uniqueAllocas.end());

    //     if (!feature.inputAllocas.empty()) {
    //         seminalFeatures.push_back(feature);
    //     }
    // }

    // // **Step 3: Print Seminal Features**
    // if (!seminalFeatures.empty()) {
    //     errs() << "Seminal Input Features:\n";
    //     errs() << "-----------------------\n";
    //     for (const auto &feature : seminalFeatures) {
    //         errs() << "Key Point at Line " << feature.keyPointLine << " influenced by:\n";
    //         for (const auto *alloca : feature.inputAllocas) {
    //             errs() << "  - " << *alloca << "\n";
    //         }
    //     }
    // } else {
    //     errs() << "No seminal input features identified.\n";
    // }

}

// Helper function to collect input Allocas from InputAnalysisPass
std::unordered_map<AllocaInst*, std::string> DataDependencyAnalysisPass::collectInputAllocas(Module &M, ModuleAnalysisManager &MAM, const std::vector<InputInfo> &inputs) {

    // Step 0: Get all function names and associated scopes
    std::unordered_map<std::string, std::string> functionScopes = findFunctionScopes(M, MAM);

    //Debug Information for function and scope
    errs() << "Content of functionScopes:\n";
    for (const auto &entry : functionScopes) {
        std::string funcName = entry.first;
        std::string scope = entry.second;

        // Print the AllocaInst pointer (you can use its name or just its address)
        errs() << "Function name: " << funcName << " with scope: " << scope << "\n";
    }
    errs() << "\n";

    std::unordered_map<std::string, dbgObj> varNameAndScope = findVariableNamesAndScope(M, MAM);

    // Step 5: print the final map content for debugging
    errs() << "varNameAndScope contents:\n";
    for (const auto &entry : varNameAndScope) {
        const std::string &dbgDeclareLine = entry.first;
        const dbgObj &obj = entry.second;

        errs() << "dbg_declare line: " << dbgDeclareLine << ", Variable name: " << obj.varName << ", Pointer value: " << obj.ptrValue << ", Scope is: " << obj.scope << "\n";
    }
    errs() << "\n";

    // Map all the dbg_declare along with all the 
    std::unordered_map<AllocaInst*, std::string> inputAllocas;
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
                    // errs() << "  Warning: Underlying object is not an AllocaInst.\n";
                    continue;
                }

                // Get the scope of the AllocaInst
                BasicBlock *parentBB = allocaInst->getParent(); // Parent BasicBlock
                Function *parentFunc = parentBB->getParent();   // Parent Function

                if (parentFunc) {
                    errs() << "AllocaInst belongs to function: " << parentFunc->getName() << "\n";
                }

                std::string instructionStr;
                llvm::raw_string_ostream rso(instructionStr);
                allocaInst->print(rso);
                llvm::StringRef instStr = instructionStr;
                llvm::StringRef name = instStr.split("=").first.trim();

                // errs() << name << "\n";
                // Check if 'name' exists in varNameAndScope
                std::string finalName;
                for (const auto &entry : varNameAndScope) {
                    const dbgObj& obj = entry.second;
                    if (obj.ptrValue == name) {
                        //errs() << obj.ptrValue << "   asjkdjask\n";
                        inputAllocas[allocaInst] = obj.varName;
                    }
                }
                
            }
        }

    return inputAllocas;
}

//Extract function names and associated scope ID
std::unordered_map<std::string, std::string> DataDependencyAnalysisPass::findFunctionScopes(Module &M, ModuleAnalysisManager &MAM) {
    std::string ModuleIR;
    raw_string_ostream ModuleStream(ModuleIR);
    M.print(ModuleStream, nullptr);
    ModuleStream.flush();

    std::istringstream stream(ModuleIR);
    std::string line;
    std::unordered_map<std::string, std::string> functionScopes;

    while (std::getline(stream, line)) { 
        if (line.find("define") != std::string::npos) {
            std::string scope;
            std::string name;

            // extract the scaope
            std::size_t dbgPos = line.find("!dbg");
            std::size_t exclamPos = line.find('!', dbgPos + 4); // 4 is the length of "!dbg"
            std::size_t endPos = line.find_first_of(" {", exclamPos);
            scope = line.substr(exclamPos, endPos - exclamPos);
    
            // extract the function name
            std::size_t namePos = line.find("@") + 1;
            std::size_t nameEndPos = line.find("(");
            name = line.substr(namePos, nameEndPos - namePos);

            functionScopes[name] = scope;
        }
    }
    return functionScopes;
}

// std::unordered_map<std::string, std::string> DataDependencyAnalysisPass::findFunctionScopeFromBlock(Module &M, ModuleAnalysisManager &MAM) {
//     // Extract Information from dbg.declare in LLVM IR
//     std::string IRString;
//     raw_string_ostream IRStream(IRString);
//     M.print(IRStream, nullptr);
//     IRStream.flush();

//     std::istringstream stream(IRString);
//     std::string line;
//     std::vector<std::string> blockLines;
    
//     while (std::getline(stream, line)) { 
//         if (line.find("= distinct !DILexicalBlock") != std::string::npos) { 
//             blockLines.push_back(line);
//             err() << line << "\n";
//         }
//     }


// }

std::unordered_map<std::string, dbgObj> DataDependencyAnalysisPass::findVariableNamesAndScope(Module &M, ModuleAnalysisManager &MAM) {
    // Extract Information from dbg.declare in LLVM IR
    // Step 1: Get all dbg.declare statements from IR using print streams
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

    std::unordered_map<std::string, dbgObj> dbgDeclareToVarMap;

    // Step 2: Extract the metadata ID (e.g., "!15") from the dbg_declare line
    for (const auto &dbgLine : dbgDeclareLines) {
        std::size_t startPos = dbgLine.find("ptr") + 4;
        std::size_t endPos = dbgLine.find(",", startPos);
        std::string allocaName = dbgLine.substr(startPos, endPos - startPos);

        // Extract the pointer (e.g., "%5") from the dbg_declare line
        std::size_t ptrStartPos = dbgLine.find("ptr") + 4;
        std::size_t ptrEndPos = dbgLine.find(",", ptrStartPos);
        std::string ptrValue = dbgLine.substr(ptrStartPos, ptrEndPos - ptrStartPos);

        // Now, search for the corresponding metadata ID to get the variable name
        std::size_t metaStartPos = dbgLine.find("!") + 1;
        std::size_t metaEndPos = dbgLine.find(",", metaStartPos);
        std::string metadataID = dbgLine.substr(metaStartPos, metaEndPos - metaStartPos);

        std::string debugLine;
        std::string metadataIDSearch = metadataID + " = !";  // Create search pattern for matching the metadataID

        // Reset the stream to start from the beginning again to find the metadata match
        stream.clear();
        stream.seekg(0, std::ios::beg);

        // Step 3: Find the DilocalVariable line with the associated metadataID
        while (std::getline(stream, debugLine)) {
            // Check if the current line contains the metadata ID we're searching for
            if (debugLine.find(metadataIDSearch) != std::string::npos) {
                // Extract the variable name
                std::size_t nameStartPos = debugLine.find("name: \"");
                if (nameStartPos == std::string::npos) {
                    // "name: \"" not found; skip to the next line
                    continue;
                }
                nameStartPos += 7; // Move past "name: \""
            
                std::size_t nameEndPos = debugLine.find("\"", nameStartPos);
                if (nameEndPos == std::string::npos) {
                    // Closing quote for name not found; skip to the next line
                    continue;
                }
            
                std::string varName = debugLine.substr(nameStartPos, nameEndPos - nameStartPos);
            
                // Extract the scope identifier
                std::size_t scopeStartPos = debugLine.find("scope: !");
                if (scopeStartPos == std::string::npos) {
                    // "scope: !" not found; handle accordingly (e.g., assign a default value or skip)
                    llvm::errs() << "Warning: 'scope: !' not found in line: " << debugLine << "\n";
                    continue; // Skip this line or handle as per your requirements
                }
                scopeStartPos += 7; // Move past "scope: !"
            
                std::size_t scopeEndPos = debugLine.find(",", scopeStartPos);
                if (scopeEndPos == std::string::npos) {
                    // Comma after scope identifier not found; assume end of line
                    scopeEndPos = debugLine.length();
                }
            
                std::string scope = debugLine.substr(scopeStartPos, scopeEndPos - scopeStartPos);
            
                // Create and populate the dbgObj instance
                dbgObj newEntry;
                newEntry.varName = varName;
                newEntry.ptrValue = ptrValue;
                newEntry.scope = scope;
            
                // Insert the newEntry into the map with metadataIDSearch as the key
                dbgDeclareToVarMap[metadataIDSearch] = newEntry;
            }
        }
    }

    return dbgDeclareToVarMap;
}

// // Helper function to trace dependencies from a Value to input Allocas
// void DataDependencyAnalysisPass::traceDependency(Value *V, std::unordered_set<Value*> &visited, std::vector<AllocaInst*> &inputAllocas) {
//     if (!V)
//         return;

//     if (visited.find(V) != visited.end())
//         return;

//     visited.insert(V);

//     // If V is an AllocaInst, add it to inputAllocas
//     if (auto *allocaInst = dyn_cast<AllocaInst>(V)) {
//         inputAllocas.push_back(allocaInst);
//         return;
//     }

//     // If V is a LoadInst, trace the pointer operand
//     if (auto *loadInst = dyn_cast<LoadInst>(V)) {
//         traceDependency(loadInst->getPointerOperand(), visited, inputAllocas);
//         return;
//     }

//     // If V is a StoreInst, trace both the value being stored and the pointer operand
//     if (auto *storeInst = dyn_cast<StoreInst>(V)) {
//         traceDependency(storeInst->getValueOperand(), visited, inputAllocas);
//         traceDependency(storeInst->getPointerOperand(), visited, inputAllocas);
//         return;
//     }

//     // If V is a BinaryOperator, trace both operands
//     if (auto *binOp = dyn_cast<BinaryOperator>(V)) {
//         traceDependency(binOp->getOperand(0), visited, inputAllocas);
//         traceDependency(binOp->getOperand(1), visited, inputAllocas);
//         return;
//     }

//     // If V is a CallInst, trace all arguments
//     if (auto *callInst = dyn_cast<CallInst>(V)) {
//         for (unsigned i = 0; i < callInst->getNumOperands(); ++i) {
//             Value *arg = callInst->getArgOperand(i);
//             traceDependency(arg, visited, inputAllocas);
//         }
//         return;
//     }

//     // If V is a SelectInst, trace condition, true value, and false value
//     if (auto *selectInst = dyn_cast<SelectInst>(V)) {
//         traceDependency(selectInst->getCondition(), visited, inputAllocas);
//         traceDependency(selectInst->getTrueValue(), visited, inputAllocas);
//         traceDependency(selectInst->getFalseValue(), visited, inputAllocas);
//         return;
//     }

//     // If V is a PHINode, trace all incoming values
//     if (auto *phiNode = dyn_cast<PHINode>(V)) {
//         for (unsigned i = 0; i < phiNode->getNumIncomingValues(); ++i) {
//             Value *incoming = phiNode->getIncomingValue(i);
//             traceDependency(incoming, visited, inputAllocas);
//         }
//         return;
//     }

//     // Add more cases as needed for other instruction types

//     // For other types of Values, attempt to find their defining instructions and trace operands
//     if (auto *defInst = dyn_cast<Instruction>(V)) {
//         for (unsigned i = 0; i < defInst->getNumOperands(); ++i) {
//             Value *operand = defInst->getOperand(i);
//             traceDependency(operand, visited, inputAllocas);
//         }
//     }
// }