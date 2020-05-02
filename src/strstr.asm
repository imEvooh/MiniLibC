BITS 64

GLOBAL strstr:function
section .text

strstr:
    xor rcx, rcx
    cmp rdi, 0
    je error
    cmp rsi, 0
    je error

loop:
    mov r9, 0
    mov r8, rcx
    cmp BYTE [rdi + rcx], 0
    je end
    inc rcx
    jmp loop2

loop2:
    cmp BYTE [rdi + r8], 0
    je loop
    cmp BYTE [rsi + r9], 0
    je end2
    mov r10b, [rdi + r8]
    cmp BYTE [rsi + r9], r10b
    jne loop
    inc r9
    inc r8
    jmp loop2

end:
    add rdi, rcx
    mov rax, rdi
    ret

end2:
    sub rcx, 1
    add rdi, rcx
    mov rax, rdi
    ret

error:
    mov rax, 0
    ret