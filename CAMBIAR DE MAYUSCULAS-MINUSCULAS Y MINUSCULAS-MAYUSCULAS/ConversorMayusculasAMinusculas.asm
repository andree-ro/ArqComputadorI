;Convertir a mayusculas el texto
 	%include	'stdio32mdc.asm'
 SECTION .data
  msg db 'Bienvenido a Mayuscula  a Mnuscula ',0h 
  msg2 db 'ingrese Letras para converir',0h
  msg3 db 'El resultado es: ',0h
  SECTION .bss
  cadena: resb 45 
  SECTION .text
	global _start
	_start:
	mov			 eax, msg         ;Mueve el mensaje de msj1 a eax
	call		 printStrln
	mov			 eax, msg2 
	call		 printStrln
	mov			 eax,45
	mov          ebx,cadena
	call		inputStr  
	mov         eax, msg3
	call 		printStrln
	mov         eax, cadena  
   call 		strlowcase
   call exit
