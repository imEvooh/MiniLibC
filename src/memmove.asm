BITS 64

global memmove:function
section .text

memmove:
    xor rcx, rcx
    cmp rdi, 0
    je end
    cmp rsi, 0
    je end
    jmp loop

loop:
    cmp rdx, rcx
    jz end
    mov r10b, [rsi + rcx]
    mov [rdi + rcx], r10b
    inc rcx
    jmp loop

end:
    mov rax, rdi
    ret