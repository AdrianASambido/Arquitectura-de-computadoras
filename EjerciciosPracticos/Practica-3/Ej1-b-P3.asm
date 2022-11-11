; b) * Escribir un programa que verifique si la llave de más a la izquierda está prendida. Si es así, mostrar en
; pantalla el mensaje “Llave prendida”, y de lo contrario mostrar “Llave apagada”. Solo importa el valor
; de la llave de más a la izquierda (bit más significativo). Recordar que las llaves se manejan con lasteclas 0-7.
PA EQU 30H
CA EQU 32H

ORG 1000H
MSJ  DB "LLAVE PRENDIDA"
FIN  DB ?
MSJ2 DB "LLAVE APAGADA"
FIN2 DB ?

ORG 2000H
  MOV AL, 00000000B ;LLAVES DE SALIDA
  OUT CA, AL
  
  MOV AL, 10000000b ; SOLO ESTA ENCENDIDA LA DEL BIT 7
  OUT PA, AL
  
  IN AL, PA
  AND AL, 10000000B
  CMP AL, 10000000B
  JZ PRENDIDA
  MOV BX, OFFSET MSJ2
  MOV AL, OFFSET FIN2 - OFFSET MSJ2
  INT 7
  JMP CHAU
  PRENDIDA:MOV BX, OFFSET MSJ
  MOV AL, OFFSET FIN - OFFSET MSJ
  INT 7
  CHAU: INT 0
END