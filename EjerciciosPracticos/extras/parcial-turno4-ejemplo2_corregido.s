.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
tabla: .word 20, 1, 14, 7, 2, 58, 18, 7, 12, 11
num: .word 7    ; elemneto a buscar
long: .word 10  ; longitud
       .code
       lwu $s0, DATA($zero)     ; carga DATA en $s0 
       lwu $s1, CONTROL($zero)  ; carga control en $s1

       dadd $t2, $zero, $zero   ;inicializa $t2 en cero indice para recorrertabla
       daddi $t5, $zero, 1      ; inicilaiza $t5 en  
       ld $t1, num($zero)       ; carga el valor de num = 7 en $t1
       ld $t0, long($zero)      ; carga el valor de la longitud en $t0
       daddi $t4, $t4, 0        ; inicializa $t4 en cero
       daddi $t6, $zero, 2      ; inicializa $t6 en 2


loop:  ld $t3, tabla($t2)       ; carga en $t3 el primer valor de la tabla 
       bne $t3, $t1, sigo       ; compara sino son iguales $t3 1º incidencia de la tabla, con 7
       sd $t5, 0($s0)           ; $s0 = dirección de DATA $t5 el numero de pos en la tabla 
       sd $t6, 0($s1); $s1 = dirección de CONTROL y en $t6 el comando 2 - imprimir numero 
              
sigo:  daddi $t0, $t0, -1       ; decrementa la longitud
       daddi $t2, $t2, 8        ; incrementa para recorrer la tabla
       daddi $t5, $t5, 1        ; incrementa $t5 para mover a otro caracter
       bnez $t0, loop           ; condicionde final
halt
