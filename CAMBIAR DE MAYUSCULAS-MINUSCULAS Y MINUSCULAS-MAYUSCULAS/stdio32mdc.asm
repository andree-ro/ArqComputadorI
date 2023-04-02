; Libreria para manejar una cadena
	%include	'stdio32.asm'

strupcase:
		
		push	ebx 
		push	eax 
		mov 	ebx, eax
	
ComparadorMinus:
		cmp byte[ebx],0
		jz finComparadorMinus
		cmp byte[ebx], 32
		je Minus
		cmp byte[ebx],'z'
		jg Minus
		cmp byte[ebx],'a'
		jge convertirMayus
		inc ebx 
		jmp ComparadorMinus
finComparadorMinus:
		 call printStr
		 pop ebx
		 pop eax
		 int 80h
		 ret
Minus:
         inc ebx  
         jmp ComparadorMinus
         
convertirMayus:
        
        sub byte[ebx],32
        inc ebx 
        jmp ComparadorMinus
   strlowcase:
		
		push	ebx 
		push	eax 
		mov 	ebx, eax
	
ComparadorMayus:
		cmp 	byte[ebx],0
		jz 		finComparadorMayus
		cmp 	byte[ebx], 32
		je 		Mayus
		cmp 	byte[ebx],'A'
		jl		 Mayus
		cmp		 byte[ebx],'Z'
		jle 	convertirMinus
		inc 	ebx 
		jmp 	ComparadorMayus
finComparadorMayus:
		 call 	printStr
		 pop 	ebx
		 pop 	eax
		 int 	80h
		 ret
Mayus:
         inc 	ebx  
         jmp 	ComparadorMayus
         
convertirMinus:
        
        add 	byte[ebx],32
        inc 	ebx 
        jmp 	ComparadorMayus     
        
        
invertirCadena:
			push ebp
			mov ebp,esp
            mov eax,[ebp+8]
cadenaMemoria:
			mov 	bl, byte[eax]
			cmp 	bl,0
			jz 		finCadenaMemoria
			push 	bx 
			inc 	eax
			jmp 	cadenaMemoria
finCadenaMemoria:			
			mov eax,[ebp+8]
			jmp invertir
			
invertir:
           pop  bx
           mov  byte[eax],bl
           cmp 	bl,0
       	   jz   finInvertirCadena		
       	   inc  eax
       	   jmp invertir	
finInvertirCadena:
			leave 
			ret
         
