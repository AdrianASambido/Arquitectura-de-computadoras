HAND_DATO EQU 40H
HAND_ESTADO EQU 41H

ORG 1000H
MENSAJE DB "SOMOS CAPOS"
FIN     DB ?

ORG 2000H
 ; COFIGURAMOS HAND SHAKE POR CONSULTA DE ESTADO (0 EN BIT 7)
 ; ---------------------------------------------------------
	IN AL, HAND_ESTADO ; ESCRIBE EN AL EL ESTADO
	AND AL, 01111111B   ; PONEMOS EL BIT 7 Y EL RESTO LO MANTENEMOS
	OUT HAND_ESTADO, AL
; ----------------------------------------------------------	
; MANDAMOS EL MENSAJE A BX
	MOV BX, OFFSET MENSAJE
	POLL: IN AL, HAND_ESTADO ; PARA SABER SI LA IMPRESORA ESTA LIBRE
	AND AL, 00000001B ; ESTO ES PARA SABER SI EL BIT BUSY ESTA LIBRE PARA IMPRIMIR 1 AND 1 = 1
	JNZ POLL   ; SINO VUELVE AL POLL	
	
;	SI LA IMPRESORA ESTA LIRE IMPRIMIMOS
; ----------------------------------------------------------
	MOV AL, [BX]      ; COLOCAMOS EN AL EL DATO A IMPRIMIR
	OUT HAND_DATO, AL ; MADAMOS A IMPRIMIR
	INC BX 
	CMP BX, OFFSET FIN;COMPARAMOS CNDICION DE FINAL
	JNZ POLL
	INT 0
END