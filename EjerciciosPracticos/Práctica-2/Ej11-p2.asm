;11) Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en
;un registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H ; ID = 10 (10*4 = 40) <-- DIRECCIÓN DEL VECTOR DE INTERRUPCIIONES

ORG 1000H
CARACTER DB 41H

ORG 4000H ; RECORRE EL ABCDARIO
 RECORRER: CMP DL, 5BH
	JZ REINICIO
	INC DL
	JMP RECORRER
	REINICIO: MOV DL,41H
	JMP RECORRER
	RET

ORG 3000H
;1) SUBRUTINA QUE ATIENDE LA INTERRUPCIONES
	F10: MOV [BX], DL
	MOV AL, 1 ;REINICIO CANT CARRACTER
	INT 7
	;  AVISA AL PIC QUE YA ATENDIO LA SUBRUTINA
	MOV AL, 20H
	OUT EOI, AL
	IRET
	
ORG 2000H
;2)CONFIGURAMOS EL VECTOR DE INTERRUPCIONES
	MOV AX, F10
	MOV BX, 40
	MOV [BX], AX	
;3)CONFIGURAMOS EL PIC
  CLI
	MOV AL, 11111110B
	OUT IMR, AL
	
	MOV AL, 10
	OUT INT0, AL
  STI
	MOV BX, OFFSET CARACTER
	MOV DX, 41H
	MOV AL,1
 CALL RECORRER
  
  INT 0
  END