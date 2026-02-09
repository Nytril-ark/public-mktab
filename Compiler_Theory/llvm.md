# LLVM 
> "LLVM is a set of compiler and toolchain technologies that can be used to develop a frontend for any programming language and a backend for any instruction set architecture."

### Sequence 
##### Front-end
- Reads and analyzes source code.
- Performs lexical analysis, parsing, semantic checks.
- Translates the language into LLVM IR (an intermediate representation).

##### Back-end
- Takes IR and optimizes it.
- Generates machine code for specific architectures (x86, ARM, etc.) 

<details>
<summary>Extras</summary>
When writing a compiler you mainly need two things:
- read + understand the source code (parsing, lexical analysis, semantic analysis etc)
- generate and optimize machine instrucs for the target platform

The first part is the front-end and it depends on whatever language you're making a compiler for. The second part is the 
back-end and it depends on the platform you're compiling for.

LLVM separates those by having a virtual machine middle-man that, after tokenization, parsing, and so on, produces code 
in an intermediate language that is sent to LLVM to produce an optimized binary for the desired architecture.
</details>
