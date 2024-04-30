TITLE UngeneralizedPROC
; Author: Chris Mangan
; Date: 3-26-2024

INCLUDE Irvine32.inc

.data
	myArray DWORD 3,12,15,61,32,5 ; sum = 128
	myArray2 WORD 4,-1,7,8,9 ; sum = 27
	sum DWORD ?
.code

main PROC
	call addUp
	call writeint
	
	call addupWORD
	call writeint
	
main ENDP

addup PROC
	mov esi, OFFSET myArray
	mov ecx, LENGTHOF myArray
	mov eax, 0
	
	loopStart:
		; add sum, [esi] - this cannot be done since it is memory to memory transfer.
		add eax, [esi]
		add esi, 4 ; 4 since this is a DWORD
	
	loop loopStart
	mov sum, eax
	ret
addup ENDP

addupWORD PROC
	mov esi, OFFSET myArray2
	mov ecx, LENGTHOF myArray2
	mov eax, 0
	
	loopStart:
		; add sum, [esi] - this cannot be done since it is memory to memory transfer.
		add ax, [esi] ; ax since WORDs are 16 bits
		add esi, 2 ; 2 since this is a WORD
	
	loop loopStart
	mov sum, eax
	ret
addupWORD ENDP

END main