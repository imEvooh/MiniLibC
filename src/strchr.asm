BITS 64

GLOBAL strchr:function
section .text

strchr:
    xor rcx, rcx
    cmp rdi, 0
    jz error

loop:
    cmp BYTE[rdi + rcx], sil
	jz  found
    cmp BYTE[rdi + rcx], 0
    je  error
    inc rcx
    jmp loop

found:
    lea rax, [rdi + rcx]
    jmp end

error:
    mov rax, 0
    jmp end

end:
    ret