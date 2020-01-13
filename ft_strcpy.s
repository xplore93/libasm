global	_ft_strcpy

section	.text

_ft_strcpy:
	mov	rcx,	-1					; Initiate our counter to -1

	loop:
		inc	rcx						; Increment our counter
		mov	dl, byte [rsi + rcx]	; Move into DL one char from RSI + RCX
		mov	byte [rdi + rcx], dl	; Move one char from RSI + RCX (SRC) to RAX
		cmp	dl, 0					; Compare the char form RAX + RCX with '\0'
		jne	loop					; Jump if Not Equal to loop
	mov	rax,	rdi					; Move into RAX the first argument (DST)
	ret								; Return the value from RAX to main function
