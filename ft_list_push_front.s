global	_ft_list_push_front
extern	_malloc
section	.text
_ft_list_push_front:
	push	rdi					; Backing up our RDI and RSI (**begin_list, *data)
	push	rsi
	mov		rdi,		16		; Move the size of our structure to RDI, 8 Bytes x 2 pointers (*data, *next)
	call	_malloc				; Calling malloc(16)
	pop		rsi					; Recovering our RDI and RSI
	pop		rdi
	mov		[rax],		rsi		; With brackets we access to the pointer's value,
								; 	so we save the value of RSI (an address to *data)
								; 	onto first pointer of RAX (our structure)
	mov		rcx,		[rdi]	; Move the address from RDI into RCX
	mov		[rax + 8],	rcx		; Move to RAX+8 (LST->next) the address from RCX
	mov		[rdi],		rax		; Saving into address in RDI our structure from RAX
	ret