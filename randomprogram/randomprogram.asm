; Title: Test Program I
; Author: Chris Mangan

INCLUDE Irvine32.inc

.data
	num BYTE ? ; what does this do
.code
main PROC

	; Positive Value
	mov num, 73d ; masm assumes decimal
	movsx eax, num
	call DumpRegs
	call WriteInt
	movzx eax, num
	call DumpRegs
	call WriteInt
	
	; Negative Value
	mov num, -73d ; masm assumes decimal
	movsx eax, num
	call DumpRegs
	call WriteInt
	movzx eax, num
	call DumpRegs
	call WriteInt
	exit
main ENDP

END main