TITLE Test 2 Q9
; Author: Chris Mangan
; Date: 4-16-2024

COMMENT !
	To create this program, I would first define a string as a prompt for the user in .data. then, I will move the offset of that into edx and write it.
	After, I will read an int from the user into eax and compare it to 999. I will use a je statement to jump to the end of the procedure if it is not the correct statement. 
	On the program's first iteration, I will move the value of eax into each of the three variables to start the program off without errors.
	Otherwise, I will compare it to the highest value, and if greater, the highest value to eax.
	I will then check if it is less than the lowest value, and if so, set the lowest value to eax.
	I will then add the item to a sum variable in .data regardless of it being the lowest or highest number.
	
	After the user writes a 999, I would run another procedure to move the offsets of three respective strings into edx and use them to display the values of the three variables given.
!
INCLUDE Irvine32.inc

.data
	sum DWORD 0
	highest DWORD ?
	lowest DWORD ?
	integerPrompt BYTE "Enter an integer: ",0
	lowOutput BYTE "Lowest number: ",0
	highOutput BYTE "Highest number: ",0
	sumOutput BYTE "Sum: ",0
.code

main PROC
mov ebx, 0 ; for tracking first iteration of program
beginproc:
	call readUserInt
	cmp eax, 999 ; compare eax to 999
	je endproc
	
	cmp ebx, 0 ; check if ebx is 0 (first run of proc)
	je firstIteration ; jump to label to initialize first case
	
	cmp eax, lowest ; compare eax to current lowest value
	jb setLowest ; go to setLowest label if lowest value
	
	cmp eax, highest ; compare eax to current highest value
	ja setHighest ; go to setHighest label if highest value
	
	jmp addToSum
setLowest:
	mov lowest, eax ; move eax into lowest variable
	jmp addToSum ; skip over setHighest to sum
setHighest:
	mov highest, eax ; move eax into highest variable
addToSum:
	add sum, eax ; add eax to the sum
	jmp beginproc ; since this only gets ran if 999 was not selected, we jump to the top of the procedure.
endproc:
	call displayResults
	exit
	
firstIteration:
	mov lowest, eax ; move eax into lowest variable
	mov highest, eax ; move eax into highest variabl
	add sum, eax ; add eax to current sum variablej
	inc ebx ; add 1 to ebx to signify that this already ran
	jmp beginproc ; go back to beginning
main ENDP

readUserInt PROC
	mov edx, OFFSET integerPrompt ; move offset of integerPrompt to edx
	call writestring ; write integerPrompt
	call crlf ; newline
	call readint ; readint > eax
	ret
readUserInt ENDP

displayResults PROC
	mov edx, OFFSET lowOutput ; move offset of lowOutput into edx
	call writestring ; write lowOutput
	mov eax, lowest ; move lowest into eax
	call writeint ; write eax
	call crlf ; newline
	
	mov edx, OFFSET highOutput ; move offset of highOutput into edx
	call writestring ; write highOutput
	mov eax, highest ; move lowest into eax
	call writeint ; write eax
	call crlf ; newline
	
	mov edx, OFFSET sumOutput ; move offset of sumOutput into edx
	call writestring ; write sumOutput
	mov eax, sum ; move sum into eax
	call writeint ; write eax
	
	ret
displayResults ENDP
END main