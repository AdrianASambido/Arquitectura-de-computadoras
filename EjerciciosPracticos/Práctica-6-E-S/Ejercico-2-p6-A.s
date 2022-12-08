.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
vector: .word "cero","uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"
;---------------------------------------------------------
.text

lwu $s0,CONTROL($zero)
lwu $s1, DATA($zero)

daddi $t1, $zero,10
daddi $a1, $zero, vector

jal ingreso 
;...........................................

;.......sub_ingreso..........
ingreso: beqz $a2, fin      ; si es = 0 termina
        
        daddi $t1,  $zero, 0
        daddi $a2, $a2, -1 ; decrementamos contador de insidencias
        daddi $t0, $zero, 1 ; le decimos a control que se va a ingresar un numero     
        lbu $v0, 0($s1); ponemos el valor de data en $v0

        slt $t1, $v0, 0x30 ; si es menor que cero
        bnez $t1, ingreso

        slt $t1, $v0, 0x3a ; si es menorque nueve
        beqz $t1, ingreso

        jal muestra
fin: jr $ra

;...........sub_nuestra.............
muetra: daddi $sp, $sp, 8 
        ld $sp, $sp($ra); guardo la direccion de retorno

        ld $v1, $a1($v0);saco de vector el String correspondiente
        daddi $t4, $t4, 4
        sd $t4, 0($s0); mandamos el comando a control
        sd $v1, 0($s1); mandamos a data

        ld $ra, 0($so)
        daddi $sp, $sp, -8
        jr $ra 