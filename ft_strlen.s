global	_ft_strlen

section .text

_ft_strlen:
	mov	rax,	-1					; RAX is our counter. Iniciate at -1
	loop:							; Our loop for strlen
		inc rax						; Increment our RAX
		cmp byte [rdi + rax],	0	; Compare the byte RDI + RAX with '\0'
		jne loop					; Jump if Not Equal to Loop
	ret								; Return the value from RAX to main function
