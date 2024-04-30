TITLE My Program
; Chris Mangan

INCLUDE Irvine32.inc

.data
	a1 DWORD 12
	b1 DWORD 13
	c1 DWORD 14
	d1 DWORD 12
.code

main PROC
	; *************************
	; Compute (A + B) - (C + D)
	; *************************
	
	;mov eax, 9282
	;mov ebx, 1
	;mov ecx, 9
	;mov edx, 492
	
	; A + B into A
	mov eax, a1
	add eax, b1

	; C + D into C
	mov ebx, c1
	add ebx, d1
	
	; A - C
	sub eax, ebx
	
	; Print eax
	call WriteInt
	call DumpRegs
	exit
main ENDP

END main