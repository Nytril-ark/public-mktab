# Functions

### Difference Between Function, Subroutine & Method

The term "function" has to be the most broad of the three. It can be said to be a callable, invokable unit of software logic, with a possible interface.
A method is a function that is specifically bound to a class or object in oop. As for subroutines, they can almost be deduced from the following quote: 

> "Some languages, such as Pascal, Fortran, Ada and many dialects of BASIC, use a different name for a
callable unit that returns a value (function or subprogram) vs. one that does not (subroutine or procedure). 
Other languages, such as C, C++, C# and Lisp, use only one name for a callable unit, function. 
The C-family languages use the keyword void to indicate no return value."


### What's a Call stack?
A.k.a. execution stack, program stack, control stack, run-time stack, or machine stack. Often just shortened to simply the "stack".
In simple terms, the call stack is used by the program to remember where to return after each function call.

- When a function is called, the program pushes a small record (return address + local data) onto the stack.
- When the function finishes, the program pops that record and jumps back to the saved return address.
- If functions call more functions, entries keep stacking up. Once they finish, entries unwind in reverse order.

If too many calls happen (deep recursion, infinite calls), the stack runs out of space => *stack overflow*.




---

# Glossary 

##### Arity 

> "In logic, mathematics, and computer science, 'Arity' is the number of arguments or operands taken by a function, operation or relation."

##### Type Signature / Function Signature 
Defines the inputs and outputs of a *function, subroutine or method*. It includes the number, types, and order of the function's arguments.
It is used to resolve *overloading*, where a specific definition of a function is chosen from the many overloaded forms.

##### Entry Point 
The place where the execution of a program begins, and where the program has access to command line args. Often, "main".

