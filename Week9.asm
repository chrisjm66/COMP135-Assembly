; Title:
; Author: Chris Mangan
; Date: 3-19-2024

INCLUDE Irvine32.inc

.data
	banana DWORD 0
.code

main PROC
	mov eax, 1
	call writeint ; every time a method is called the return address is stored.
	call newProc
	inc eax
	call writeint
	exit
main ENDP

newProc PROC
	inc eax
	call writeint
	ret ; sends app back to main function
newProc ENDP

END main