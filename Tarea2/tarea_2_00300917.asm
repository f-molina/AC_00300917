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

l1 mov bl, [comnt+di]
    mov [di+200h], bl
    inc di
    loop l1

    ; 3

    mov si, 0d
    mov cx, 13d
    mov ax, 0d
    mov bx, 1d
    mov [si+220h], ax
    inc si
    mov [si+220h], bx
    inc si

l2  mov dx, bx
    add bx, ax
    mov [si+220h], bx
    mov ax, dx
    inc si
    loop l2

	int 20h

section .data
    comnt db "Hay Salud"
    len equ $-comnt 