;10)SWAP Escribir una subrutina SWAP que intercambie dos datos de 16 bits almacenados en memoria. Los
;    parámetros deben ser pasados por referencia desde el programa principal a través de la pila.
;    Para hacer este ejercicio, tener en cuenta que los parámetros que se pasan por la pila son las direcciones de memoria,
;    por lo tanto para acceder a los datos a intercambiar se requieren accesos indirectos, además de los que ya se deben
;    realizar para acceder a los parámetros de la pila.


RG 1000H
  OP1 DW 5544H
  OP2 DW 3366H

ORG 3000H
SWAP: CMP AH, 0  ;COMPARO CONDICIÓN DE FINAL
	JZ FIN
    CALL ROTARIZQ  
	DEC AH
	JMP ROTARIZQ_N
    FIN:RET
	
ORG 2000H
    MOV BX, OFFSET OP1 ;OBTENGO LA DIRECCIÓN DE MEMORIA
	MOV  AX, [BX]
	PUSH AX
	MOV BX, OFFSET OP2
	MOV  AX, [BX]
	PUSH AX
	CALL SWAP
HLT
END