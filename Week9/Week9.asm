; Title:
; Author: Chris Mangan
; Date: 3-19-2024

INCLUDE Irvine32.inc

.data
	
.code

main PROC
	mov eax, 1
	call writeint
	call newProc
	inc eax
	call writeint
	exit
main ENDP

newProc PROC
	inc eax
	call writeint
	ret
newProc ENDP

END main