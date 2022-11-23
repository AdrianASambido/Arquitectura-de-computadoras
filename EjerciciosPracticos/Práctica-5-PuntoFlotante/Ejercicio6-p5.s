;6) Como ya se observó anteriormente, muchas instrucciones que normalmente
;   forman parte del repertorio de un procesador con arquitectura CISC 
;   no existen en el MIPS64. En particular, el soporte para la invocación
;   a subrutinas es mucho más simple que el provisto en la arquitectura 
;   x86 (pero no por ello menos potente). El siguiente programa
;   muestra un ejemplo de invocación a una subrutina.
; a)¿que hace el programa?, ¿como esta estructurado el codigo del mismo?
;   1)Calcula la potencia de un numero. desde una subrutina. 
;   2) el código se repate en la asignacion de valores y la invocacion 
;      a una subrutina 
; b)¿cuantós atascos por dependencia de datos se generan?, obserbar en cada 
;    paso cual es el dato en conflicto y las instruccions involucradas
;   1) se generan 6. 
; 2)Jal llama a la sub rutina, y jr salta a la direccion contenida en ra
; 3) Se almacena el retorno de la subrutina, los registros $a0 y $a1
; Para pasarles los argumentos a la subrutina. y el $v0 se utiliza para
; retornar valores de la subrutina
; d) Deberianos guardarnos el registro $ra para que no lo pise
;    el llamado anidado 
.data
valor1: .word 16
valor2: .word 4
result: .word 0
.text
ld $a0, valor1($zero); carga 16 en $a0 y  pasa los ARGUMENTOS PARA LA SUBRUTINA
ld $a1, valor2($zero); catga 4 en $a1

jal a_la_potencia ;llama a a la subrutina

sd $v0, result($zero) ;
halt

a_la_potencia: daddi $v0, $zero, 1 ;inicializa $v0 en 1 
lazo: slt $t1, $a1, $zero    ; compara $a1 con 1 si es menor lo guarda en $t1
bnez $t1, terminar ; si es menor termina 
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra