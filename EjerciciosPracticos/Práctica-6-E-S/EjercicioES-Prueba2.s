.data
coorX: .byte 44 ; coordenada X
coorY: .byte 44 ; coordenada Y
color: .byte 255, 0, 255, 0
CONTROL: .word 0x10000
DATA: .word 0x10008

.code
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

lwu $t2, color($zero)
sw $t2, 0($s1); pongo el color en data 

lbu $t1, coorY($zero); $t1 = valor de la coordenada Y y lo guarda en el desplazamineto 4+
sb $t1, 4($s1); DATA + 4 recibe el valor de la coordenada Y 

lbu $t0, coorX($zero); $t0 = valor de la coordenada X
sb $t0, 5($s1); DATA = 5 recibe el valor de la coordenada X 


daddi $t0, $zero, 5 ; indica que tiene que imprimir un pixel
sd $t0, 0($s0);CONTROL = 5
halt