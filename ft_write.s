global	_ft_write

section	.text

_ft_write:
	mov	rax,	0x02000004	; Move to RAX the code of calling WRITE
	syscall					; Calling to System
	ret						; Return the ammount of bytes written