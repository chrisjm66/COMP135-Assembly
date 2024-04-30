TITLE Homework 3B: Exercises 2, 3, and 4
; Author: Chris Mangan
; Date: 2-26-2024

INCLUDE Irvine32.inc

.data
	; Exercise 2
	monday EQU "Monday"
	tuesday EQU "Tuesday"
	wednesday EQU "Wednesday"
	thursday EQU "Thursday"
	friday EQU "Friday"
	saturday EQU "Saturday"
	sunday EQU "Sunday"
	
	weekdays BYTE monday, tuesday, wednesday, thursday, friday, saturday, sunday; I had trouble understanding this: Why does a DWORD need to be used if the datatype of all elements is a BYTE?
	
	; Exercise 3
	oneByte BYTE "hello" ; 8bit unsigned, good for strings.
	signedByte SBYTE -127 ; signed 8bit, good for negative numbers as low as -127.
	oneWord WORD 60000 ; unsigned 16bit, good for numbers where 256 < x < 65535
	signedWord SWORD -30000 ; signed 16bit, good for negative numbers as low as -32768
	oneDWord DWORD 12345678h ; unsigned 32bit, good for very precise numbers that are less than 4294967295.
	signedDWord SDWORD -2147383648 ; signed 32bit, good for negative numbers as low as the number to the left.
	
	
	
	; Exercise 4
	helloEqu EQU <"Hello">
	goodbyeEqu EQU <"Goodbye">
	howAreYouEqu EQU <"How are you?">
	
	hello BYTE helloEqu
	goodbye BYTE goodbyeEqu
	howAreYou BYTE howAreYouEqu
	
	
	
.code

main PROC
	exit
main ENDP

END main