TITLE Week 10 Rev 2
; Author: Chris Mangan
; Date: 4-2-2024

INCLUDE Irvine32.inc

.data
	condVar BYTE ?
	num DWORD 0
	myPrompt BYTE "Continue? (y/n)?", 0
	caseOutput BYTE "The following is a case table. Enter an int:",0
	noMatchString BYTE "Number does not match any procedures",0
	caseTable BYTE 1
			DWORD PROC1
			rowSize = $ - caseTable ; where i am minus the address of table
			BYTE 2
			DWORD PROC2
			BYTE 3
			DWORD PROC3
			numRows = ($ - casetable) / rowSize ; where i am minus case table address, divided by the size of the row gives us the count of rows
			
	proc1String BYTE "You entered a one!",0
	proc2String BYTE "You entered a two!",0
	proc3String BYTE "You entered a three!",0
.code

main PROC uses eax edx esi
top:
	call getValue
	cmp al, "n"
	je done
	inc num
	mov eax, num
	call writeInt
	call crlf
	jmp top
	
done:
	mov edx, offset caseOutput
	call writeString
	call crlf
	call readInt
	call writeInt
	call crlf
	mov esi, offset caseTable
	mov ecx, numRows ; move number of rows into loop count
case:
		cmp al, [esi]
		je match
		add esi, rowSize;
	loop case
	jmp noMatch
match:
	call NEAR PTR [esi+1] ; i have barely any idea what the fuck this does; "this tells the code I can point to this" - Rothman
	jmp final
noMatch:
	mov edx, offset noMatchString
	call writeString

final:
	exit
main ENDP

getValue PROC uses edx ; NOT using eax since we reference it.
	mov edx, offset myPrompt
	call writeString
	call crlf
	call readChar
	call writechar ; this is so we can see what we entered
	call crlf
	ret
getValue ENDP

proc1 PROC uses edx
	mov edx, offset proc1String
	call writeString
	ret
proc1 ENDP

proc2 PROC uses edx
	mov edx, offset proc1String
	call writeString
	ret
proc2 ENDP

proc3 PROC uses edx
	mov edx, offset proc1String
	call writeString
	ret
proc3 ENDP
END main