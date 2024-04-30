TITLE Homework 8
; Author: Chris Mangan
; Date: 4-29-2024

INCLUDE Irvine32.inc

.data
	n = 1000
	maxSquare = 31 ; needed for the sieve calculation. the minimum square over 1000 is 31.
	isPrime BYTE n DUP(1) ; creates an array of N true values, which we will loop through to find the prime numbers.
	primeText BYTE "These are the prime numbers: ",0
.code

main PROC
	call sieveProc

	call displayPrimes
	exit
main ENDP

sieveProc PROC
	;mov ecx, n ; move N (1000) into ecx for loop
	mov esi, 0 ; move isPrime address to ESI
	
	; 1 & 2 are always prime
	mov isPrime[0], 0
	mov isPrime[1], 0
	
startSieve:
	inc esi
	cmp esi, maxSquare ; see if esi (counter) is above the max square which is when the program should stop running
	ja sieveDone
	
	cmp isPrime[esi], 1
	jne startSieve ; jumps to startsieve if # is not prime
	
	mov eax, esi ; mov edi to esi so esi does not get altered
	mul eax ; multiply eax by itself. we don't need to worry about carry since we are only counting to 1000 so no need to convert anything.
	
	primeCheck:
		cmp eax, n ; compare edi to N (1000)
		jae startSieve ; if above N, go to start
		mov isPrime[eax], 0 ; sets current edi (starts at edi^2) to not prime
		add eax, esi ; add current base number to eax, basically looping through eax^2, eax^3, eax^4, etc
		jmp primeCheck

sieveDone:
	ret
sieveProc ENDP

displayPrimes PROC
	mov edx, OFFSET primeText ; for printing the string
	call writeString ; print string using irvine text
	call crlf ; newline

	mov ecx, n ; for looping through the numbers
	mov esi, OFFSET isPrime ; for looping through elements of array
	mov eax, 0 ; counter
numLoop:
	cmp BYTE PTR [esi], 1
	jne endLoop
	
	call writeInt ; prints eax, which in this case is just the index number that we are on.
endLoop:
	inc esi
	inc eax
LOOP numloop	
	ret
displayPrimes ENDP
END main