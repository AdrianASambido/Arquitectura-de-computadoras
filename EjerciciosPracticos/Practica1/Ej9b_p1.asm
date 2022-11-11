;  b)Usando la subrutina ROTARIZQ del ejercicio anterior, escriba una subrutina ROTARIZQ_N que realice N
;    rotaciones a la izquierda de un byte. La forma de pasaje de parámetros es la misma, pero se agrega el parámetro N
;    que se recibe por valor y registro. Por ejemplo, al rotar a la izquierda 2 veces el byte 10010100, se obtiene el byte
;    01010010.

ORG 1000H
  BIT DB 10010100b
VECES DB 2
ORG 3000H
ROTARIZQ_N: CMP AH, 0  ;COMPARO CONDICIÓN DE FINAL
	JZ FIN
    CALL ROTARIZQ  
	DEC AH
	JMP ROTARIZQ_N
    FIN:RET
	
ORG 5000H
ROTARIZQ: ADD AL, AL ; LO SUMO A SI MISMO O MULTIPLICO POR DOS
	ADC AL, 0  ; SUMO EL CARRY + CERO PARA QUE NO AFECTE AL RESULTADO 	
	RET
	
ORG 2000H
	MOV AL, BIT
	MOV AH, VECES
	CALL ROTARIZQ_N
HLT
END