c) Escribir un programa que calcule la suma de dos números de 32 bits almacenados en la memoria sin hacer llamados a
subrutinas, resolviendo el problema desde el programa principal.

ORG 1000H
NUM1  DW 1111H
NUM12 DW 2222H
NUM2  DW 3333H
NUM22 DW 4444H
	
ORG 2000H
 MOV AX, NUM1 ; PRIMER   OPERANDO PARTE ALTA 1111H   ;2000
	MOV BX, NUM12; PRIMER2  OPERANDO PARTE BAJA 2222H   ;2002
	MOV CX, NUM2 ; SEGUNDO  OPERANDO PARTE ALTA 3333H   ;2004
	MOV DX, NUM22 ;SEGUNDO2 OPERANDO PARTE BAJA 4444H   ;2008          
	ADD BX, DX    ;2008 RESULTADO PARTE BAJA
	ADD AX, CX    ;200C  RESULTADO PARTE ALTA
HLT
END