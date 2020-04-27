	org 100h
	; 1

section .text
	mov ax, 0d
	mov bx, 0d
	add ax, bx
	mov bx, 9d
	add ax, bx
	mov bx, 1d
	add ax, bx
	mov bx, 7d
	add ax, bx
	mov bx, 5d

	div bx
	mov di, 0d
	mov cx, [len]

l1:     mov bl, [comnt+di]
	mov [di+200h], bl
	inc di
	loop l1

	; 2

	mov cx, 0000h
	mov di, 0d
	mov bx, 2d
	mov ax, 2d
	mov cl, 0Bh

bayib:  mul bx
	cmp ax, 0100h
	jbe c1
	inc di
c1:	mov [di+210h], ax
	inc di
	loop bayib

	; 3

	mov si, 0d
	mov cx, 13d
	mov ax, 0d
	mov bx, 1d
	mov [si+220h], ax
	inc si
	mov [si+220h], bx
	inc si

l2: 	mov dx, bx
	add bx, ax
	mov [si+220h], bx
	mov ax, dx
	inc si
	loop l2

	int 20h

section .data
    comnt db "Hay Salud"
    len equ $-comnt 