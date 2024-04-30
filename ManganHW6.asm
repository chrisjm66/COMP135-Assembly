TITLE Homework 6 - Procedures Chris Mangan
; Author: Chris Mangan
; Date: 4-8-2024

INCLUDE Irvine32.inc

.data
	nums dw 10 DUP(?)
	readPrompt BYTE "Enter a number",0
	sumString BYTE "The sum of your numbers are:",0
.code

main PROC
	call readProc
	call addProc
	
	exit
main ENDP

readProc PROC
	mov ecx, 10 ; run 10 times
	mov esi, OFFSET nums ; move nums offset to stack pointer
	readLoop:
		mov edx, OFFSET readPrompt ; write the readPrompt to user
		call writestring
		call crlf
		call readInt ; move user input into eax
		
		mov [esi], al ; deref esi and move eax (the input integer) into it
		inc esi ; esi+1
	loop readLoop ; eax - 1
	
	ret
readProc ENDP

addProc PROC
	mov ecx, 10 ; loop ctr
	mov edx, OFFSET sumString ; move offset of sumString into edx for printing
	mov esi, OFFSET nums ; move nums offset to stack pointer, +1 since the first value is input into eax.
	mov al, 0
	
	addLoop:
		add al, [esi]
		inc esi
	loop addLoop
	
	; print string
	call crlf
	call writeString
	call crlf
	call writeInt
	ret
addProc ENDP
END main