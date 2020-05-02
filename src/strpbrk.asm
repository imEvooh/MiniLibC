bits 64

global strpbrk:function
section .text

strpbrk:
    xor rcx, rcx

loop:
    cmp BYTE [rdi], 0
    jz error
    mov r10, rsi
    mov al, [rdi]

second_loop:
    cmp BYTE [r10 + rcx], 0
    jz continue
    cmp BYTE[r10 + rcx], al
    jz found
    inc rcx
    jmp second_loop

found:
    mov rax, rdi
    jmp end

continue:
    inc rdi
    xor rcx, rcx
    jmp loop

error:
    mov rax, 0

end:
    ret