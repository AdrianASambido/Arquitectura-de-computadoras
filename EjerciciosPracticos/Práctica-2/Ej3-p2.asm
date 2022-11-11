; 3) * Escribir un programa que muestre en pantalla las letras del abecedario, sin espacios, intercalando mayúsculas y
;   minúsculas (AaBb…), sin incluir texto en la memoria de datos del programa. Tener en cuenta que el código de “A” es 41H,
;   el de “a” es 61H y que el resto de los códigos son correlativos según el abecedario.


ORG 1000H
	MAY DB 41H ; A MAYUSCULA
	MIN DB 61H ; a MINUSCULA
	
ORG 2000H
	MOV AL, 2  ; SE IMPRIME EN PANTALLA DE A 2 CARACTERES
	MOV BX, OFFSET MAY ; DIRECCION DE COMIENZO
	PROX: INT 7
	INC MIN  ; INCREMENTO LA DIR DE MEMORI
	INC MAY  ; INCREMENTO LA DIR DE MEMORI
	CMP MAY, 5BH ; CONDICIÒN DE FINAL
	JNZ PROX
	INT 0	
END