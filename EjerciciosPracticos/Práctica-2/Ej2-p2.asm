; 2) Escribir un programa que muestre en pantalla todos los caracteres disponibles en el 
;    simulador MSX88, comenzando con el caracter cuyo código es el número 01H.

ORG 1000H
	CAR DB 01H
	
ORG 2000H
 MOV AL, 1
LEER:	MOV BX, OFFSET CAR ; DIRECCION DE COMIENZO
	INT 7
	INC CAR
	CMP CAR, 00FFH
	JNZ LEER
	INT 0	
END