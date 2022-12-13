.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
color_pelota: .word32 0x00ff0000 ; AZUL
color_fondo: .word32 0x00ffffff  ; BLANCO

.text ; aignaciones
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)
lwu $v0, color_pelota($zero)
lwu $v1, color_fondo($zero)

daddi $s0, $zero, 23 ; coordenada x de la pelota
daddi $s1, $zero, 1  ; coordenada y de la pelota
daddi $s2, $zero, 1  ; direccion x de la pelota
daddi $s3, $zero, 1  ; direccion y de la pelota
daddi $s4, $zero, 5  ; comando para dibujar un punto 

loop: sw $v1, 0($s7) ; borra la pelota
      sb $s0, 4($s7)
      sb $s1, 5($s7)
      sd $s4, 0($s6)

      dadd $s0, $s0, $s2 ; mueve la pelota en la direccion actual
      dadd $s1, $s1, $s3

      daddi $t1, $zero, 48 ; comprueba que la pelota no este
;en la columna de mas a la derecha. si es asì cambia la direccion
      slt $t0, $t1, $s0 
      dsll $t0, $t0, 1
      dsub $s2, $s2, $t0 
      slt $t0, $t1, $s1 ; comprueva que la pelota no este en 
;la fila de mas arriba si es asì cambia de direccion en y
      dsub $s3, $s3, $t0 
      slti $t0, $s0, 1 ; comprueba que la pelota no este en la 
;columna de mas a la izquierda. si es asi cambia la direccion en x
      dsll $t0, $t0, 1 
      dadd $s2, $s2, $t0 
      slti $t0, $s1, 1 ; comprueba que la pelota no este en la 
;fila de mas abajo. si es asi camia la direccioon en Y
      dsll $t0, $t0, 1
      dadd $s3, $s3, $t0 
      sw $v0, 0($s7)
      sb $s0, 4($s7)
      sb $s1, 5($s7)
      sd $s4, 0($s6)
      daddi $t0, $zero, 500 ; hace una demora para que  el rebote 
      ;no sea tan rapido
demora: daddi $t0, $t0, -1 ; esto genera una infinidad de raw bts pero ...
        bnez $t0, demora
        j loop
        halt      