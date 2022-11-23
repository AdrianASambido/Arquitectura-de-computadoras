.data
coorX: .byte 24 ; coordenada X
coorY: .byte 24 ; coordenada Y
color: .byte 255, 0, 255, 0
CONTROL: .word 0x10000
DATA: .word 0x10008
.text
ld $s0 CONTROL($zero)
ld $s1 DATA($zero)

daddi $t0, $zero, 7 ; indica que tiene que imprimir un pixel
sd $t0, 0($s0);CONTROL = 7 limpia la pantalla grafica
ibu $t0, coorX($zero); $t0 = valor de la coordenada X

sb $t0, 5($s1); DATA = 5 recibe el valor de la coordenada X y lo guarda en el desplazamineto 5
ibu $t1, coorY($zero); $t1 = valor de la coordenada Y y lo guarda en el desplazamineto 4+
sb $t0, 4($s1); DATA + 4 recibe el valor de la coordenada Y 

iwu $t2, color($zero)
sw $t2, 0($s1); pongo el color en data
daddi $t0, $zero, 5
sd $s0, 0($s0)
halt

