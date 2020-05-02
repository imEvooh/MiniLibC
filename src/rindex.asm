bits 64

global rindex:function
section .text

rindex:
    cmp rdi, 0
    jz error

loop2:
    cmp BYTE[rdi + 1], 0
    je loop
    inc rdi
    jmp loop2

loop:
    cmp BYTE[rdi], sil
	jz  found
    cmp BYTE[rdi], 0
    je  error
    dec rdi
    jmp loop

found:
    lea rax, [rdi]
    jmp end

error:
    mov rax, 0
    jmp end

end:
    ret