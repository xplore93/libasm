global	_ft_list_sort
section	.text

_ft_list_sort:						; rdi = t_list **begin, rsi = int (*cmp)()
	cmp		rdi,	0				; begin == NULL
	jz		return
	cmp		rsi,	0				; cmp == NULL
	jz		return
	mov		r12,	[rdi]			; first = *begin
	jmp		compare_main
	increment_main:
		mov		rcx,	[rdi]		; Move *begin to RCX
		mov		rbx,	[rcx + 8]	; Move (*begin)->next to RBX
		mov		[rdi],	rbx			; *begin = (*begin)->next
	compare_main:
		cmp		QWORD [rdi],	0	; !*begin
		jz		return
		mov		rcx,	[rdi]		; Move *begin to RCX
		mov		rbx,	[rcx + 8]	; current = (*begin)->next
	compare_single:
		cmp		rbx,	0			; !current
		jz		increment_main
	compare:
		push	rdi
		push	rsi
		mov		rax,	rsi			; rax now points to (*CMP)
		mov		rcx,	[rdi]		; rcx points to (*begin)->data
		mov		rdi,	[rcx]		; rdi = (*begin)->data
		mov		rsi,	[rbx]		; rsi = current->data
		call	rax					; (*cmp)((*begin)->data, current->data)
		pop		rsi
		pop		rdi
		cmp		rax,	0			; cmp > 0
		jg		swap
	swap:
		mov		r8,		[rdi]		; Move (*begin)->data to R8
		mov		rcx,	[r8]		; rcx = (*begin)->data
		mov		rax,	[rbx]		; rax = current->data
		mov		[r8],	rax			; (*begin)->data = current->data
		mov		[rbx],	rcx			; current->data = (*begin)->data
		mov		rcx,	[rbx + 8]	; Move current->next to RCX
		mov		rbx,	rcx			; current = current->next
		jmp		compare_single
	return:
		mov		[rdi],	r12			; *begin = first
		ret