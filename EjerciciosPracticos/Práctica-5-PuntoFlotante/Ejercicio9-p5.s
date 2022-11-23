;9) *Escriba la subrutina ES_VOCAL que determina si un caracter es vocal o no, 
;    ya sea mayúscula o minúscula. La rutina debe recibir el caracter y 
;    debe retornar el valor 1 si es una vocal ó 0 en caso contrario. 
.data
CONTROL: .word 0x10000
DATA: .word 0x10008
vocales: .asciiz "AEIOUaeiou"
resultado: .word 0
char: .word 0

.code
;cargamos direcciones para el ingreso de un dato
ld $s0, CONTROL($zero)
ld $s1,DATA($zero)

;leemos caracter
daddi $t0,$zero,9 ;con el valor 9 leemos caracteres
sd $t0,0($s0) ;guarda en $s0(control) la instruccion 9

;argumentos subrutina
lbu $a0,0($s1) ;copiamos el caracter de data a $a0 para enviarlo a la subrutina
sb $a0,char($zero) ;guarda el caracter leido

;guardamos caracter en registro para imprimir
daddi $s3,$zero,char ;direccion de nuestro caracter
sd $s3,0($s1) ;lo guarda en data

;mandamos a imprimir
daddi $t0,$zero,4
sd $t0,0($s0) ;lo mandamos a control 4 para que imprima

;llama a subrutina
jal esVocal
sd $v0, resultado($zero) ;GUARDA LO QUE HAY EN V0 EN RESULTADO
;guardamos caracter en registro para imprimir
daddi $t0, $zero, resultado
sd $t0, 0($s1)
;mandamos a imprimir
daddi $t0, $zero, 4
sd $t0, 0($s0)

halt
;subrutina
esVocal: dadd $v0,$zero,$zero ;inicializa si no es vocal
    dadd $t0,$zero,$zero ;inicializo inidice de cadena

    loop: lbu $t1,vocales($t0) ;carga la nueva vocal
    beqz $t1, fin ;si nuestro caracter es 0, fin de cadena
    beq $a0,$t1,es ;compara si es vocal, salta y retorna 1
    daddi $t0,$t0,1 ;siguiente elemento
    j loop ;vuelve al loop

    es: daddi $v0,$zero,1 ;es vocal
    fin: jr $ra ;termina
