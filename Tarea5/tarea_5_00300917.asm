org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 100d ; X -> Columna
	mov 	di, 35d ; Y -> Fila
	call 	linea_h2


   	mov 	si, 100d ; X -> Columna
	mov 	di, 165d ; Y -> Fila
	call 	linea_h

    	mov 	si, 110d ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_h2


    	mov 	si, 110d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_h2

    	mov 	si, 110d ; X -> Columna
	mov 	di, 95d ; Y -> Fila
	call 	linea_h2

	mov 	si, 145d
	mov 	di, 35d
	call 	linea_vp

	mov 	si, 145d
	mov 	di, 95d
	call 	linea_vp2

	mov	si, 110d ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_v2

    	mov	si, 110d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_v3p

    	mov	si, 100d ; X -> Columna
	mov 	di, 35d ; Y -> Fila
	call 	linea_v

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 111d
	jne 	lupi_h
	ret

linea_h2: 
lupi_h2:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 145d
	jne 	lupi_h2
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 165d
	jne 	lupi_v
	ret


linea_v2:   mov 	cx, si; Columna
lupi_v2:	  
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    inc     si
	cmp 	si, 170d
	jne 	lupi_v2
	ret

linea_v3p:   mov 	cx, si; Columna
lupi_v3p:	  
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    inc     si
	cmp 	si, 160d
	jne 	lupi_v3p
	ret

linea_vp:   mov 	cx, si; Columna
lupi_vp:	  
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    inc     si
	cmp 	si, 156d
	jne 	lupi_vp
	ret

linea_vp2:   mov 	cx, si; Columna
lupi_vp2:	  
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    inc     si
	cmp 	si, 156d
	jne 	lupi_vp2
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data