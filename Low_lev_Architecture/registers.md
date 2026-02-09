# Registers 

### Register => collection of flip-flops.
As flip-flops store a single bit of data, registers combine many flip-flops.
Registers perform based on 3 operations:
- fetch: used to retrieve user-provided instrucs that are stored in the main memory.
- decode: used to interpret the instrucs, the CPU will determine which Operation has to be carried out on the instrucs after they have been decoded.
- execute: cpu processes results and stores them in memory

### Addressing modes
In CPU design, addressing modes define how the machine lang instrucs in that arch identify the operand(s) of each instruction.
An addressing mode specifies how to calculate the **memory address** of an operand using info held in registers and/or constants contained
in a machine instruc or elsewhere. 

### Register types:
#### Accumulator:
the accumulator is a register in which intermediate ALU results are stored. Without an accumulator, it would be necessary to write the result
of each calculation (addition, multiplication, shift, etc.) to cache or main memory.

#### Memory Address Registers (MAR)
holds the addresses of the locations to be accessed from main-memory. This and (MDR) facilitate cpu <---> main mem communication.

#### Memory Data Registers (MDR)
Contains data to be read from or written into the addressed location.

#### General purpose registers (GPR)
Numbered as R0, R1, R2...Rn-1, and used to store temp data during any ongoing operation. Its content can be accessed by assembly programming.
Modern CPU arch tend to use more GPR so that reg-to-reg addressing can be used more, which is faster than other _[addressing modes.]_ 
These are mainly used for holding the following:
- Operands for logical and arithmetic operations
- Operands for address calculation
- Memory pointers


#### Program Counter (PC)
Used to keep track of program execution. Contains the memory address of the next instruc to be fetched from main mem when the previous
instruc has been successfully completed. It also functions to count the number of instrucs. Incrementation of PCs depends on the type of 
architecture being used. If we are using a 32-bit architecture, the PC gets incremented by 4 every time to fetch the next instruc. 
> [!NOTE]
> Is it incremented by 4 because each instruc is 1 byte? (32-bit / 4 = 8)

#### Instruction Register (IR)
The IR holds the instrucs, fetched from the program counter, which is just about to be executed. As soon as the instruc is
placed in the IR, the CPU starts executing it, and the PC points to the next instruc.

#### Stack Pointer (SP)
The stack pointer points to the top of the stack (LIFO), which is a part of the memory used to store function calls and other operations.
> [!NOTE]
> This is an over-simplification that needs more details

#### Flag Register, Status Register, or Condition Code Registers (CCR) 
Used to indicate the status of the CPU or the outcome of various operations. The size and meanings of the flag bits are architecture dependent. 
Could resemble the result of arithmetic operations well as info about restrictions placed on the CPU operation at the current time. Restrictions 
may include preventing some interrupts from prohibiting execution of a class of "privileged" instrucs. 

Below is a table for the _[x86]_ architecture flags register

| Bit # | Mask         | Abbreviation | Description                          | Category | =1                 | =0                   |
|-------|--------------|--------------|--------------------------------------|----------|--------------------|----------------------|
| **FLAGS**                                                                                                                         |
| 0     | 0x0001       | CF           | Carry flag                           | Status   | CY (Carry)         | NC (No Carry)        |
| 1     | 0x0002       | —            | Reserved, always 1 in EFLAGS         | —        | —                  | —                    |
| 2     | 0x0004       | PF           | Parity flag                          | Status   | PE (Even)          | PO (Odd)             |
| 3     | 0x0008       | —            | Reserved                             | —        | —                  | —                    |
| 4     | 0x0010       | AF           | Auxiliary Carry flag                 | Status   | AC (Carry)         | NA (No Carry)        |
| 5     | 0x0020       | —            | Reserved                             | —        | —                  | —                    |
| 6     | 0x0040       | ZF           | Zero flag                            | Status   | ZR (Zero)          | NZ (Not Zero)        |
| 7     | 0x0080       | SF           | Sign flag                            | Status   | NG (Negative)      | PL (Positive)        |
| 8     | 0x0100       | TF           | Trap flag (single step)              | Control  | —                  | —                    |
| 9     | 0x0200       | IF           | Interrupt enable flag                | Control  | EI (Enable)        | DI (Disable)         |
| 10    | 0x0400       | DF           | Direction flag                       | Control  | DN (Down)          | UP (Up)              |
| 11    | 0x0800       | OF           | Overflow flag                        | Status   | OV (Overflow)      | NV (No Overflow)     |
| 12–13 | 0x3000       | IOPL         | I/O privilege level (286+ only)      | System   | —                  | —                    |
| 14    | 0x4000       | NT           | Nested task flag (286+ only)         | System   | —                  | —                    |
| 15    | 0x8000       | MD           | Mode flag (NEC V-series only)        | Control  | (NEC) Native Mode  | (NEC) Emulation Mode |
| **EFLAGS**                                                                                                                        |
| 16    | 0x0001 0000  | RF           | Resume flag (386+ only)              | System   | —                  | —                    |
| 17    | 0x0002 0000  | VM           | Virtual 8086 mode (386+ only)        | System   | —                  | —                    |
| 18    | 0x0004 0000  | AC           | Alignment Check (486+, ring 3)       | System   | —                  | —                    |
| 19    | 0x0008 0000  | VIF          | Virtual interrupt flag (Pentium+)    | System   | —                  | —                    |
| 20    | 0x0010 0000  | VIP          | Virtual interrupt pending (Pentium+) | System   | —                  | —                    |
| 21    | 0x0020 0000  | ID           | CPUID instruction (Pentium+)         | System   | —                  | —                    |
| 22–29 | 0x3FC0 0000  | —            | Reserved                             | —        | —                  | —                    |
| 30    | 0x4000 0000  | —            | AES key flag (VIA PadLock only)      | System   | —                  | —                    |
| 31    | 0x8000 0000  | AI           | Alt. Instruction Set (VIA C5XL)      | System   | —                  | —                    |
| **RFLAGS**                                                                                                                        |
| 32–63 | 0xFFFF FFFF… | —            | Reserved                             | —        | —                  | —                    |



