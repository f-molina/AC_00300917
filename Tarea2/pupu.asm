org 100h
	; 1

mov cx, 0000h
	mov di, 0d
	mov bx, 2d
	mov ax, 2d
	mov cl, 0Bh

bayib:  mul bx
	cmp ax, 0100h
	jbe cond
	inc di
cond:	mov [di+210h], ax
	inc di
	loop bayib

    int 20h