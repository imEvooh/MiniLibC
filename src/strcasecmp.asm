BITS 64

GLOBAL strcasecmp:function
section .text

strcasecmp:
    xor rcx, rcx

loop:
    mov byte r9b, [rdi + rcx]
    mov byte r10b, [rsi + rcx]
    inc rcx
    cmp r9b, 0
    jz end1
    cmp r10b, 0
    jz end2
    cmp r9b, r10b
    jne check
    jmp loop

tolow1:
    add byte r9b, 32
    jmp check

tolow2:
    add byte r10b, 32
    jmp check

check:
    cmp r9b, 90
    jle tolow1
    cmp r10b, 90
    jle tolow2
    cmp r9b, r10b
    je loop
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