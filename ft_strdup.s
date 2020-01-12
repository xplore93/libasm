extern	_ft_strlen			; We need to use ft_strlen, ft_strcpy and malloc
extern	_ft_strcpy			; 	That's why we are declaring here all of them
extern	_malloc

global	_ft_strdup

section	.text

_ft_strdup:
	call	_ft_strlen		; We call directly ft_strlen
	inc		rax				; Analogically as doing malloc(strlen(s1) + 1), increase the return value of ft_strlen
	push	rdi				; Backup our RDI because it will be override by malloc
	mov		rdi,	rax		; Passing the length + 1 to RDI before calling malloc
	call	_malloc			; Calling malloc
	pop		rsi				; Recover our data from the stack (Backed up RDI before)
	cmp		rax,	0		; Comparing the return of malloc with NULL, in case it failed
	je		return			; Jump if Equal to return thread
	mov		rdi,	rax		; Move the returned by malloc pointer to RDI
	call	_ft_strcpy		; Calling ft_strcpy to do the copy of the original string into the new one
	return:
		ret