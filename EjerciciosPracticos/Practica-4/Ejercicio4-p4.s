; a) Ejecutar en simulador con Forwarding habilitado. ¿Qué tarea realiza? 
; ¿Cuál es el resultado y dónde queda indicado?
; b) Re-Ejecutar el programa con la opción Configure/Enable Branch Target 
; Buffer habilitada. Explicar la ventaja de usar este
; método y cómo trabaja.
; c) Confeccionar una tabla que compare número de ciclos, CPI, RAWs y 
; Branch Taken Stalls para los dos casos anteriores
; Dado el siguiente programa:
.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10
.code
ld r1, long(r0)        ; Guarda en r1 = 10 contador
ld r2, num(r0)         ;r2 = 7  numero buscado
dadd r3, r0, r0        ;inicializan en 0
dadd r10, r0, r0       ;inicializan en 0 (lo usa como flag) 
loop: ld r4, tabla(r3) ; guarda en r4 el valor de la tabla con desplazamiento r3, 20 (14H) 
beq r4, r2, listo      ;compra r4 = valor de la tabla es igual a r2 = 7
daddi r1, r1, -1       ;decrementa contador
daddi r3, r3, 8        ; incrementa la siguiente posicion de la tabla 
bnez r1, loop 
j fin
listo: daddi r10, r0, 1
fin: halt 