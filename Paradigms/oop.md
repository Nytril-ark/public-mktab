# Object-oriented programming 

### Where is it often a good case?
#### When OOP Excels: 
(data && behavior) modeling, reuse, encapsulation.
- **Modeling Real-World Entities:** When objects naturally have both data and behaviour (e.g., game engine classes like Player, Enemy).
- **Code Reuse:** Via inheritance and polymorphism, allowing flexible extension while reducing duplication.
- **Encapsulation:** Used to hide implementation details and expose only safe interfaces (e.g., a `BankAccount` class controlling balance changes).
- **Large Codebases:** Helps teams manage complexity in big systems like web frameworks or game engines.

#### When OOP struggles and becomes a bad fit:
- **High-Performance, Low-Level Code:** Due to potential runtime overhead from virtual calls, dynamic dispatch, and less predictable memory layout (e.g., OS kernels, graphics engines).
- **Small Scripts:** Adds unnecessary boilerplate; procedural or scripting style is faster.
- **Functional-Style Computation:** Mutable state makes reasoning about data flows difficult in data transformation pipelines or heavy math/ML workloads.
- **State-Heavy or Concurrent Systems:** Shared mutable state within objects leads to race conditions; functional programming handles concurrency better.

