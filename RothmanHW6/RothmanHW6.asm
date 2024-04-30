TITLE Rothman HW6 Example
; Author: Chris Mangan w examples by Allen Rothman
; Date: 4-9-2024

INCLUDE Irvine32.inc
howmany = 15 ; symbolic constant
.data
	nums DW howmany DUP (?) ; array of uninitialized words
	readPrompt BYTE "Enter a number",0
	sumString BYTE "The sum of your numbers are:",0
	sum DD 0 ; accumulator, DD = double word
.code

main PROC
	; all we need to do in main is call the other method
	call populateNumsArray
	call calculateSum
	exit
main ENDP

populateNumsArray PROC uses eax ecx esi edx
	mov ecx, howmany
	mov edx, OFFSET readPrompt
	mov esi, OFFSET nums
	readLoop:
		call crlf
		call writeString
		call crlf
		
		call readInt
		
		mov [esi], ax
		add esi, TYPE nums
	LOOP readLoop
	ret
populateNumsArray ENDP 

calculateSum PROC uses eax ecx esi edx
	mov ecx, howmany
	mov esi, OFFSET nums
	sumLoop:
		;mov eax, [esi] ; this wouldn't work because it would assume eax and [esi] are the same size.
		movsx eax, WORD PTR [esi] ; 16 bit word so we need to move it to eax using movsx
		add sum, eax
		add esi, TYPE nums
	LOOP sumLoop
	
	; print total
	mov edx, OFFSET sumString
	mov eax, sum
	call crlf
	call writeString
	call crlf
	call writeInt
	ret
calculateSum ENDP
END main