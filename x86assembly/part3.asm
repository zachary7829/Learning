global _start

section .data
    addr db "x86assembly"
    
section .text
_start:
    mov [addr], byte 'z'
    mov [addr+1], byte 'a'
    mov [addr+2], byte 'c'
    mov [addr+3], byte 'h'
    mov [addr+4], byte 'a'
    mov [addr+5], byte 'r'
    mov [addr+6], byte 'y'
    mov [addr+7], byte '7'
    mov [addr+8], byte '8'
    mov [addr+9], byte '2'
    mov [addr+10], byte '9'
    mov eax,4
    mov ebx,1
    mov ecx,addr
    mov edx,11
    int 0x80
    mov eax,4
    sub esp,5
    mov [esp], byte 'T'
    mov [esp+1], byte 'e'
    mov [esp+2], byte 's'
    mov [esp+3], byte 't'
    mov [esp+4], byte '!'
    mov ebx,1
    mov ecx,esp
    mov edx,5
    int 0x80
    mov eax,1
    mov ebx,0
    int 0x80