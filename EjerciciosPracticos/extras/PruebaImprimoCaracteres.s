.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
CARACTER: .byte 0

.code
; asignamos control, y data
lwu $s0, CONTROL($zero) ;CONTROL = $s0
lwu $s1, DATA($zero)    ;DATA    = $s1 

daddi $s4, $zero, 13 ; $s4 = al ascii del enter
; para utilizarlo como condicion de corte
; cargamos control
loop: daddi $t1, $zero, 9 ;para que lea un caracter     
    sd $t1, 0($s0)    ;en control = 9
    lbu $t1, 0($s1)    ; tomo caracter en $t1 de data
    ;Comparo el ASSCII del enter
    beq $t1, $s4, fin ; si son iguales salta a fin
;"Preciono una tecla" la cpu guarda el caracter en data
    sb $t1, CARACTER($zero)  ;guardo lo de variable $t1 en CARACTER

    daddi $s3, $zero, CARACTER ;Copio la direccion de 
    ;CARACTER EN $s3
    sd $s3, 0($s1); Mando la direccion de CARACTER a data
    ;Imprime caracter
    daddi $t1, $zero, 4 ;para que lea un String
    sd $t1, 0($s0)      ;en control = 4
    j loop
fin: halt