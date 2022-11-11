;  d) * Usando la subrutina anterior escribir la subrutina CONTAR_VOC, que recibe una cadena terminada en cero por
;    referencia a través de un registro, y devuelve, en un registro, la cantidad de vocales que tiene esa cadena.
;    Ejemplo: CONTAR_VOC de ‘contar1#!’ debe retornar 2

		org 1000H
CADENA		DB "AcIEuon1"
			DB 00H

		org 3000H
ES_VOCAL:  	CMP AH, 61H  ; " a " 
		    JZ SUMA
		    CMP AH, 65H  ; " e "
		    JZ SUMA
		    CMP AH, 66H  ; " i " 
		    JZ SUMA
		    CMP AH, 6FH  ; " o "
		    JZ SUMA
			CMP AH, 75H  ; " u " 
			JZ SUMA
			CMP AH, 41H  ; " A " 
		    JZ SUMA
		    CMP AH, 45H  ; " E "
		    JZ SUMA
		    CMP AH, 49H  ; " I " 
		    JZ SUMA
		    CMP AH, 4FH  ; " O "
		    JZ SUMA
			CMP AH, 55H  ; " U "
			JZ SUMA
			JMP FIN
	   SUMA:INC DX	
		FIN:RET
		
		ORG 3200H
CONTAR_VOC: MOV DX, 0
	   LOOP:MOV AH, [BX]	
	        CMP AH, 0
	        JZ FINAL
            CALL ES_VOCAL
	        INC BX
	        JMP LOOP	
FINAL:      RET
			
		ORG 2000H
			MOV BX, OFFSET CADENA
	   CALL CONTAR_VOC			
			HLT
END