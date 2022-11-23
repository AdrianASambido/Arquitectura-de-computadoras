.data
tabla: .word 20, 1, 14, 7, 2, 58, 18, 7, 12, 11  ; Declara una tabla dee integer
num: .word 7       ; numero a buscar?
long: .word 10   ; longitud de tabla
       .code
       dadd $t2, $zero, $zero   ; inicializa $t2 0 para recorrer la tabla
       ld $t1, num($zero)       ; $t1 = 7 
       ld $t0, long($zero)      ; $t0 = 10
       daddi $t4, $t4, 0        ; inicializa $t4 en cero, como contador 

loop:  ld $t3, tabla($t2)       ; carga en $t3 la direccion de la tabla 
       bne $t3, $t1, sigo       ; compara si los registros no son iguales, si son iguales sigue
       daddi $t4, $t4, 1        ; incrementa $t4 
sigo:  daddi $t0, $t0, -1       ; decrementa $t0
       daddi $t2, $t2, 8        ; avanza en la posicion de la tabla
       bnez $t0, loop           ; compar con 0 para salir del loop
       halt