.data
num1: .word 3
num2: .word 16
.text
ld $t0, num1($zero)
ld $t1, num2($zero)

loop: daddi $t0, $t0, -1
      bnez $t0, loop
      dsll $t1, $t1, 1
halt