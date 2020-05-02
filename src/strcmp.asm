BITS 64

GLOBAL strcmp:function
section .text

strcmp:
    xor rcx, rcx

loop:
    mov r9b, [rdi + rcx]
    mov r10b, [rsi + rcx]
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
    jg greater
    jmp less

greater:
    mov rax, 1
    ret

less:
    mov rax, -1
    ret

end1:
    cmp r10b, 0
    jne less
    jmp end

end2:
    cmp r9b, 0
    jne greater
    jmp end

end:
    mov rax, 0
    ret