TITLE another bs program
; Chris Mangan

INCLUDE Irvine32.inc

.data
	apple DWORD 7
	banana WORD 14
	myString BYTE "morbid obesity"
	strlen = $ - myString ; $ (where am I?) - myString storage location; gets length of myString
	cheese WORD 11
	
	eatingsimulator EQU <mov> ; sets any instance of eatingsimulator to EQU
	ten EQU 5 + 5 ; same as above, equals 10, not really used since we can just use an = sign
	twelve EQU <6 + 6> ; literally subs in 6 + 6, not 12
.code

main PROC
	eatingsimulator eax, strlen
	
	call WriteInt
	exit
main ENDP

END main
	