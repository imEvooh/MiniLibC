BITS 64

GLOBAL strncmp:function
section .text

strncmp:
    xor rcx, rcx
    cmp rdi, 0
    je err1
    cmp rsi, 0
    je err2
    jmp loop

err1:
    cmp rsi, 0
    je end
    mov rax, -1
    ret

err2:
    cmp rdi, 0
    je end
    mov rax, 1
    ret

loop:
    mov r9b, [rdi + rcx]
    mov r10b, [rsi + rcx]
    cmp rdx, rcx
    je check
    inc rcx
    cmp r9b, 0
    jz end1
    cmp r10b, 0
    jz end2
    cmp r9b, r10b
    jne check
    jmp loop

check:
    cmp r9b, r10b
    jl less
    cmp r9b, r10b
    jg less
    jmp end

greater:
    sub r10b, r9b
    movsx rax, r10b
    ret

less:
    sub r9b, r10b
    movsx rax, r9b
    ret

end1:
    cmp r10b, 0
    jne less
    jmp end

end2:
    cmp r9b, 0
    jne less
    jmp end

end:
    mov rax, 0
    ret