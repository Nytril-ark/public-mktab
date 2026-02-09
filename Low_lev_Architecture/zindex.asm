section .data
    msg     db "hello, world", 10   ; string + newline
    len     equ $ - msg              ; length of the string

section .text
global _start

_start:
    ; write(1, msg, len)
    mov rax, 1       ; syscall number for write
    mov rdi, 1       ; file descriptor: stdout
    mov rsi, msg     ; pointer to string
    mov rdx, len     ; length of string
    syscall          ; call kernel

    ; exit(0)
    mov rax, 60      ; syscall number for exit
    xor rdi, rdi     ; exit code 0
    syscall
