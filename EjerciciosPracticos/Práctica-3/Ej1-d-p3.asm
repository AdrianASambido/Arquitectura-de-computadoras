;d) * Escribir un programa que implemente un encendido y apagado sincronizado de las luces. Un contador,
; que inicializa en cero, se incrementa en uno una vez por segundo. Por cada incremento, se muestra a
; través de las luces, prendiendo solo aquellas luces donde el valor de las llaves es 1. Entonces, primero
; se enciende solo la luz de más a la derecha, correspondiente al patrón 00000001. Luego se continúa con
; los patrones 00000010, 00000011, y así sucesivamente. El programa termina al llegar al patrón 11111111.
CONT EQU 10H
COMP EQU 11H
EOI  EQU 20H
IMR  EQU 21H
INT1 EQU 25H
PB   EQU 31H
CB   EQU 33H
IDINT1   EQU 10

ORG 3000H
SUB_RUTINA:MOV AL, DL
   OUT PB, AL
   INC DL
   MOV AL, 0
   OUT CONT, AL  
   MOV AL, EOI
   OUT EOI, AL
 IRET
 
ORG 2000H
   MOV AX, SUB_RUTINA ; GUARDAMOS LA DIR DE LA SUB RUTINA
   MOV BX, 40  
   MOV [BX], AX ; A LO QUE APUNTA BX "DIR 40" 
 ; CARGAMOS EN EL VECTOR DE INTERRUPCIONES
 CLI
   MOV AL, 11111101B ; INTERRUPCION DEL TIMER
   OUT IMR, AL
   
   MOV AL, IDINT1
   OUT INT1, AL
   
   MOV AL, 00000000B
   OUT CB, AL
   
   MOV AL, 0
   OUT CONT, AL
   
   MOV AL, 1
   OUT COMP, AL
   
 STI
   MOV DL, 0
   
   SALTO:CMP DL, 11111111B
     JNZ SALTO
    
INT 0
END