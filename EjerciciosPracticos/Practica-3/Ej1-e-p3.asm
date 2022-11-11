PB EQU 31H
CB EQU 33H

org 1000h
; variables 


org 2000h
  MOV AL, 00000000B
  OUT CB, AL
  
  MOV AL,  00000001B
  
  LOOP:CMP AL, 0
       JZ CAMBIO
       OUT PB, AL
       ADD AL, AL
       JMP LOOP
       CAMBIO: MOV AL, 01000000B
       CMP AL, 0
       JZ LOOP
       OUT PB, AL
       
       MOV DL, 7
       IZQ: CMP DL, 0
            JZ INVERSO
            ADD AL, AL
            DEC DL
            JMP IZQ
       INVERSO: OUT PB, AL
             MOV DL, 7
             JMP IZQ
hlt
end
