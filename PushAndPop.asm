TITLE Push and Pop
; Author: Chris Mangan
; Date: 3-26-2024

INCLUDE Irvine32.inc

.data
	myWord WORD 1234h
	myDWord DWORD 56789ABCh
	fourByte DWORD ?
	twoByte WORD ?
.code

main PROC
	call outerLoop
	exit
main ENDP

;; pushing and popping everything is a huge pain, so we can use the uses keyword too. see below.
apple PROC
	push myWord ; push myword to stack
	push myDWord ; push mydword to stack
	pop fourByte ; pop something (myDWord)
	pop twoByte ; pop something else (myWord)
	movzx eax, twoByte
	call writehex
	mov eax, fourByte
	call writeHex
	
	ret
apple ENDP

outerLoop PROC
	push ecx ; this is one method of stacking variables. we push the variables we use and pop before returning.
	mov ecx, 5
	call innerloop
	
	outerLoopLbl:
		call innerloop
	LOOP outerLoopLbl
	pop ecx
	ret
outerLoop ENDP

innerLoop PROC uses ecx ; this is the other method. it does the work in outerLoop for us by pushing at the beginning and popping before we finish.
	mov ecx, 10
	loop1:
		mov eax, ecx
		call writeint
	LOOP loop1
	ret
innerLoop ENDP

END main