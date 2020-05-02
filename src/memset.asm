BITS 64

global memset:function
section .text

memset:
    xor rcx, rcx

loop:
    cmp rdx, 0
    jz end
    mov BYTE[rdi + rcx], sil
    inc rcx
    dec rdx
    jmp loop

end:
    mov rax, rdi
    ret