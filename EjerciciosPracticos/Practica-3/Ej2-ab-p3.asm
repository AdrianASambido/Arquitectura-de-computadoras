;a) * Escribir un programa para imprimir la letra “A” utilizando la impresora a través de la PIO.
;b) * Escribir un programa para imprimir el mensaje “ORGANIZACION Y ARQUITECTURA DE
;COMPUTADORAS” utilizando la impresora a través de la PIO.

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
MENSAJE DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
FIN     DB ?

ORG 2000H
; CONFIGURACION DEL PIO
	MOV AL, 11111101B
	OUT CA, AL
	
	MOV AL, 00000000B
	OUT CB, AL
; -----------------------------

	MOV BX, OFFSET MENSAJE ; CARGAMOS EL CARACTER A IMPRIMIR
	
;CONSULTAMOS EL ESTADO DE LA IMPRESORA LIBRE/OCUPADA	
POLL:IN AL, PA
	AND AL, 1 
	JNZ POLL
;------------------------------
	
; ENVIAMOS A IMPRIMIR EL CARACTER
	MOV AL, [BX]
	OUT PB, AL
;------------------------------

;FORZAMOS EL STROBE  A 1 PARA AVISAR QUE SE ENVIÓ UN CARACTER
	IN AL, PA
	OR AL, 2 ; 00000010
	OUT PA, AL
;------------------------------	

;FORZAMOS EL STROBE A 0 PARA LIBERAR
	IN AL, PA
	AND AL, 11111101B ;0FDH
	OUT PA, AL
;------------------------------

	INC BX
	CMP BX, OFFSET FIN 
	JNZ POLL

	INT 0
END