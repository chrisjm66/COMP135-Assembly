TITLE Week 10
; Author: Chris Mangan
; Date: 4-2-2024

INCLUDE Irvine32.inc

.data
	myBuffer BYTE 40 dup(0) ; reserves 40 spaces, ? can also be used
	; note: 7 makes a chime
	stringPrompt BYTE 7,"Enter a string:",0 ; the 0 is a null character which helps with the logic. the 0 tells writestring when to stop.
	intPrompt BYTE "Enter an integer:",0
	val1 DWORD ?
	val2 DWORD ?
	greaterString BYTE "Number 1 is greater than number 2",0
	lessString BYTE "Number 1 is less than number 2",0
	equalString BYTE "Number 1 is equal to number 2",0
	endProcString BYTE "Procedure ended",0
	infoString BYTE "I will now compare two numbers you give me",0
.code

main PROC
	call getString
	call addInts
	
	call compareInts
	exit
main ENDP

getString PROC uses eax ecx edx
	; this is how to print a string
	mov edx, offset stringPrompt ; these two must be used together
	call writestring ; writes a string
	call crlf ; write a line
	
	mov ecx, 40 ; how many?
	mov edx, offset mybuffer ; where?
	call readstring ; gets a string, num of characters are in eax and we can loop through that to add it to our buffer.
	stringLoop:
		;; todo 
	LOOP stringLoop
	
	ret
getString ENDP

addInts PROC uses eax ecx edx
	call writeIntPrompt
	
	call readint ; moves value into eax
	mov ebx, eax
	
	call writeIntPrompt
	
	call readint
	add eax, ebx
	call writeint
	ret
addInts ENDP

writeIntPrompt PROC uses edx
	mov edx, offset intPrompt
	call writestring
	call crlf
	
	ret
writeIntPrompt ENDP

; this is how to compare two numbers
compareInts PROC uses eax edx
	call crlf
	mov edx, offset infoString
	call writeString
	call crlf
	
	call getInts ; see below, compares ints
	mov eax, val1 ; cannot do memory to memory comparison so we move this to eax
	
	cmp eax, val2 ; think of this as the if then else; if eax > val2, jump to greater; if less than, jump to lessthan, else(if equal), jump to equal.
	jg greater
	jl less
	je equal
	
	greater:
		mov edx, offset greaterString
		call writeString
		jmp next ; so we don't run the next code segments
	less:
		mov edx, offset lessString
		call writeString
		jmp next
	equal:
		mov edx, offset equalString
		call writeString
		; no jump needed here since it's sequential.
	
	next:
		call crlf
		mov edx, offset endProcString
		call writeString
	ret
compareInts ENDP

getInts PROC uses eax
	call writeIntPrompt
	call readInt
	mov val1, eax
	
	call writeIntPrompt
	call readInt
	mov val2, eax
	
	ret
getInts ENDP

END main