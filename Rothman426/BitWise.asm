TITLE Bitwise Multiplication

; Author: Allen Rothman
; Date Created: 4/23/2024


INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

	multiplier BYTE ?
	multiplicand WORD ?		; Even though it's a BYTE, we need space to shift
	prompt BYTE "Enter a positive integer less than 256: ",0
	prompt2 BYTE "Enter another: ",0
	

.code
main PROC

	; Set up the values to be multiplied
	mov edx, OFFSET prompt
	call writestring
	call readint
	mov multiplicand, ax 
	mov edx, OFFSET prompt2
	call writestring
	call readint
	mov multiplier, al 
	
	; Loop to capture (SHR) and double (SHL)
	mov ecx, 8		; loop 8 times (8 bits)
	mov ebx, 0		; Initialize the product 
multLoop:
	; Capture a bit from the multiplier using SHR
	shr multiplier,1
	jnc skip
	add bx, multiplicand
skip:
	shl multiplicand,1
	loop multLoop
	
	; Display the results
	call writeint	; multiplier is still in EAX!
	mov al,"*"
	call writechar
	shr multiplicand,8	; shift the WORD right so it's a BYTE again
	movzx eax, multiplicand
	call writeint
	mov al,"="
	call writechar
	movzx eax, bx	; expand the product to 32 bits
	call writeint
	

	exit		; exit to operating system
main ENDP

; (insert additional procedures here)

END main