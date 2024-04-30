TITLE Week 14 Labs
; Author: Chris Mangan
; Date: 4-30-2024

INCLUDE Irvine32.inc

.data
	array1 WORD 10, 20, 30, 40, 50
	rowSize = ($ - array1) ; where i am - array1 (row size)
			WORD 60, 70, 80, 90, 100
			WORD 110, 120, 130, 140, 150
	array2 BYTE 127, 3, 9, 12, 18, 26, 9, 15
	prompt1 BYTE "What row?",0
	prompt2 BYTE "What column?",0
	rownum BYTE ?
	colnum BYTE ?
	showme BYTE ?
.code

main PROC
	call multidarray
	exit
main ENDP

; lab 1
multiDArray PROC
	mov esi, OFFSET array1 ; base of row1
	
	; get row num
	mov edx, offset prompt1
	call writestring
	call crlf
	call readint
	mov rownum, al
	
	; get col num
	mov edx, offset prompt2
	call writestring
	call crlf
	call readint
	mov colnum, al
	
	mov esi, offset array1
	mov eax, rowsize
	mul rowNum ; eax = rowsize * rownum
	add esi, eax ; esi + current row
	mov eax, TYPE array1 ; mov 2 into eax (WORD)
	mul colnum ; multiply by column num
	
	mov ebx, [esi + eax] ; add esi (current row) to eax (column)
	mov showme, bl
	movzx eax, WORD PTR [showme]
	call writeint
	ret
multiDArray ENDP

bubbleSort PROC
	ret
bubbleSort ENDP

pass PROC uses ecx
	mov ecx, lengthof array2 - 1
	mov eax, 0
tPass:
	movzx esi,  BYTE PTR array2[eax]
	movzx edi, BYTE PTR array2[eax+1]
	cmpsb ; compare ESI and EDI
	jle next
	call swap
next:
	inc eax
	loop tPass
	ret
pass ENDP

swap PROC
	mov al, [esi]
	mov bl, [edi]
	mov [esi], bl
	mov [edi], al
	ret
swap ENDP
END main