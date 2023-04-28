section .data
    mens db 'Ingresa una cade',0ah,0dh,'$' ;mensaje de inicio
    cadena db 21 ;aquí defines la estructura de la cadena:
    max db 20 ;máximo de caracteres (20 letras + el enter)

section .bss
    cant resb 1 ;almacena la cantidad real de caracteres tecleados
    campo resb 21 ;acepta espacios en la cadena

section .text
    global _start

_start:
    ;------Inicia el programa--------------------------
    mov eax, 4 ;petición para mostrar mensaje
    mov ebx, 1 ;stdout
    mov ecx, mens
    mov edx, 17
    int 0x80

    mov eax, 3 ;petición para introducir cadena
    mov ebx, 0 ;stdin
    mov ecx, cadena
    mov edx, 21
    int 0x80

    mov esi, campo ;mandamos la cadena al registro esi para empezar a evaluar

ciclo:
    mov al, byte[esi]
    cmp al, ' ' ;verifica si es espacio
    je es_espacio
    cmp al, 0 ;verifica si es el final de la cadena
    je salir
    jmp no_espacio

es_espacio:
    mov byte[esi], '.' ;si es espacio, lo reemplaza con un punto

no_espacio:
    inc esi ;incrementa el puntero a la siguiente posición
    jmp ciclo

salir:
    ;Desplegar la cadena final
    mov eax, 4 ;petición para mostrar mensaje
    mov ebx, 1 ;stdout
    mov ecx, campo
    mov edx, 21
    int 0x80

    ;Salir del programa
    mov eax, 1 ;petición para salir del programa
    xor ebx, ebx
    int 0x80