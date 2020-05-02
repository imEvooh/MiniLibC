BITS 64

GLOBAL strlen:function
SECTION .text

strlen:
	push	rbp
	mov		rbp, rsp
	xor		rcx, rcx

loop:
	cmp	BYTE [rdi + rcx], 0
	jz 	end
	add rcx, 1
	jmp loop

end:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret