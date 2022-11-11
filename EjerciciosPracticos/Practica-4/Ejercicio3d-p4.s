.data
A: .word 1 
B: .word 3
tabla: .word 0
.code
dadd r3, r0, r0
ld r2, B(r0)
ld r1, A(r0)
loop: daddi r2, r2, -1 
dsll r1, r1, 1
sd r1, tabla(r3)
daddi r3, r3, 8 ; desplazamiento para acceder al proximo dato de la trabla
bnez r2, loop ; que no sea cero
halt 