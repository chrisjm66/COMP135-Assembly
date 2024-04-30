TITLE My Program
; Chris Mangan

INCLUDE Irvine32.inc

.data

.code

main PROC
	; *************************
	; Compute (A + B) - (C + D)
	; *************************
	mov eax, 9282
	mov ebx, 1
	mov ecx, 9
	mov edx, 492
	
	; A + B into A
	add eax, ebx

	; C + D into C
	add ecx, edx
	
	; A - C
	sub eax, ecx
	
	; Print eax
	call WriteInt
	call DumpRegs
	exit
main ENDP

END main