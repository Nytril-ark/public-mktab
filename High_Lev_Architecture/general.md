# Software architecture: microservices, macroservices, and monolithic architecture
#### Microservices
> Architectural approach to developing software as a collection of small, independent services that are each tied to a specific business capability,
for which they communicate over a network. 

The Services are independently deployable, and can use different technologies. This improves modularity, scalability, and flexibility, especially in 
cloud-native and containerized environments. This allows scaling only the services that need it, unlike monolithic architectures where the whole app must scale.
Here, we treat the increased complexity of the architecture, APIs, monitoring, and so on, for advantages like:
    - Faster deployment & better scalability + reusablity
    - Multiple teams can work on the same component


##### Macroservices
If we were to oversimplify it, then we can call macroservices a point between a microservice architecture and a monolithic one.

##### Monolith 
Just the traditional unified software design model. Could also be described as "self contained". It often causes longer compile and load times, but the advantages are:
    - Better throughput than microservice-based architecture
    - Easier to test, debug, log, config, and monitor.
    - Easier to deploy, as only one package needs to be migrated to the server

---


# Multi-Language System Architecture
#### Rust in the Linux Kernel
- Rust was added to the Linux kernel (starting in 6.1) primarily to enable memory-safe kernel components.
- Its main use is to write safe drivers (the most error-prone part of the kernel) to eliminate bugs like use-after-free and buffer overflows. Rust supplements C; it does not replace it.

#### Mixing Rust and C++
- Mixing these languages is neutral and depends entirely on the architecture.
- **Good idea when:** Languages are separated into **modules with clean boundaries** (e.g., Rust for safety-critical logic, C++ for performance) and communication is handled through stable interfaces like the *C ABI (FFI)*.
- **Bad idea when:** Languages are mixed at a fine granularity, lack clear module boundaries, or complicate the build/packaging process.

#### Python → C++ → Rust Architecture
- This architecture is considered sane, common, scalable, practical, and architecturally clean <sup><sub>[yes]</sub></sup>. 
- This is when each language has a clear, isolated responsibility.
    - **Python Frontend:** Best for CLI, scripting, prototyping, and easy UX.
    - **C++ Middleman/Adapter:** Provides a stable C ABI interface between Python and Rust. It handles type conversions, memory ownership, and error handling, so Python never touches Rust directly.
    - **Rust Performance Module:** Implements CPU-intensive or correctness-critical logic and can be built as a `cdylib` exposing a C ABI.
- We use C ABI boundaries for communication to ensure stability and portability.


---


# Data Handling and Organization
#### Serialization
- **Serialization** is the process of converting an in-memory object into a byte sequence so it can be saved, sent over a network, or stored in a database.
- **Deserialization** is the reverse process.
- Serialization acts as the bridge, as objects live in RAM, but files and networks only handle bytes.
- Examples include JSON serialization (text) and Binary serialization (raw bytes, e.g., Protobuf). Libraries exist for many formats, including `nlohmann::json` (C++) and Python’s built-in `json` module.


---

# Glossary 

##### Protocol buffers 
A.k.a Protobuf, is a FOSS, cross-platform data format used for *serializing* structures data. 

##### Loose Coupling
Loosely coupled means components depend on each other as little as possible, so changes in one have minimal impact on others.

##### Benchmarking 
running a program using some standard tests to figure its performance, mem usage, etc.

##### Defensive Programming 
An approach that assumes code may fail and writes code to anticipate, detect, and handle potential
issues to prevent crashes and ensure continued function under unforeseen circumstances.

##### Software Organization Terminology
- **Module:** A logically grouped set of code (functions, classes) that provides one purpose (e.g., `math` module). Goal: isolate concerns.
- **Submodule:** A smaller, more specific part inside a module (e.g., `tcp` inside a `network` module). Goal: break a big module into tightly focused components.
- **System:** A full unit of functionality that depends on several modules to deliver a complete capability (e.g., Login system, Rendering system).
- **Subsystem:** A component of a larger system, designed to isolate parts so they can evolve independently (e.g., Window subsystem).

