; c) * Usando la subrutina ROTARIZQ_N del ejercicio anterior, escriba una subrutina ROTARDER_N que sea similar
;   pero que realice N rotaciones hacia la derecha.
;   Una rotación a derecha de N posiciones, para un byte con 8 bits, se obtiene rotando a la izquierda 8 - N posiciones. Por
;   ejemplo, al rotar a la derecha 6 veces el byte 10010100 se obtiene el byte 01010010, que es equivalente a la rotación a
;   la izquierda de 2 posiciones del ejemplo anterior.

ORG 1000H
BIT DB 00100111b
ORG 3000H
ROTARDER_N_: MOV CH, 8  ; LA CONSTANTE DE ROTACION
	SUB CH, BH ; A 8 LE RESTO 2, QUEDA CON 6
	MOV BH, CH ; COPIO EL RESULTADO DE N BH, ME QUEDA 2
	CALL ROTAR_IZQ_N
    RET
ORG 5000H
ROTAR_IZQ_N: CMP BH, 0  ;COMPARO CONDICIÓN DE FINAL
	JZ FIN
	ADD AL, AL ; LO SUMO A SI MISMO O MULTIPLICO POR DOS
	ADC AL, 0  ; SUMO EL CARRY + CERO PARA QUE NO AFECTE AL RESULTADO  
	DEC BH
	JMP ROTAR_IZQ_N
    FIN:RET
ORG 2000H
	MOV AL, BIT
	MOV BH, 2 
	CALL ROTAR_IZQ_N
HLT
END