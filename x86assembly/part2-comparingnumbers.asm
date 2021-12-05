global _start

; je a, b jump if equal
; jne a, b jump if not equal
; jg a, b jump if greater
; jge a, b jump if greater or equal to
; jl a, b jump if less
; jle a, b jump if less than or equal to
section .text
_start:
    mov ebx,7829
    mov eax,1
    mov ecx,101
    cmp ecx,ebx
    jl skip ; jump if ecx is less than ebx
skip:
    mov ebx,42
    int 0x80