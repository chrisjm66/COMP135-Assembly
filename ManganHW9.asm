TITLE Homework 9 - Bitwise
; Author: Chris Mangan
; Date: 4-29-2024

INCLUDE Irvine32.inc

.data
	multiplier DWORD ?
	multiplicand DWORD ?		; This is a DWORD as per the assigment to assume it will never go over 32 bits.
	product DWORD ?
	intPrompt BYTE "Enter a positive integer less than 32 bits: ",0
	intPrompt2 BYTE "Enter another one: ",0
	responseText BYTE "The product is: ",0
.code

main PROC
	call populateMultiplicationValues
	call multiply
	call displayResult
	exit
main ENDP

populateMultiplicationValues PROC
	mov edx, OFFSET intPrompt ; move prompt offset to edx
	call writestring ; write prompt
	call readint ; get int from user into eax
	mov multiplicand, eax ; populate into variable
	
	mov edx, OFFSET intPrompt2 ; move prompt offset to edx
	call writestring ; write prompt
	call readint ; get int from user into eax
	mov multiplier, eax ; populate into variable
	ret
populateMultiplicationValues ENDP

multiply PROC uses ecx ebx
	mov ecx, 32 ; 32 bits
	mov ebx, 0 ; product counter
	
multiplyLoop:
	shr multiplier,1 ; move multiplier 1 to right (halve)
	jnc skip ; go to skip label if no carry
	add ebx, multiplicand ; add 2nd int to bx if carry
skip:
	shl multiplicand,1 ; move left 1 (double)
LOOP multiplyLoop

	mov product, ebx
	ret
multiply ENDP

displayResult PROC
	mov edx, OFFSET responseText
	call writeString ; write string text
	
	mov eax, product
	call writeint ; display product
	ret
displayResult ENDP
END main