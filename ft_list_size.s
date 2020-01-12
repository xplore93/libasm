global	_ft_list_size
section	.text
_ft_list_size:
	mov		rax,	0				; Init our counter to 0
	loop:
		cmp		rdi,	0			; Compare the pointer with NULL
		je		return				; Jump if Equal to Return
		inc		rax					; Increment our counter
		mov		rdi,	[rdi + 8]	; Pass to the next element of our List
		jmp		loop				; Jump again to Loop
	return:
		ret