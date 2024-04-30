TITLE Unit 4 Program II
; Author: Chris Mangan
; Date: 3-19-2024

INCLUDE Irvine32.inc

.data
	LOOPCT EQU 13
	var1 DWORD 0AA11h
	var2 BYTE "Here is how to print an array two different ways:"
	var3 WORD 1,2,3,4,5,6,7,8,9
	varLength = $ - var2 ; $ is current address. this must be in front of the variable we want to use to work.
	array WORD 100, 60, 12, 7
	string2 BYTE "This is another way to print a string"
.code
main PROC
	mov ecx, LOOPCT
	
	top:
		mov eax, ecx
		call writeint
	LOOP top
	
	mov eax, var1+1 ; adds 1 to pointer
	call writehex
	
	; Indirect addressing
	
	; Example
	call crlf
	
	mov esi, OFFSET var2 ; start ESI as the offset of var2
	mov al, [esi] ; set AL to the value of ESI's pointer
	mov ecx, varLength ; move the length of the string into the ECX. could also use commented out varLength
	
	stringLoop:
		call writechar ; write char
		inc esi ; esi + 1; remember that ESI is a pointer
		mov al, [esi] ; set AL to dereferenced ESI
	LOOP stringLoop
	
	mov esi, OFFSET var3
	movzx eax, BYTE PTR [esi]
	mov ecx, LENGTHOF var3
	call crlf
	arrayLoop:
		call writeint
		call crlf
		;add esi, 2 
		add esi, TYPE var3 ; we add 2 to ESI since a WORD is two bytes. for a byte we would use one and a DWORD, 4. the TYPE function does this automatically.
		movzx eax, WORD PTR [esi] ; need to use as pointer on movzx since it doesnt know what kind of data is being input. Note: you need to set the pointer to the same datatype as var otherwise it bugs out.
	LOOP arrayLoop
	
	; Indirect Addressing: Arrays
	mov esi, 0
	
	mov ecx, LENGTHOF array
	arrayLoop2:
		movzx eax, WORD PTR array[esi]
		call writeint
		call crlf
		add esi, TYPE array
	LOOP arrayLoop2
	
	mov ecx, LENGTHOF string2
	mov esi, 0
	stringPrint:
		mov al, string2[esi] ; deref string2 @ ESI
		inc esi ; since string2 is a BYTE
		call writechar
	LOOP stringPrint
main ENDP

END main