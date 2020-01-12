global	_ft_strcmp

section	.text

_ft_strcmp:
	mov	rcx,	-1					; Initiate our counter to -1
	mov	rax,	0					; Set our return register to 0
	mov	rbx,	0					; Set both registers we will use to 0
	mov	rdx,	0					;		It needs for clean the garbade

	loop:
		inc	rcx						; Increment our counter
		mov	dl, byte [rdi + rcx]	; Move into DL one char from S1
		mov	bl, byte [rsi + rcx]	; Move into BL one char from S2
		cmp	dl, bl					; Compare char from S1 with S2
		jl	first					; Jump if Lower to First loop
		jg	second					; Jump if Greater to Second loop
		cmp	dl, 0					; Compare the char form S1 with '\0'
		jne	loop					; Jump if Not Equal to loop
	ret
	first:
		sub	rbx,	rdx				; Substract S1's char to S2's char
		neg rbx						; Negate the result
		mov	rax,	rbx				; Move to return register our negative result
		ret
	second:
		sub	rdx,	rbx				; Substract S2's char to S1's char
		mov	rax,	rdx				; Move to return register our result
		ret