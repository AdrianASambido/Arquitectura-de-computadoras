;a) * Escribir un programa que encienda las luces con el patrón 11000011, o sea, solo 
;  las primeras y las últimas dos luces deben prenderse, y el resto deben apagarse.
PB EQU 31H ;puerto de luces
CB EQU 33H

ORG 1000H
PATRON DB 0C3H ; 11000011B  

ORG 2000H
 ; CONFIGURAMOS LOS PUERTO 
  MOV AL, 00000000B ;CB TODO COMO SALIDA
  OUT CB, AL

  MOV AL, PATRON
  OUT PB, AL
  INT 0
END