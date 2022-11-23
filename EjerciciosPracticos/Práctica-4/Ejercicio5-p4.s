; 5) El siguiente programa multiplica por 2 los elementos de un arreglo 
; llamado datos y genera un nuevo arreglo llamado res. Ejecutar el programa
;  en el simulador winmips64 con la opción Delay Slot habilitada.

; a) ¿Qué efecto tiene habilitar la opción Delay Slot (salto retardado)?.
; b) ¿Con qué fin se incluye la instrucción NOP? ¿Qué sucedería si no estuviera?.
; c) Tomar nota de la cantidad de ciclos, la cantidad de instrucciones y 
;    los CPI luego de ejecutar el programa.
; d) Modificar el programa para aprovechar el ‘Delay Slot’ ejecutando una
;    instrucción útil. Simular y comparar número de ciclos, instrucciones
;    y CPI obtenidos con los de la versión anterior.


;original
;---------------------------------------------------------------
;.data
;cant: .word 8
;datos: .word 1, 2, 3, 4, 5, 6, 7, 8 ; declaracion de la tabla
;res: .word 0
;.code
;dadd r1, r0, r0   ; inicializa r1 = 0 (posocion de la tabla)
;ld r2, cant(r0)   ; r2 (pos 0) = 8
;loop: ld r3, datos(r1) ;carga en r3 , la tabla de datos en pos r1
;daddi r2, r2, -1  ; Decrementa contadpr
;dsll r3, r3, 1    ; realiza la multiplicacion y loguarda en r3
;sd r3, res(r1)    ; guarda en la nueva tabla en resulatdo
;daddi r1, r1, 8   ; incrementa posicion de la tabla
;bnez r2, loop     ; copara con cero
;nop
;halt
;--------------------------------------------------------------
.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8 ; declaracion de la tabla
res: .word 0
.code
dadd r1, r0, r0   ; inicializa r1 = 0 (posocion de la tabla)
ld r2, cant(r0)   ; r2 (pos 0) = 8
loop: ld r3, datos(r1) ;carga en r3 , la tabla de datos en pos r1
daddi r2, r2, -1  ; Decrementa contador
dsll r3, r3, 1    ; realiza la multiplicacion y lo guarda en r3
sd r3, res(r1)    ; guarda en la nueva tabla en resulatdo
bnez r2, loop     ; copara con cero
daddi r1, r1, 8   ; incrementa posicion de la tabla
halt