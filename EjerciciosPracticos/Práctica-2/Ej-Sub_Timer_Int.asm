; Escriba un programa que imprima en pantalla un mensaje cada 5 segundos 
;y que se detenga cuando se preciona la tecla F 10.

CONT    EQU 10H ; TIMER COTADOR ...RESETEARLO
COMP    EQU 11H ; TIMER COMPARADOR
EOI     EQU 20H ; EOI PARA AVISART QUE LA SUBRUTINA YA SE ATENDIÓ
IMR     EQU 21H ; 
INT0    EQU 24H ; F10	
INT1    EQU 25H ; TIMER
IDF10   EQU 13  ; ESTE VA EN DECIMAL, IDENTIFICADOR DE LA ID DE LA TECLA F10
IDTIMER EQU 19  ; ESTE VA EN DECIMAL, IDENTIFICADOR DE LA ID DEL TIMER 
	
	ORG 1000h
CARTEL   DB "SOY UN CAPO"
FIN      DB ?
TOCO_F10 DB 0	

ORG 3000H
IMPRIMIR:MOV BX, OFFSET CARTEL; 
		MOV AL, OFFSET FIN - OFFSET CARTEL
		INT 7
		; RESETEO EL CNTADOR
		MOV AL, 0
		OUT CONT, AL
		; AVISO AL PIO QUE SE ATENDIO LA SUBRUTINA
		MOV AL, 20H
		OUT EOI, AL
		IRET
;-----------------------------------------------------
ORG 4000H
DETENER:MOV TOCO_F10, 1
		MOV AL, 20 
		OUT EOI, AL ; EOI = 20 
		IRET
ORG 2000H
  ; PONER EN EL VECTOR DE INTERRUPCIONES LA DIRECCIÓN DE LA SUBRUTINA F10
	 MOV BX, 52 ; 
		MOV AX, DETENER ;
		MOV [BX], AL ;
		
		; PONER EN EL VECTOR DE INTERRUPCIONES LA DIRECCIÓN DE LA SUBRUTINA DEL TIMER
		MOV BX, 76 ; 19 * 4
		MOV AX, IMPRIMIR
		MOV [BX], AX
		 
	CLI
	 ; EN EL IMR PONEMOS UN CERO PARA LOS DISPOSITIVOS QUE QUEREMOS HABILIAR Y SINO UN 1
		MOV AL, 11111100B ; 
		OUT IMR,  AL ;  HABILITAMOS DISPOSITIVOS
		
		; MANDO LOS ID QUE CORRESPONDE A LA INTERRUPCIÓN DEL F10
		MOV AL, IDF10   
		OUT INT0, AL
		
		; MANDO LOS ID QUE CORRESPONDE A LA INTERRUPCIÓN DE TIMER
		MOV AL, IDTIMER ;
		OUT INT1, AL
		
		; CONFIGURAMOS EL TIMER EN 5 SEGUNDOS
		MOV AL, 5
		OUT COMP, AL
		; RESETAMOS EL TIMER A CERO
		MOV AL, 0
		OUT CONT, AL
	STI	
		
	  LOOP: CMP TOCO_F10, 1
	   JNZ LOOP
  INT 0
END