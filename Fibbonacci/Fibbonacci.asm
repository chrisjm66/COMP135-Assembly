; Title: Fibbonacci Sequence
; Author: Chris Mangan

INCLUDE Irvine32.inc

.data
	CALC_TO EQU 27 ; run 27 times; using EQU since it is a better constant than a vaiable.
	fibTemp DWORD 0
.code
	main PROC
		mov ebx, 0 ; Fib num 1
		mov eax, 1 ; Fib num 2
		mov ecx, CALC_TO; ; sets the loop counter (ECX) to the amount of times it should loop.
		
		printFibNumbers: ; this is just an address
			add eax, ebx ; adds last fib number (in EBX) to EAX
			call WriteInt ; print EAX value (the current fib number)
			
			mov fibTemp, eax ; move the current fib value into the temp variable
			mov eax, ebx ; move ebx (last fib number) to EAX (fib number to be added
			mov ebx, [fibTemp] ; move current fib value to EBX. the brackets are not required due to implicit dereferencing but are just an example on how to derefrence instead of sending an address
		LOOP printFibNumbers ; decrement ecx by 1
		
		exit
	main ENDP

END main