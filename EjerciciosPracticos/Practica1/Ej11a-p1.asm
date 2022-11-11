;a)Escriba la subrutina DIV que calcule el resultado de la división entre 2 números positivos. Dichos números deben
;  pasarse por valor desde el programa principal a la subrutina a través de la pila. El resultado debe devolverse también
;  a través de la pila por valor.




RG 1000H
DIVIDENDO DW 25H
DIVISOR    DW 33H

ORG 3000H
SWAP:MOV DX, 0
	MOV BX, SP
	ADD BX, 2  
	MOV CH, [BX] ;OBTENGO EL DIVISOR
	MOV BX, SP
    ADD BX, 4
	MOV CL, [BX]; OBTENGO EL DIVIDENDO
	LOOP CH, CL
    FIN:RET
	
ORG 2000H
    MOV  AL, DIVIDENDO ;OBTENGO LA DIRECCIÓN DE MEMORIA
	PUSH AX
	MOV  AL DIVISOR
	PUSH AX
	CALL SWAP
	POP AX
	POP AX
HLT
END