BITS 64

global memcpy:function
section .text

memcpy:
    xor rcx, rcx

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