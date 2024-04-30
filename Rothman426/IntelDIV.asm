TITLE Division using DIV

; Author: Allen Rothman
; Date Created: 4/23/2024

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

	quotient BYTE ?
	remainder BYTE ?
	divisor BYTE ?
	dividend WORD ?
	prompt BYTE "Enter a positive dividend less than 32768: ",0
	prompt2 BYTE "Enter the divisor: ",0
	rem BYTE " with a remainder of ",0
	
	

.code
main PROC

	mov edx, OFFSET prompt
	call writestring
	call readint
	mov dividend, ax
	mov edx, OFFSET prompt
	call writestring
	call readint
	mov divisor, al
	
	mov ax, dividend
	div divisor			; divide AX by divisor, quotient in AL, remainder in AH
	mov quotient, AL
	mov remainder, AH
	
	movzx eax, dividend
	call writeint
	
	mov al, "/"
	call writechar
	
	movzx eax, divisor
	call writeint
	
	mov al, "="
	call writechar
	
	movzx eax, quotient
	call writeint
	
	mov edx, OFFSET rem
	call writestring
	
	movzx eax, remainder
	call writeint
	
	exit		; exit to operating system
main ENDP

; (insert additional procedures here)

END main