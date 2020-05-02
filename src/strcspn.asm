BITS 64

GLOBAL strcspn:function
section .text

strcspn:
    xor rcx, rcx
    xor r9, r9

loop:
    cmp BYTE[rdi + rcx], 0
    je end
    mov r10b, [rdi + rcx]
    inc rcx
    jmp loop2

loop2:
    cmp BYTE[rsi + r9], 0
    je reset
    cmp BYTE[rsi + r9], r10b
    je end
    inc r9
    jmp loop2

reset:
    xor r9, r9
    jmp loop

end:
    mov rax, rcx
    ret