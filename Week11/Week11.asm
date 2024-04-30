TITLE Week 11 Stuff / Test Prep
; Author: Chris Mangan
; Date: 4-9-2024

INCLUDE Irvine32.inc

stringLength = 40
ithChar = 5
.data
	fortyCharString BYTE stringLength DUP(0) ; very important to initialize with 0s in string since they will not print, unlike a ? which gets filled with garbage.
	numbers dw 12,14,23,21,24,21,7,8
	sumIndicator BYTE "Current Sum:",0
	stringPrompt BYTE "Enter a string:",0
	sum byte 0
	nums BYTE 0 ; count of numbers
	letters BYTE 0
	
	myName BYTE "Chris",0
	numSpaces BYTE 1
.code

main PROC
	call nameLoop

	exit
main ENDP

; ex 4
nameLoop PROC uses eax ecx edx
	mov ecx, 10 ; output my name 10 times
	mov edx, OFFSET myName
	outerLoop:
		; write name
		call writeString
		
		push ecx ; push ecx for use in inner loop
		call crlf ; create newline
		movzx ecx, BYTE PTR numSpaces 
		mov al, " "
		innerLoop:
			call writeChar
		LOOP innerLoop
		inc numSpaces
		pop ecx ; pop to outerloop value
		
	LOOP outerLoop
	ret
nameLoop ENDP

;ex 1
sumProc PROC uses eax ecx edx esi
	mov ecx, LENGTHOF numbers
	mov esi, OFFSET numbers
	mov edx, OFFSET sumIndicator
	mov ax, 0
	top:
		mov ax, [esi]
		add sum, al ; because all numbers fit in a byte we can just add al.
		add esi, TYPE numbers ; esi + 2
		
		movsx eax, sum ; so the current sum displays
		call writeString
		call crlf
		call writeInt
		call crlf
	LOOP top
	ret
sumProc ENDP

;ex 2
fortyStringProc PROC uses eax ecx esi
	; Create a program that reads a 40-char string from the user and prints every fifth character.
	; print string
	mov edx, OFFSET stringPrompt
	call writeString
	call crlf
	
	mov edx, OFFSET fortyCharString ; where to put string
	mov ecx, LENGTHOF fortyCharString ; how much space
	call readString
	
	mov ecx, ((LENGTHOF fortyCharString / ithChar) + 1) ; eax is the length of the string in readString
	mov esi, OFFSET fortyCharString
	top:
		
		mov al, [esi] ; al since its a char
		add esi, ithChar ; since this a byte i can just add the exact amount of charts
		call writeChar
	LOOP top
	
	ret
fortyStringProc ENDP

; ex 3
stringIdentProc PROC uses eax ecx esi
	mov ecx, lengthOf fortyCharString
	mov esi, OFFSET fortyCharString
	
	top:
		mov al, [esi] ; moves current char to al
		
		cmp al, "0" ; 48 ascii
		jl nextChar ; al < 0
		
		cmp al, "9"
		jle addNumber ; 0 <= al <= 9
		
		cmp al, "A"
		jl nextChar ; 9 < al < A
		
		cmp al, "Z"
		jle addLetter ; A <= al <= Z
		
		cmp al, "a"
		jl nextChar ; Z < al < a
		
		cmp al, "z"
		jle addLetter ; a <= al <= z
		jg nextChar ; z < al
		
	addLetter:
		inc letters
		jmp nextChar
		
	addNumber:
		inc nums
		jmp nextChar
		
	nextChar:
		inc esi ; add 1 to esi which gets next char
		
	LOOP top
	
	movzx eax, nums
	call writeInt
	
	movzx eax, letters
	call writeInt
	
	ret
stringIdentProc ENDP
END main