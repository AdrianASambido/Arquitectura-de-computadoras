;Escribir un programa que recorra una tabla de 5 nùmeros cargados
;en memoria y pinte la palntalla gràfica en base a la misma.
;Se debe pintar de color azul las primeras  5 filas 
;(las situadas en la parte superior) de la pantalla gràfica
;para cada fila se pintan de izquierda a derecha las primeras
;N-1 columnas, donde N-1 es el nùmero inesimo contenido en 
;la tabla y el resto se debe dejar si pintar.si la tabla 
;contiene los valores 3,6,2,5,1 se deben pintar los primeros 3
;pixeles de la fila 49, los primeros 6 de la fila 48, etc.
;suponer que el valormaximmo cargado en la tabla no supera 49
.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
TABLA: .word 3,6,2,5,1
COLOR: .byte 0,0,255,0 ; AZUL

.text
lwu $s0, CONTROL($zero) 
lwu $s1, DATA($zero)

lwu $s3, COLOR($zero)
sw $s3, 0($s1)       ;cargo el color en DATA 

daddi $t3, $zero, 49 ;numero de fila para Y
sb $t3, 4($s1)       ;cargo el valor de Y 

daddi $s2, $zero, TABLA
daddi $t1, $zero, 5        ; contador para tabla
daddi $t4, $zero, 5        ; para control que imprima pixel

loop:   lbu $t2, 0($s2)    ; saco la primera ocurrenia de la table
        daddi $t1, $t1, -1 ; decremento la dimencion de la tabla
        daddi $s2, $s2, 8  ; incremento la tabla
        daddi $t5, $zero, 1

impr:   sb $t5, 5($s1)     ; cargo x en la DATA
        daddi $t2, $t2, -1 ; decremento el valor sacado de tabla
        daddi $t5, $t5, 1  ; incremento x  
        sw $t4, 0($s0); instrucion 5 para control

        bnez $t2, impr 

        daddi $t3, $t3, -1 ; decremento Y
        sb $t3, 4($s1)       ;cargo el valor de Y 

        bnez $t1, loop
halt