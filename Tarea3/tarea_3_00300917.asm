org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
    	call    phrase1
    	call    phrase2
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 6d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr1:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 12d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 18d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase:	mov 	di, 29d
lupi:	mov 	cl, [msg+di-29d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret

phrase1:	mov 	di, 8d
lupi1:	mov 	cl, [msg1+di-8d]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi1
	ret

phrase2:	mov 	di, 35d
lupi2:	mov 	cl, [msg2+di-35d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

section .data
msg	db 	" I am not in danger, Skyler. I am the danger"
len 	equ	$-msg+29d

msg1	db 	"A guy opens his door and gets shot, and you think that of me?"
len1 	equ	$-msg1+8d

msg2	db 	"No! I am the one who knocks!"
len2	equ	$-msg2+35d