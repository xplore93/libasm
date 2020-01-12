global	_ft_read

section	.text

_ft_read:
	mov	rax,	0x02000003	; Move to RAX the code of calling READ
	syscall					; Calling to System
	ret						; Return the ammount of bytes has read