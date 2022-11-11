;Imprimir por estado

pa equ 30h ;llaves ; estado impresora para hacer el poll
pb equ 31h ;luces ;  datos "pantalla"
ca equ 32h
cb equ 33h

org 1000h
 hola db "hola"
 fin db ?

;configuracion del pio
org 2000h
 mov al, 0
 out cb, al ; se confiura pb de salida
 
 mov al, 11111101b ; strobe desabilitado
 out ca, al
 ; ya esta configurado el pio
 
 ;configurar estado
 in al, pa
 and al, 11111101b
 out pa, al 
 
 ;consulta de estado
 poll: in al, pa
  and al, 1
  jnz poll
  
 ; si salio es porque la impresora esta libre
 
 mov bx, offset hola
 
 ; configuracion enviamos el dato a imprimir
 mov al, [bx]
 out pb, al
 
 ; forzar el strobe a 1
 
  in al, pa
  or al, 00000010b
  out pa, al
   
   in al, pa
 and al, 11111101b
 out pa, al 
   
  int 0
  end
  
 

