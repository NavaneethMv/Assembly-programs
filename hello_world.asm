; hello_world.asm
; x86 assembly

global _start

section .text:

_start:
	mov eax, 0x4		; write syscall
	mov ebx, 1		; file descripter
	mov ecx, message 	; data to be written out
	mov edx, message_length ; we neeed to specify the length of the data to be written
	int 0x80		; Invoke the sys call

	; Exiting the program

	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data:
	message: db "Hello, world!", 0xA
	message_length equ $-message
