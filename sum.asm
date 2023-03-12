; Program to add two numbers

section .text
	global _start
_start:

	; handles the first input
	mov eax, 4; write
	mov ebx, 1; std_out
	mov ecx, msg1; what to write
	mov edx, msg1_len
	int 0x80; sys_call

	; perform computations
	mov eax, 3; grab data from keyboard
	mov ebx, 0;
	mov ecx, num1;
	mov edx, 5; remember our 5 bytes
	int 0x80

	; handles the second input
	mov eax, 4; write
	mov ebx, 1; std_out
	mov ecx, msg2; what to write
	mov edx, msg2_len
	int 0x80

	; perform computations
	mov eax, 3; grab data from keyboard
	mov ebx, 0;
	mov ecx, num2;
	mov edx, 5; remember our 5 bytes
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msg_len
	int 0x80

	; write final output
	mov eax, [num1]
	sub eax, '0' ;convert from ASCII to decimal
	mov ebx, [num2]
	sub eax, '0'
	add eax, ebx
	add eax, '0'
	mov [res], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res ; write result
	mov edx, 5
	int 0x80

exit:
	mov eax, 1
	int 0x80

section .data
	msg1 db "Enter num 1: "
	msg1_len equ $ - msg1

	msg2 db "Enter num 2: "
	msg2_len equ $ - msg2

	msg db "The sum is: "
	msg_len equ $ - msg

section .bss
	num1 resb 5 ; res 5 bytes
	num2 resb 5
	res resb 5
