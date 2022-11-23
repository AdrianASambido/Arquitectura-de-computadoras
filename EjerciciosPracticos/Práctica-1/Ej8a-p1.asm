;a) Escribir una subrutina LONGITUD que cuente el número de caracteres de una cadena de caracteres terminada en
;   cero (00H) almacenada en la memoria. La cadena se pasa a la subrutina por referencia vía registro, y el resultado se
;   retorna por valor también a través de un registro.
;   Ejemplo: la longitud de ‘abcd’00h es 4 (el 00h final no cuenta)
	
	ORG 1000H    ; DECLARACIÓN DE VARIABLES
CADENA   DB "CARACTERES"
		 DB 00F  ; CARGA EN LA SUIGUIENTE DIRECCION DE MEMORIA LA SIGUIENTE A CADENA CONDICIÓN DE FINAL 00F
		
	ORG 3000H    ; SUBRUTINA
LONGITUD:MOV DX, 0		
   LOOP: MOV AH, [BX] ;GUARDO EN AH LO APUNTADO POR LA DIRECCION QUE SE ENCUENTRA EN BX
		 CMP AH, 0    ; SI LLEGUE AL ÚLTIMO LUGAR CONDICIÓN DE FINAL
		 JZ FINAL
		 INC DX       ; INCREMENTO EL CONTADOR
		 INC BX       ; MUEVO UN LUGAR EN LA MEMORIA PARA BUSCAR EL PROXIMO CATACTER
		 JMP LOOP
FINAL    RET
				
	ORG 2000H    ; PROGRAMA PRINCIPAL
		 MOV BX, OFFSET CADENA  ; GUARDA EN BX LA DIRECCIPON DE CADENA 1000H
    CALL LONGITUD
	     HLT
END