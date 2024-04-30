TITLE another bs program
; Chris Mangan

INCLUDE Irvine32.inc

.data
	apple DWORD 7
	banana WORD 14
	myString BYTE "morbid obesity"
	strlen = $ - myString ; $ (where am I?) - myString storage location; gets length of myString
	cheese WORD 11
	eatingsimulator EQU <mov>
.code

main PROC
	eatingsimulator eax, strlen
	
	call WriteInt
	exit
main ENDP

END main
	