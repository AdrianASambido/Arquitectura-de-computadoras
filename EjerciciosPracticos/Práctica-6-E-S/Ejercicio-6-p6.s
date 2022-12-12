; 6) El siguiente programa produce una salida estableciendo el
; color de un punto de la pantalla gráfica (en la ventana
; Terminal del simulador WinMIPS64). Modifique el programa de 
; modo que las coordenadas y color del punto sean ingresados
; por teclado.

.data
coorX: .byte 24
coorY: .byte 24
color: .byte  160,0,145,0
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .ascii "Ingrese datos"

.text
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
 
lwu $t2, color($zero)
sw $t2, 0($s1)

lbu $t1, coorY($zero); pongo coordY en $s11
sd $t1, 4($s1)        ; lo cargo en data

lbu $t0, coorX($zero); pongo coordX en $s0
sd $t0, 5($s1)        ; lo cargo en data

daddi $t0, $zero, 5
sd $t0, 0($s0)
halt
;imprimo: daddi $t0, $zero, texto
 ;       sd $t0, 0($s1) ; cargo en data el String

  ;      daddi $t0, $zero, 4 ; le digo a control que imprima un String 
   ;     sd $t0, 0($s6)

    ;    daddi $t0, $zero, 8;le digo a control que imprima un entero 
    ;    sd $t0, 0($s6)
        
     ;   jr $ra
;........................................................