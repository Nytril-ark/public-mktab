## Functional Programming 

#### First Class Functions & High Order Functions 
A programming lang is said to have first-class functions if it treats functions as "first-class citizens", i.e. the language supports passing funcs as args to other funcs,
returning them as the values from other funcs, and assigning them to variables or storing them in data structures. Those are necessary for functional programming.

> "In languages with first-class functions, the names of functions do not have any special status; they are treated like ordinary variables with a function type."

Languages where functions are not first-class often still allow one to write HOF's through the use of *function pointers* or *delegates*. 

An example in C would be:
```C
void map(int (*f)(int), int x[], size_t n) {
    for (int i = 0; i < n; ++i) {
        x[i] = f(x[i]);
    }
}
```
#### HOF's 
High Order Functions must at least satisfy one of the following criterea:
- Take a func as an argument.
- Return a func as an argument.

> "All other functions are first-order functions. In mathematics higher-order functions are also termed operators or functionals.
The differential operator in calculus is a common example, since it maps a function to its derivative, also a function.
Higher-order functions should not be confused with other uses of the word "functor" throughout mathematics, see *"Functor"*."


#### Closure  (a.k.a. lexical closure & function closure)
A closure is the combination of a function and the lexical environment (its surrounding scope) in which it was declared.

Implementing lexically scoped name binding in a language with first-class functions:
> "Operationally, a closure is a record storing a function[a] together with an environment. The environment is a mapping associating each free variable 
of the function (variables that are used locally, but defined in an enclosing scope) with the value or reference to which the name was bound when the 
closure was created. Unlike a plain function, a closure allows the function to access those captured variables through the closure's copies of their 
values or references, even when the function is invoked outside their scope."
