# Low Level Computer Architecture 

In this subfolder in my notes we dive closer the metal. Here, in general.md, are mostly the unorganized notes that I am yet to move into separate markdown files.



---

### 16-bit, 32-bit, 64-bit processors 
The main difference is the amount of data they can process per cycle and the maximum amount of RAM they can access. This is because the maximum number of unique memory locations 
that can be addressed is 2^n where n is the number of bits for the processor. For example, 32-bit processors can address 4GB of ram because:

(2^32) / 1024 / 1024 / 1024 = 4 GiB

Most modern systems are 64-bit (can handle up to 16 exabytes).

---

### Threads & Context Switching [this is a summary, see /cache.md]

##### Thread:
- Independent path of execution within a program.

##### Creating threads:
-In C++: `std::thread(func)`

<sup><sup>-In Java: `new Thread(runnable).start()` </sup></sup>

##### CPU cores:
- The CPU runs only as many software threads simultaneously as it has hardware threads; extra threads are *time-sliced*.

##### Context switch:
- Overhead comes from saving/restoring registers and possible _[cache misses]_.

##### Join:
- Waits for a thread to finish, effectively “rejoining” it with the main thread. (Main thread got "forked" when we started multi-threading)

##### How much threads do we actually attempt to use:
- Use a number of threads roughly equal to CPU cores; creating thousands of threads is usually for stress-testing, not speedup.


---

# Glossary & References

##### Overhead 
the consumption of computing resources for aspects that are not directly related to achieving a desired goal.

A small but interesting example of this is function overhead. 
> "Calling a function requires a relatively small amount of run-time overhead for call-stack maintenance and parameter passing. 
The overhead is relatively small, but can be problematic when there are many calls (i.e. in a loop) or when timing requirements are tight. 
Sometimes, a compiler can minimize this overhead by inlining a function; eliminating the function call.

##### PAE (Physical Address Extension)
A mechanism used by 32-bit CPUs to access more than 4 GB of physical memory, though single processes remain limited to 4 GB of virtual address space.

##### Contiguous Memory
Memory that is located in one unbroken, continuous block in the address space; OSes typically allocate memory in fragmented pages.

###### x86_64 linux syscalls 
[reference](https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/#x86_64-64-bit)

###### Moore's law
The (simply empirical) observation that the number of transistors in an integrated circuit (IC) doubles about every two years.


