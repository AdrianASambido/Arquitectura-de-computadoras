;2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera,
;   denominada ingreso, debe solicitar el ingreso por teclado de un número entero
;   (de un dígito), verificando que el valor ingresado realmente sea un dígito. 
;   La segunda, denominada muestra, deberá mostrar en la salida estándar del 
;   simulador (ventana Terminal) el valor del número ingresado expresado en 
;   letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’).
;   Establezca el pasaje de parámetros entre subrutinas respetando las 
;   convenciones para el uso de los registros y minimice las detenciones del
;   cauce (ejercicio similar al ejercicio 6 de Práctica 2). 

.data
vector: .word "cero","uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve"
control: .word32 0x10000
data: .word32 0x10008

.code
;declaramos los registros
lwu $s0,control($zero)
lwu $s1,data($zero)

;declaramos la pila (para guardar valores de subrutina)
daddi $sp,$zero,0x400

loop: jal sub_ingreso
    ;le mandamos el caracter a nuestra otra subrutina
    dadd $a0,$zero,$v0 ;ahora nuestro argumento para la subrutina
     ;de la anterior muestro, vale lo que tenía el retorno
                        
    jal muestra
    j loop
halt

;subrutina ingreso
;-------------------------------------------------------------------
        ;INGRESAMOS NUMERO
sub_ingreso: daddi $t0,$zero,1 ;para el ingreso de numeros sin signo
    sd $t0,0($s0) ;le decimos a control que ingrese el numero

    ;NOS GUARDAMOS NUMERO
    lb $s2,0($s1) ;s2 = nuestro numero leido esta en Data

    ;CORROBORAMOS SI ES UN NUMERO
    es_num: slti $t0,$s2,30h ;compara si es menor a 0
        bnez $t0, no_es
        slti $t0,$s2,3ah ;compara si es menor al siguiente de 9
        beqz $t0, no_es

        ;si es un numero, lo retorna
        dadd $v0,$zero,$s2
        j fin
        no_es: daddi $v0 $zero, 0
    fin: jr $ra

;subrutina muestro
;------------------------------------------------------------------
sub_muestra: daddi $t0,$zero,8 ;indicamos a control que se imprime un número
    
    daddi $t1,$zero,9 ;inicializamos registro auxiliar en 9 para decrementar posiciones
    daddi $t2,$zero,0x30 ;inicializamos en 0 - 30h para comparar
    daddi $t3,$zero,1 ;indice para la el vector
    daddi $t4,$zero,vector ;cargamos la direccion de nuestro vector

    comparo: beqz $t1,fin ;si recorrimos todo el vector, salimos
        beq $a0,$t1 imprimo
        daddi $t1,$t1,-1 ;decrementamos comparaciones
        daddi $t2,$t2,1 ;incrementamos posiciones
        daddi $t3,$t3,8 ;avanzamos indice
        j comparo

    imprimo: dadd $t3,$t3,$t4 ;le sumo el indice a nuestra direccion
        sd $t3,0($s1) ;le mandamos la direccion a data
        sd $t1, 0($s0) ;le mandamos a control para que imprima
    fin: jr $ra