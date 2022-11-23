;c) Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La
;   rutina debe recibir el carácter por valor vía registro, y debe retornar, también vía registro, el valor 0FFH si el
;   carácter es una vocal, o 00H en caso contrario.
		org 1000H
CHAR		DB "A"
RESULTADO	DB ?

		org 3000H
ES_VOCAL:   MOV AL, 0FFH  
			CMP AH, 61H  ; " a " 
		    JZ FIN
		    CMP AH, 65H  ; " e "
		    JZ FIN
		    CMP AH, 66H  ; " i " 
		    JZ FIN
		    CMP AH, 6FH  ; " o "
		    JZ FIN
          	CMP AH, 75H  ; " u " 
			JZ FIN
			CMP AH, 41H  ; " A " 
		    JZ FIN
		    CMP AH, 45H  ; " E "
		    JZ FIN
		    CMP AH, 49H  ; " I " 
		    JZ FIN
		    CMP AH, 4FH  ; " O "
		    JZ FIN
          	CMP AH, 55H  ; " U "
			JZ FIN
			MOV AL 00H
		FIN:RET
		
		ORG 2000H
			MOV AH, CHAR
	   CALL ES_VOCAL
			MOV RESULTADO, AL
			HLT
END