COMP EQU 11H
EOI  EQU 20H
IMR  EQU 21H 
INT1 EQU 25H ; TIMER
ID   EQU 10

   ORG 1000h
MINUTO_D  DB 30H
MINUTO_U  DB 30H 
SEGUNDO_D DB 30H
SEGUNDO_U DB 30H
FINAL     DB ?

    ORG 3000H
SUB_RUTINA: CMP DL, 03AH ; compara dl ue no se haya pasado de 9
            JZ REINICIO
			         MOV [BX], DL ; para luego improimirlo
			         INC DL
			         JMP CHAU
REINICIO:MOV DL, 30H
			         INC SEGUNDO_D
			         CMP SEGUNDO_D, 36H
			         JZ REINICIO2
			         JMP SUB_RUTINA
REINICIO2:MOV SEGUNDO_D, 30H

					     MOV AL, 0   ; REINICIAMOS PARA QUE NO PARE
                         OUT CONT, AL

	 				    MOV AL, EOI
	 				    OUT EOI, AL			  ; AVISAMOS QUE LASUBRUTNA YA FUE ATENDIDA
CHAU:IRET
            
    ORG 2000H
 ; CARGAMOS LA SUBRUTINA DE INTERRUPCION 
 ; EN EL VECTOR DE INTERRUPCIONES
   MOV AX, SUB_RUTINA ; GUARDAMOS LA DIR DE LA SUB RUTINA
   MOV BX, 40  
   MOV [BX], AX ; A LO QUE APUNTA BX "DIR 40" 
   ; GUARDAMOS EL COMIENZO DE LA SUB RUTINA
 CLI
 ;--------------------------------------------------
 ; CONFIGURAMOS LA INTERRUPCION DE LA PIO 
    MOV AL, 11111101B ;LE DECIMOS AL PIO QUE 
    OUT IMR, AL                   ;INTERRUPCIO HABILITAR  
 ; CONFIGURAMOS LA INTERRUPCION PARA QUE SEPA DONDE BUSCARLA
    MOV AL, ID ; ID = 10, Y 10 * 4 = 40
    OUT INT1, AL
 ;--------------------------------------------------

 ;-------------------------------------------------- 
 ; CONFIGURAMOS EL TIMER CADA 5 SEGUNDOS
    MOV AL, 0
    OUT CONT, AL
    
    MOV AL, 5
    OUT COMP, AL 
 ;--------------------------------------------------	
  STI    
	MOV DL, 30H
	CALL SUB_RUTINA
	MOV AL, OFFSET FINAL - OFFSET MINUTO_D 
	MOV BX, OFFSET MINUTO_D
	INT 7
    LOOP: JMP LOOP
INT 0
HLT
END
