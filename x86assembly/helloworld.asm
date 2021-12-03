global _start

section .data
    msg db "Hello World", 0x0a ; 0x0a is the null byte or the newline character idk. this moves Hello World into msg
    len equ $ - msg ; moves length of msg into len

section .text
_start:
    mov eax,4 ; syscall for write, in all honesty i have no idea what ebx does but mov ecx passes in the msg variable to it and mov edx passes in the length of msg to it
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80
    mov eax,1 ; return with 0
    mov ebx,0
    int 0x80