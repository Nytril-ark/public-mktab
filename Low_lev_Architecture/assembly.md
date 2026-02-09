# Low-Level Concepts: Assembly and Memory
#### x86-64 Assembly Language Basics
- **Sections:** `.data` holds initialized data (strings, constants); `.text` holds the program code/instructions.
- **Directives:** `global _start` tells the linker the program entry point; `equ` defines a constant (e.g., string length).
- **Instructions:** `mov dest, src` copies data; `syscall` triggers an Operating System function call.
- **Registers:** `rax` holds the syscall number; `rdi`, `rsi`, and `rdx` hold the first, second, and third arguments for the syscall (e.g., file descriptor, string pointer, length).

#### Efficiency of Register Zeroing
- The instruction `xor dest, dest` sets a register to 0 by XOR’ing it with itself.
- This is the canonical and preferred way to zero a register because:
    1. It is shorter (encodes in fewer bytes) than `mov rdi, 0`.
    2. It is very fast, recognized by the CPU as a special zeroing operation.
    3. It avoids loading a constant (immediate).

#### CPU Register Width and Addressable Memory
- A CPU register's width is the number of bits it can hold (e.g., 64 bits for `rax`).
- The CPU can only use memory addresses that fit in its registers.
- **Address space** is determined by the register width: $2^{\text{number of address bits}}$ bytes.
- **Example:** A 32-bit CPU can generate 32-bit addresses, limiting a single process to addressing at most $2^{32}$ (4 GB) of memory.
- Contiguous memory is not guaranteed; the OS allocates memory in fragmented pages.


> [!NOTE]
> command for running my little hello world asm program
```bash
nasm -f elf64 zindex.asm -o zindex.o 
ld zindex.o -o zindex
./zindex
```

| Register   | Typical use / calling convention (Linux x86-64) |
| ---------- | ----------------------------------------------- |
| `rax`      | Return value from functions; accumulator        |
| `rbx`      | Callee-saved register                           |
| `rcx`      | 4th argument in function calls                  |
| `rdx`      | 3rd argument in function calls                  |
| `rsi`      | 2nd argument in function calls                  |
| `rdi`      | 1st argument in function calls                  |
| `rsp`      | Stack pointer                                   |
| `rbp`      | Base pointer (frame pointer)                    |
| `r8`–`r15` | Additional arguments / general-purpose          |


