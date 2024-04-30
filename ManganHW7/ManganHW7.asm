TITLE Calculate Grade
; Author: Chris Mangan
; Date: 4-15-2024

INCLUDE Irvine32.inc

.data
	NUM_GRADES = 10
	quizPrompt BYTE "Enter letter grade: ",0
	randomOutput BYTE "Random Grade: ",0
	letterOutput BYTE "Grade: ",0
	avgOutput BYTE "Average Grade: ",0
	inputGrade BYTE ? ; byte used since grades are only 1-100
	randomGrades BYTE NUM_GRADES DUP(?)
.code

main PROC
	; 1st part of assignment; user enters num and grade is returned
	call inputProc ; get input into inputGrade
	call calcGrade
	
	call createRandomGrades ; create and output random grades
	exit
main ENDP

inputProc PROC
	; print string
	mov edx, OFFSET quizPrompt
	call writeString
	call crlf
	
	; get user input
	call readInt
	mov inputGrade, al ; move user input into inputGrade
	ret
inputProc ENDP

calcGrade PROC uses eax ecx edx
	cmp inputGrade, 60 ; compare inputGrade to 60
	jl OutputF ; inputGrade < 60
	
	cmp inputGrade, 70
	jl OutputD ; inputGrade < 70
	cmp inputGrade, 80
	jl OutputC ; inputGrade < 80
	cmp inputGrade, 90
	jl OutputB ; inputGrade < 90
	jmp OutputA ; inputGrade >= 90
	
	OutputF:
		mov al, "F" ; moves "F" to al
		jmp final ; jumps to final label
	OutputD:
		mov al, "D" ; moves "D" to al
		jmp final ; jumps to final label
	OutputC:
		mov al, "C" ; moves "C" to al
		jmp final ; jumps to final label
	OutputB:
		mov al, "B" ; moves "B" to al
		jmp final ; jumps to final label
	OutputA:
		mov al, "A" ; moves "A" to al
		
	final:
	; write string
	mov edx, OFFSET letterOutput
	call writeString
	call writeChar ; write user character
	call crlf
	ret
calcGrade ENDP

createRandomGrades PROC
	mov ecx, NUM_GRADES; run 10 times
	mov edx, OFFSET randomOutput
	randomNumbers:
		mov eax, 100 ; setup for RandomRange function
		call RandomRange ; irvine function
		
		call writeString ; display string telling user about data
		call writeInt ; display to user
		mov inputGrade, al
		
		call crlf
		call calcGrade ; calculate grade of inputGrade
	LOOP randomNumbers
	ret
createRandomGrades ENDP

END main