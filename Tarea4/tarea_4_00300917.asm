org 	100h

section .text

	mov 	dx, prompt
	call 	w_strng

	xor 	si, si
	mov 	bl, 0
	mov 	bh, 0

lupi:	call 	kb
	cmp 	al, "$"
	je		mostrar
	mov		[300h+si], al
	sub 	al, 48
	mov 	ah, 0
	add 	bl, al
	inc 	si
	jmp 	lupi

mostrar:mov 	dx, nl

	call	w_strng
	mov	byte [300h+si], "$"

	call 	w_strng
	mov		ax, 0
	mov		al, bl
	mov		cl, 5d
	div		cl

	cmp		al, 10d
	mov		dx, msg10
	je		mostrar2


	cmp		al, 9d
	mov		dx, msg9
	je		mostrar2

	cmp		al, 8d
	mov		dx, msg8
	je		mostrar2

	cmp		al, 7d
	mov		dx, msg7
	je		mostrar2

	cmp		al, 6d
	mov		dx, msg6
	je		mostrar2

	cmp		al, 5d
	mov		dx, msg5
	je		mostrar2

	cmp		al, 4d
	mov		dx, msg4
	je		mostrar2

	cmp		al, 3d
	mov		dx, msg3
	je		mostrar2

	cmp		al, 2d
	mov		dx, msg2
	je		mostrar2

	cmp		al, 1d
	mov		dx, msg1
	je		mostrar2


texto:	mov 	ah, 00h
	mov		al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

mostrar2:
	call 	w_strng

	call 	kb
	int 	20h

section .data

prompt 	db 	"Ingrese ultimos 5 digitos de su carnet: $"
msg1	db 	"Solo necesito el 0$"
msg2	db 	"Aun se pasa$"
msg3	db 	"Hay salud$"
msg4	db 	"Me recupero"
msg5	db 	"En el segundo$"
msg6	db 	"Peor es nada$"
msg7	db 	"Muy bien$"
msg8	db 	"Colocho $"
msg9	db 	"Siempre me esfuerzo$"
msg10	db 	"Perfecto solo Dios$"

nl	db 	0xA, 0xD, "$"