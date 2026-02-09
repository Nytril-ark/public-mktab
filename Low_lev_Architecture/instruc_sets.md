## RISC vs CISC
RISC: Reduced Instruction Set Arch
CISC: Complex Instruction Set Arch
Those are 2 ways of designing a computer processor.
- RISC uses a small set of **fixed size** instrucs that execute in a single _[clock cycle]_
- CISC uses a larger set, many of which can do several operations (like accessing memory & computation) through a single instruc. 
- This obviously makes some CISC instrucs require several clock cycles per instruc.
- RISC has more GPR's or _["general purpose registers"]_, while CISC has less as operations get performed in memory itself. (Note: !?)
- RISC has simpler _[addressing modes]_ than CISC.
- RISC programs are longer and require more memory to get stored but require fewer transistors due to less complex commands.

CISC was more needed when a lot of programming was done using assembly, but with the advent of high-level langs, RISC architecture prevailed.

### Performance in RISC vs CISC 
##### CPU time is calculated as
$$
\text{seconds/program} = (\text{instructions per program}) \times (\text{cycles per instruction}) \times (\text{seconds per cycle})
$$

- **RISC approach for optimization:** reduce cycles per instruc at the cost of num of instrucs per program.
- **CISC approach for optimization:** reduce instrucs per program at the cost of cycles per instruc.


## Clock Cycle 
Refers to the frequency at which the clock generator of a processor can generate pulses used to synchronize the operations of its components.

- Limitations:
After each clock pulse, the signal lines inside the CPU need time to settle to their new state. 
Every signal line must finish transitioning from 0 to 1, or 1 to 0. If the next clock pulse comes before that, the results will be incorrect. 
When executing complicated instrucs that cause many transitions, the higher the clock rate the more heat produced. Could damage transistors.
