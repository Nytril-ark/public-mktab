## *Some* notable rust features:

---

##### memory safety without gc

* Ownership and borrowing prevent use-after-free, double free, dangling pointers.
* Enforced at compile time.

##### zero-cost abstractions

* Traits, generics, and iterators compile with no runtime overhead.
* High-level code remains as fast as low-level C/C++.

##### strong concurrency model

* Channels, async/await, and strict typing for thread-safe data.
* Harder to write broken multithreaded code.

##### tooling quality

* `cargo` handles builds, tests, benches, and deps.
* Very consistent ecosystem.

##### enums and pattern matching

* Algebraic data types allow precise modeling of state.
* `match` forces covering all cases.

##### safer error handling

* `Result` and `Option` replace exceptions and nulls.
* Forces explicit handling of failure paths.

##### thread safety by the type system

* Rust enforces exclusive mutable access, preventing data races at compile time.
* Types must implement `Send`/`Sync` before they can be shared across threads.
* Unsafe sharing or mutation between threads fails to compile.

##### concise due to type inference

* Minimal type annotations needed due to inference.
* You get static typing without writing types everywhere.
* Code stays short while remaining fully type-checked.

##### no forward declarations needed

* You can call functions before they are defined.
* No header/implementation split.
* No risk of mismatched declarations.
* Minor advantage overall.
