.data
a: .word 3
b: .word 5
c: .word 0
.code
ld r1, a(r0); 1
ld r2, b(r0); 1

dadd r3, r3, r0 ;1
lazo: daddi r1, r1, -1 ; 3
      bnez r1, lazo    ; 3
      dadd r3, r3,r2   ; 3
    sd r3, c(r0)       ; 1
halt                   ; 1  = 14


