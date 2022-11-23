; b) Escribir una subrutina CONTAR_MIN que cuente el número de letras minúsculas de la ‘a’ a la ‘z’ de una cadena de
;    caracteres terminada en cero almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro,
;    y el resultado se retorna por valor también a través de un registro.
;    Ejemplo: CONTAR_MIN de ‘aBcDE1#!’ debe retornar 2.

	ORG 1000H    ; DECLARACIÓN DE VARIABLES
CADENA   DB "abcDe1"
		 DB 00H  ; CARGA EN LA SUIGUIENTE DIRECCION DE MEMORIA LA SIGUIENTE A CADENA CONDICIÓN DE FINAL 00H
		 
	ORG 3000H
CONTAR_MIN: MOV DX, 0 ; INICIO EL CONTADOR
      LOOP: MOV AH, [BX] ; MUEVO A AH LO APUNTADO POR LA DIRECCION QUE SE ENCUENTRA EN BX
		    CMP AH, 0    ; POR SI ES EL CERO CONDICIÓN DE CORTE
		    JZ FINAL
		    CMP AH, 61H  ; " a " 
		    JZ SUMA
		    CMP AH, 65H  ; " e "
		    JZ SUMA
		    CMP AH, 66H  ; " i " 
		    JZ SUMA
		    CMP AH, 6FH  ; " o "
		    jZ SUMA
          	CMP AH, 75H  ; " u " 
		    JZ SUMA
		    INC BX
		    JMP LOOP
      SUMA:	INC DX
		    INC BX
		    JMP LOOP
    FINAL:  RET

	ORG 2000H
		    MOV BX, OFFSET CADENA  ; MUEVO A BX LA DIRECCION DONDE COMIENZA CADENA
       call CONTAR_MIN
		          HLT
END