DATOS	EQU 40H
ESTADO EQU 41H

ORG 4000H
	POLL: IN AL, ESTADO
		AND AL, 00000001B
		JNZ POLL
	RET

ORG 3000H
	SELECCIONADO: CMP DL, CERO
		JS NO_ES
		CMP DL, DIEZ
		JNS NO_ES
		ES: MOV BOOLEAN, 1
		NO_ES: RET

ORG 1000H
	BOOLEAN DB 0
	CERO DB 30H
	DIEZ DB 3AH
	STRING DB "B0221A"
	FIN DB ?
	
ORG 2000H
	;CONFIGURAMOS HANDSHAKE POR CONSULTA DE ESTADO
	IN AL, ESTADO
	OR AL, 10000000B
	OUT ESTADO, AL
	
	MOV BX, OFFSET STRING
	MOV DL, [BX]
	
	;DESCARTAMOS LETRAS
	
	IMPRIMIR: CMP BX, OFFSET FIN
	JZ TERMINA
	CALL SELECCIONADO
	CMP BOOLEAN, 1
	JZ NUMERO
	INC BX
	MOV DL, [BX]
	JMP IMPRIMIR
	
	NUMERO: MOV BOOLEAN, 0
	CALL POLL
	MOV AL, DL
	OUT DATOS, AL
	INC BX
	MOV DL, [BX]
	JMP IMPRIMIR
	
	;DESHABILITAMOS HANDSHAKE
	TERMINA: IN AL, ESTADO
	AND AL, 01111111B
	OUT ESTADO, AL

INT 0
END