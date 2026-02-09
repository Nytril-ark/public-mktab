# Compiler Theory


### Basic compilation sequence 

might go as following:

#### 1. Lexical Analysis 
* Lexers or Scanners are the first phase of a compiler. They take raw characters of source code, and group them into "tokens", like: identifiers, numbers, keywords, operators, punctuation. Whitespace / comments are removed at this phase. 

* Example:
  `x = 10 + y` → tokens: `IDENT(x)`, `=`, `NUMBER(10)`, `+`, `IDENT(y)`.

#### 2. Parsing (Syntax Analysis)

* Takes tokens from the lexer builds a *"parse tree"* or *"Abstract Syntax Tree"* according to grammar rules. It then checks whether the sequence of tokens forms valid structure.

*  Example: recognizes `expr = expr + expr`, `assignment = IDENT '=' expr`, etc.

#### 3. Semantic Analysis

* Takes the Abstract Syntax Tree (or AST) and checks the meanings rather than mere syntax. It also attaches types and other metadata to AST nodes. This phase performs stuff like:
  * type checking
  * detecting undeclared variables
  * function signature matching
  * return statement validity

*Example: `x + true` might be syntactically valid but semantically invalid.

#### 4. IR Generation 

* An intermediate form is generated, like LLVM IR, Java bytecode, etc. Then, commonly, optimization starts here. Afterwards we probably move onto machine-code generation and linking if needed.


---

# Glossary 

##### Backus–Naur form (BNF) 
a notation system for defining the syntax of programming languages.

##### Java bytecode 
Java bytecode is the instruction set of the Java virtual machine (JVM), the language to which Java and other JVM-compatible source code is compiled.

##### Type safety 
The extent to which a programming language discourages or prevents type errors. Commonly, type safe langs are called "strongly" or "statically" typed.


