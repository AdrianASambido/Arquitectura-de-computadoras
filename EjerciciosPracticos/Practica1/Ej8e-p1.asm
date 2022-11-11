;e) Escriba la subrutina CONTAR_CAR que cuenta la cantidad de veces que aparece un carácter dado en una cadena
;   terminada en cero. El carácter a buscar se debe pasar por valor mientras que la cadena a analizar por referencia,
;   ambos a través de la pila.
;   Ejemplo: CONTAR_CAR de ‘abbcde!’ y ‘b’ debe retornar 2, mientras que CONTAR_CAR de ‘abbcde!’ y ‘z’
;   debe retornar 0.

org 1000h
cadena   db "cadena" ;caracter 0
  	     db 00h
original db "a"	reemplazo db "o"

org 3000h
	contar_char: mov bx,sp ;en bx vamos a usar el sp (stack pointer)
	add bx,2 ;ubicamos operando 
	mov al,[bx] ;manda el caracter a reemplazar
	add bx,2 ;ubicamos el operando
	mov ah, [bx] ;movemos el caracter original
	add bx,2 ;ubicamos el sp del primer char de la cadena
	mov cx,[bx] ;movemos el contenido del sp (la direccion)
	mov bx,cx ; movemos a bx la direccion del opera (para ir aumentando)
	mov cx,[bx] ;movemos a cx el contenido de la direccion (el caracter)
	loop: cmp byte ptr [bx],0 ;compara si es 0 para cortar
		  jz fin
		  cmp byte ptr [bx],ah ;compara el caracter
		  jz rem
		  sigue: inc bx
		  jmp loop
	 rem: mov [bx],al
	      jmp sigue
	 fin: ret
	 
org 2000h
	mov ax, offset cad ;movemos la direccion inicial de la cadena
	push ax ;la apilamos
	mov ax, original  ;movemos el caracter ORIGINAL
	push ax ;lo apilamos
	mov ax, reemplazo ;movemos el caracter a reemplazar
	push ax
	call contar_char
	POP AX
	POP AX
	POP AX
hlt
end