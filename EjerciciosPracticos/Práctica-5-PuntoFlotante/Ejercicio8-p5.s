;8) *Escriba una subrutina que reciba como parámetros las direcciones del
;    comienzo de dos cadenas terminadas en cero    y retorne la posición en la 
;    que las dos cadenas difieren. En caso de que las dos cadenas sean 
;    idénticas, debe retornar -1.
.data
cadena1: .word 1,2,3,5,6,7,8,9,0
cadena2: .word 1,2,3,4,5,6,8,9,0
posicion: word 0
.text
; Declaramos las variables
ld $a0, cadena1   ; dirección de inicio de cadena 1
ld $a1, cadena2   ; dirección de inicio de cadena 2
jal compara ; llama a la subrutina

compara: daddi $t0, $zero, $zero ; indice para recorrer las cadenas


loop: bnez  


j loop
jr $ra

halt