# Software Design Patterns

### Patterns that might be nice to skip if reading the GoF book
- **Singleton:**
    - What it is: A class that allows only one instance and provides global access.
    - Pros: Simplifies access to system-wide resources (logging, configuration).
    - Cons: It encourages global mutable state, making code hard to test, hard to reason about, and is considered an anti-pattern. 
            It solved the need for a global resource before modules or DI frameworks existed.

- **Abstract Factory:**
    - **What it is:** Creates families of related objects without specifying concrete classes.
    - **Pros:** Enforces consistent families, good when switching implementations at runtime.
    - **Cons/Why Skip:** Involves heavy class scaffolding and is verbose. It is generally replaced by simple factory functions, closures, or modern Dependency Injection (DI) containers.
- **Visitor:**
    - **What it is:** Separates operations from a complex object structure (e.g., AST traversal).
    - **Pros:** Allows adding new operations without modifying the existing data structures (like the parse tree).
    - **Cons/Why Skip:** Complex, involves double-dispatch complexity. It is unnecessary in modern languages (Rust, Kotlin, Scala) that support powerful pattern matching and algebraic data types.
- **Mediator:**
    - **What it is:** A central object that manages communication between decentralized components.
    - **Pros:** Reduces chaotic direct communication, makes components independent.
    - **Cons/Why Skip:** The mediator becomes a bottleneck and grows too big; event buses or reactive systems handle this better.
- **Memento:**
    - **What it is:** Captures an object’s internal state to restore it later (for undo/redo systems).
    - **Pros:** Allows safe implementation of undo features.
    - **Cons/Why Skip:** Modern serialization and snapshot systems generally make it obsolete. It can also lead to huge memory use.
- **Flyweight:**
    - **What it is:** Shares small immutable objects to save memory.
    - **Pros:** Saves RAM efficiently when an application needs millions of identical objects.
    - **Cons/Why Skip:** Rarely needed today because common memory sizes (16–64GB) make memory pressure less critical.

--- 


### Some of the more useful patterns

| Pattern | Idea | Use Today | Pros | Cons |
| :--- | :--- | :--- | :--- | :--- |
| **Strategy** | Selects an algorithm at runtime by swapping interchangeable objects. | Configurable behaviors without if/else chains. | Clean extensibility, good for DI. | Can create many small classes if overused. |
| **Observer** | One object broadcasts changes to many listeners. | UI events, reactive systems, pub/sub. | Decouples sender from receivers. | Hard to trace, potential for hidden side effects. |
| **Adapter** | Wraps an incompatible API to match an expected interface. | Interfacing between modules/languages, compatibility layers. | Lets you use legacy code without rewriting. | Adds indirection; too many adapters can become messy. |
| **Decorator** | Adds features to an object dynamically by wrapping it. | Middleware, I/O streams, logging wrappers. | Composable behavior; avoids deep inheritance. | Can become hard to debug when layers wrap each other. |
| **Facade** | Provides a simplified API for a complex subsystem. | Libraries, modules, SDKs, defining "entry points". | Clean borders between subsystems; reduces cognitive load. | Risk of over-simplification or hiding too much. |
| **Iterator** | Uniform way to traverse collections without exposing internals. | Ubiquitous across C++, Rust, Python, Java. | Enables clean looping constructs. | None significant today. |

--- 

## Further details: 
#### Factories:
A factory is a design pattern that provides an interface for creating objects without specifying the exact
class of object that will be created. It encapsulates the object creation logic, making code more flexible 
and easier to maintain.

#### Dependency Injection 
- A technique where an object or function receives the obj/funcs it needs, instead of creating them itself. 
- Could also be a solution for making applications support different configs.

<details>
<summary>Extras</summary>

- The "client" doesn't know how dependencies are constructed; an external "injector" provides them.
- This separates object construction from object use, leading to *"loosely coupled"* programs.
- This aligns with the *Dependency Inversion Principle*, which states that High-level modules (business logic) should not depend on low-level modules (concrete details).

###### Making Implicit Dependencies Explicit
- this means that instead of hiding what a piece of code needs to work, you clearly show all its dependencies upfront—so it’s obvious what it relies on.

###### Runtime Flexibility
- In statically typed languages, clients only declare interfaces, not concrete implementations, allowing runtime flexibility without recompilation. 
- This means, at runtime, you can choose which concrete implementation to “plug in” without changing the high-level code. Thus, not needing to recompile modules that depend on submodules, when the submodules get their implementation changed


</details>


