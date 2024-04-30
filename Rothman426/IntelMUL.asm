TITLE Multiply using MUL

; Author: Allen Rothman
; Date Created: 4/23/2024

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

	multiplicand BYTE ?
	multiplier BYTE ?
	product WORD ?
	prompt BYTE "Enter a positive integer less than 256: ",0
	prompt2 BYTE "Enter another: ",0
	
	

.code
main PROC

	mov edx, OFFSET prompt
	call writestring
	call readint
	mov multiplicand, al 
	mov edx, OFFSET prompt
	call writestring
	call readint
	mov multiplier, al
	
	mul multiplicand	; multiply AL by multiplicand, product in AX
	mov product, ax
	movzx eax, multiplier
	call writeint
	mov al, "*"
	call writechar
	movzx eax, multiplicand
	call writeint
	mov al, "="
	call writechar
	movzx eax, product
	call writeint
	
	
	
	

	exit		; exit to operating system
main ENDP

; (insert additional procedures here)

END main