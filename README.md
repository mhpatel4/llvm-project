# llvm-project
# Seminal Input Features Detection using LLVM

## Part #2: Seminal Input Features Detection

### Overview

This project focuses on developing a static analysis tool using LLVM to automatically identify seminal input features that determine the behavior of C programs at key decision points. The tool builds on def-use relation analysis to infer which parts of the input data drive the program's runtime behavior, particularly at critical points such as:

- Conditional branching (e.g., `for` and `while` loops, `if-else` and `switch` statements)
- Function pointer calls

### Objective

The goal is to identify the specific input features (variables or portions of input) that influence the program's control flow or runtime behavior, while ignoring inputs that have no significant impact on these key points. The tool helps understand how inputs affect the runtime of a C program, especially in more complex cases involving I/O APIs.

### Configuration of LLVM on VCL - Ubuntu 22.04 LTS

#### Configure LLVM Build
```sh
sudo apt update

sudo apt install -y build-essential cmake ninja-build python3 git

git clone https://github.com/llvm/llvm-project.git

cd llvm-project

cmake -S llvm -B build -G Ninja -DLLVM_TARGETS_TO_BUILD="host" -DCMAKE_BUILD_TYPE=Release

ninja -C build

ninja -C build check-llvm (Optional: This will run LLVM tests to ensure proper configuration)
```

#### Configure Project
```sh
Move InputSourceAnalysis.cpp into /llvm-project/llvm/lib/Analysis/InputSourceAnalysis.cpp
Move InputSourceAnalysis.h into /llvm-project/llvm/include/llvm/Analysis/InputSourceAnalysis.h
Include "#include "llvm/Analysis/InputSourceAnalysis.h"" in /llvm-project/llvm/lib/Passes/PassBuilder.cpp
Add "FUNCTION_PASS("input-source-analysis", InputSourceAnalysis())" into Function Pass declaration in /llvm-project/llvm/lib/Passes/PassRegistry.def



ninja -C build

Compile LLVM IR code and run passes using commands in testing section
```
### Example Programs

**Example 1:** TODO: Update Later based on example code that should work Milestone 2
```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    int id;
    int n;
    scanf("%d, %d", &id, &n);
    int s = 0;
    for (int i = 0; i < n; i++) {
        s += rand();
    }
    printf("id=%d; sum=%d\n", id, s);
    return 0;
}
```

#### Output:
In this program, the second input n determines the number of iterations of the loop, which impacts the runtime. The analysis should detect that n is a seminal input.

```c
Line 4: n
```

**Example 2:** TODO: Update Later based on example code that should work Milestone 2
```c
int main(){
    char * str1[1000];
    File * fp = fopen ("file.txt", "r");
    char c;
    int len=0;
    while (1){
        c=getc(fp);
        if (c==EOF) break;
        str1[len++] = c;
        if (len>=1000) break; 
    }
    printf(“%s\n”, str1);
}
```

#### Output:
For this program, the length of the input file is a key factor in determining the number of loop iterations and, hence, the runtime. The analysis needs to focus on the size of the file rather than every character in it.

```c
Line 3: size of file fp
```

### Intermediate Representation Flow

This project involves analyzing a C program through various passes to generate a detailed intermediate representation. Below is a detailed description of the flow:

1. **Input C Program**
   - The process begins with the input of a C program that needs to be analyzed.

2. **Pass 1: InputSourceAnalysis**
   - In this pass, the program identifies and lists all input variables used in the C program.
   - Handles identifying input sources like scanf, getc, fopen, environment variables, and command-line arguments.
   - Will also track line number of input source and a description

3. **Pass 2: BranchingPointAnalysis**
   - Responsible for identifying control flow branching points, such as conditionals and function pointer calls., such as `if`, `else`, `switch`, `etc`.

4. **Pass 3: DefUseAnalysis**
   - Performs def-use analysis on key points identified in the previous passes.

5. **Pass 4: StaticAnalysisPass.cpp**
   - In the final pass, the program compiles all the gathered information and produces an output file named `_gen.c` that contains the analyzed and transformed code.

### Github Commands Help

#### Testing

Compile file into llvm IR format with no optimizations
```bash
clang -emit-llvm -S -O0 file.c -o file.ll
```

Print all passes that are registered to the LLVM
```bash
opt --print-passes
```
