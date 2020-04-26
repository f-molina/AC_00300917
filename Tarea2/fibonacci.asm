	org 100h

	mov al, 00h
	mov si, 220h
	mov [si], al
	add si, 01h
    add al, 01h
    mov [si], al
    mov cx, [0000h]
    sub cx, 0002h
l1: mov al, [si-1]
    add al, [si]
    add si, 01h
    mov [si], al
    loop l1

	int 20h