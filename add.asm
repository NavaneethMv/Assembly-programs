; add two numbers
; add.asm - assembly

; Author - M V Navaneeth
; Date - 12-mar-2023

global _start

section .text:

_start:
	mov eax, 0x5	; eax - 5
	mov ebx, 0x3	; ebx - 3
	mov [num1], eax	; using a variable num1 transfer the value
	mov [num2], ebx	; transfer the value
	mov eax, [num1]
	sub eax, '0'	; to convert ascii to decimal	
	mov ebx, [num2]
	sub ebx, '0'
	add eax, ebx
	add eax, '0'	; to convert decimaal to ascii
	mov [res], eax	; using the variable res

	mov eax, 4	; using system call write to write the value to stdout
	mov ebx, 1
	mov ecx, res
	mov edx, 5 
	int 0x80

	mov eax, 0x1 	; exit nicely
	mov ebx, 0
	int 0x80
	

section .bss		; to set variable ig
	num1 resb 5 ; res 5 bytes
	num2 resb 5
	res resb 5
