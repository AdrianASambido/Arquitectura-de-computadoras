 ORG 1000H   ; Memoria de datos
     NUM1 DW 5H
     NUM2 DW 3H  
     RES DW ?

 ORG 3000H     ; SubRutina mul
MUL: MOV DX, 0 ; REGISTRO ACUMULADOR
	 MOV BX, AX ; GUARDO LA DIRECCION DE QUE SE ENCUENTRA EN AX EN BX
	 MOV AX, [BX]  ; GUARDO LO APUNTADO POR [BX] EN AX, EL CONTENIDO DE BX LO TOMO COMO UNA DIRECCION DE MEMORIA 
	 MOV BX, CX  ; GUARDO LA DIRECCION DE QUE SE ENCUENTRA EN CX EN BX
	 MOV CX, [BX]  ; GUARDO LO APUNTADO POR BX EN CX
     CMP CL, 0 ; COMPARO PARA NO MULTIPLICAR POR 0
     JZ FIN
LAZO:ADD DX, AX; GUARDO EN DX EL VALOR
     DEC CX    ; DECREMENTO EL REGISTRO CONTADOR
     JNZ LAZO
FIN: RET

     ORG 2000H    ; Prog principal    ; CON PASAJE DE PARAMETROS POR REFERENCIA Y DEVOLVIENDO EL RESULTADO EN UN REGISTRO POR VALOR
     MOV AX, OFFSET NUM1  ;GUARDO LA DIRECCION DE NUM1 EN AX
     MOV CX, OFFSET NUM2  ;GUARDO LA DIRECCION DE NUM1 EN AC
CALL MUL        
	 MOV RES, DX
     HLT
END        