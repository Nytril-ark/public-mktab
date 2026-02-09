# Chapter 3: Functions


the book starts off by refactoring a seemingly very convoluted java function into 9 simple lines, to demonstrate the upcoming concepts. He proceeds to shorten it to 5 lines later like an absolute magician.

## Writing Better Functions:

---

### Make them Small!

---

### Blocks and Indenting
> "This implies that the blocks within if statements, else statements, while statements, and so on should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small, but it also adds documentary value because the function called within the block can have a nicely descriptive name."
>
> [!NOTE]
> Less indentation levels >> much better

---

### Do one thing.
> **"FUNCTIONS SHOULD DO ONE THING. THEY SHOULD DO IT WELL. THEY SHOULD DO IT ONLY."**

Functions that do one thing cannot be reasonably divided into smaller sections.

---

### Reading Code from Top to Bottom: The Stepdown Rule.

> " We want the code to read like a top-down narrative.5 We want every function to be fol- lowed by those at the next level of abstraction so that we can read the program, descending one level of abstraction at a time as we read down the list of functions."
>
> To do x, we do y. to do y, we do z, and to do z, we do ...

> [!NOTE]
> Funnily, I'm just 70 pages into the book and things are getting increasingly less fun. Perhaps it's because of the Java, perhaps it's because I haven't worked with a system big enough that it needs this level of "cleanliness".

---

### Switch Statements 
If a single switch statement will be used several times throughout the code, it would be better to hide it behind an *abstract factory*

---

### Function Arguments
> "The ideal number of arguments for a function is zero (niladic). Next comes one (monadic), followed closely by two (dyadic). Three arguments (triadic) should be avoided where possible. More than three (polyadic) requires very special justification—and then shouldn’t be used anyway."

> [!IMPORTANT]
> Based on the number of arguments for a function:
> - 0)  niladic
> - 1)  monadic 
> - 2)  dyadic 
> - 3)  triadic
> - 4+) polyadic

#### Common Monadic Forms
> - asking a question about the argument 
> - operating on the arg and then returning it 
> - event: input arg with no output arg. Used to alter the state of the system.

> [!NOTE]
> Paused on page 72. 
> Day 2, 14 pages in 1.5 hrs.

> [!IMPORTANT]
> Day 2 still, Started focused reading on page 72. After 1hr 15 mins, I'm on page 84, onto the next chapter.

---

### Flag Arguments 
> "Flag arguments are ugly. Passing a boolean into a function is a truly terrible practice. It immediately complicates the signature of the method, loudly proclaiming that this function does more than one thing. It does one thing if the flag is true and another if the flag is false!"

Think of this through visualizing the code for each option. Rather than a function that contains a (possibly large) if else block, you separate into 2 functions, either of which gets called according to the flag without having to pass it as a parameter. This reduces the cognitive load of following the arg/param around.

---

### Dyadic Functions 
> " A function with two arguments is harder to understand than a monadic function. For example 
```java
writeField(name)
```
> is easier to understand than 
```java
writeField(output-Stream, name)
```
> Though the meaning of both is clear, the first glides past the eye, easily depositing its meaning. The second requires a short pause until we learn to ignore the first parameter. And that, of course, eventually results in problems because we should never ignore any part of code. The parts we ignore are where the bugs will hide."

> [!NOTE]
> Contemplate over the above later. 

However this doesn't apply to when the two arguments are - for example - ordered components of a single value. like passing (0, 0) as a cartesian coord. They have a natural cohesion and ordering that we can infer, unlike the former `writeField()` example.

---

### Argument Objects 
```cpp 
Circle makeCircle(double x, double y, double radius); 
Circle makeCircle(Point center, double radius);
```

Joining them into a single argument ties them better according to the author. I almost disagree with him here, considering he just made an example where a dyadic function takes coords, by this logic, he should've made it monadic and gave it a point object that contains the x and y. But, perhaps this is just an example.

---

### Have No Side Effects

```
Listing 3-6,  page 75/462
```

`Session.initialize()` in the code example is a side effect that results in "temporal coupling"

---

### Temporal/Sequential Coupling
In OOP, temporal coupling is a form of coupling where a class requires its methods to be called in a particular sequence.
This may be an *anti-pattern*, depending on context. 

<sup>*Methods whose name starts with Init, Begin, Start, etc. may indicate the existence of sequential coupling.* </sup>

Using a car as an analogy, if the user steps on the gas without first starting the engine, 
the car does not crash, fail, or throw an exception - it simply fails to accelerate.

> More generally, temporal coupling is a software design issue where two or more components 
or operations are dependent on a specific order or timing of execution to function correctly


### Command-Query separation
Functions should either do something, or answer about the state or value of something. Doing both together violates the principals of clean code. When wanting both the command and query, separate them into a query function and a command function.


### Returning error codes 
Using exceptions (try/catch) doesn't lead to the confused that would otherwise be there if the error processing depended on an error code. This way, the error processing code is separated from the happy path/sequence of events. Overall resulting in cleaner logic and less nested `if` statements.


### Extract Try/Catch Blocks 
It is better to extract the bodies of try/catch blocks into functions of their own if that could de-clutter the code. As functions should do one thing, a function that is concerned with a try/catch block should *not* be concerned with anything else. That is, the try/catch block should be the only thing with that function, achieving separation.


### Error Code dependency magnet
Returning error codes implies that there is some enum or something where those codes are defined. 
```cpp
enum Error {
    OK, 
    INVALID, 
    NO_SUCH, 
    LOCKED, 
    OUT_OF_RESOURCES, 
    WAITING_FOR_EVENT
};
```
Such thing is a *"dependency magnet"*. Many classes and functions use it, and as such, if the Error enum changes, all the other classes need to be recompiled and redployed. This puts us in a situation where we don't want to add new errors and end up reusing old errors, just because we want to aboid having to rebuild/redploy. 

> "When you use exceptions rather than error codes, then new exceptions are derivatives of the exception class. They can be added without forcing any recompilation or redeployment. This is an example of the Open Closed Principle"

> [!NOTE]
> understand this redeployment/recompilation, and derivative idea more.

### Don't Repeat Yourself 
> "Structured programming, Aspect Oriented Programming, Component Oriented Programming, are all, in part, strategies for eliminating duplication. It would appear that since the invention of the subroutine, innovations in software develop- ment have been an ongoing attempt to eliminate duplication from our source code."

> [!NOTE]
> Research those paradigms later

## Conclusion 
When writing a function, you could write it normally first and then attempt to gradually restructure it using the rules learned throughout this chapter.





---

#### *Some learned words*:

- Anti-pattern: a solution to a class of problem which may be commonly used but is likely to be ineffective or counterproductive.

- Predicate (noun): something which is evaluated as either true or false, like what goes into the parentheses of an `if` statement.

- Predicate (verb) [formal logic]: state, affirm, or assert (something) about the subject of a sentence or an argument of a proposition.
