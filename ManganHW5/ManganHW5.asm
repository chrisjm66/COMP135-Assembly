TITLE Mangan Homework 5
; Author: Chris Mangan
; Date: 3-19-2024

INCLUDE Irvine32.inc

.data
	sum DWORD 0
.code

main PROC
	call runInputLoop
	
	; at this point, we have displayed all numbers and have our sum so we can display sum and we are finished.
	call crlf
	mov eax, sum
	call writeint
	
	exit
main ENDP

runInputLoop PROC uses eax ecx; pushes and pops eax and ecx for us; we can also use push and pop but it is easier with the uses keyword since it automatically pops in the correct order.
	mov ecx, 10 ; 10 iterations
	loop1: ; label
	
		; we could also push and pop eax in here too, but in this case it does not make a huge difference.
		call ReadInt ; gets int from user, puts into eax (which has been pushed already)
		call WriteInt ; sends out current number
		add sum, eax ; adds eax to current sum
	LOOP loop1
	
	ret
runInputLoop ENDP

END main