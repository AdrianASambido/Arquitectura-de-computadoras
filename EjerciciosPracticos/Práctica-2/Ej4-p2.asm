; 4) Lectura de datos desde el teclado.
;    Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado e inmediatamente lo muestre en la
;    pantalla de comandos, haciendo uso de las interrupciones por software INT 6 e INT 7.

ORG 1000H
CAR	DB ?
ORG 2000H
	MOV BX, OFFSET CAR
	MOV AL, 1
	INT 6
	INT 7
	INT 0
END