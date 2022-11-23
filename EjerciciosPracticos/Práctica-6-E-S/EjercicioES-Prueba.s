.data
CONTROL: .word 0x10000
DATA: .word 0x10008

.text

ld $s0, CONTROL($zero) ; $s0 = CONTROL
ld $s1, DATA($zero)    ; $s1 = DATA

daddi $t0, $zero, -85 ; cargamos en un registro temporal el dato
sd $t0, 0($s1)        ; cargamos en DATA el dato almacenado en $t0

daddi $t0, $zero, 2  ; cargamos en un temporal la instruccion para CONTROL
sd $t0, 0($s0)        ; cargamos en control la instruccion
; Ejecutarlo paso  paso porque sino la ultima instruccion boora el -85
daddi $t0, $zero, 6
sd $t0, 0($s0)
halt