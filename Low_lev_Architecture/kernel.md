# Kernels

#### Microkernel Overhead 

> " Microkernels strive to make the kernel more secure/fail-safe by removing most OS-level services (drivers, file systems, networking, ...) from privileged kernel mode and putting them into dedicated user-level applications. The microkernel itself then only provides mechanisms to start those applications and for their communication.
>
>The advantage of this approach is that user applications leverage hardware-level isolation (address spaces) and therefore a crashing driver will not take down your whole system. So far the propaganda.
>
>There is an inherent problem though: In a traditional (monolithic) kernel all components run in the same privileged address space and calling e.g., file system functionality is a simple function call. In a microkernel-based system these calls become communication relations through kernel-provided mechanisms, so the cost of such a call rises from 10s of cycles to hundreds of cycles.
>
>This is why microkernel systems are rumored to be slower than traditional operating systems and why microkernel implementors are extremely peculiar about making the kernel-provided communication mechanism as fast as possible."
