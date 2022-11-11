.data
A: .word 1 
B: .word 3
.code
ld r2, B(r0)
ld r1, A(r0)            ; copia en r1 un doble word de 64 bit desde la direccion (A + el valor) A+0
loop: daddi r2, r2, -1  ; Le suma el valor inmediato -1 al registro r2 y lo almacena en el 1° r2 
dsll r1, r1, 1          ;Desplaza a izquierda n veces los bits del 2° refistro r1 dejando el resultado en r1 reg 
bnez r2, loop           ; si r2 no es igual a cero, salta a la direccion rotulada en "loop"
halt 