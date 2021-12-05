global _start
    
section .text
_start:
	call func
	call func2
	mov eax,1
	int 0x80

func:
	mov ebx,42
	pop eax ; popping off call, to prevent infinite loop with jmp
	jmp eax ; jump to mov eax,1

func2:
	mov ebx,42
	ret