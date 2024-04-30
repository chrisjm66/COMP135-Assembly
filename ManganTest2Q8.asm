TITLE Chris Mangan - Test 2 Q8
; Author: Chris Mangan
; Date:

INCLUDE Irvine32.inc

.data
	inputPrompt BYTE "Please enter a string, up to 40 chars:",0
	keyPrompt BYTE "Enter encryption key:",0
	encryptionOutput BYTE "Encrypted string: ",0
	decryptionOutput BYTE "Decrypted string: ",0
	userInputString BYTE 40 DUP(0) ; declare an unknown, 40 char string
	encryptionKey BYTE ? ; single byte for encryption key
.code

main PROC
	call readUserString ; call readUserString proc
	call readEncryptionKey ; call readEncryptionKey proc
	call encrypt ; call encrypt proc
	mov edx, OFFSET encryptionOutput ; move offset of encryptionOutput to edx
	call writeString ; write encryptionOutput
	mov edx, OFFSET userInputString ; move offset of userInputString
	call writeString ; write encrypted string
	call crlf ; newline
	
	call encrypt ; decrypt the string (we can use same proc since its just an XOR)
	mov edx, OFFSET decryptionOutput
	call writestring ; write output string
	mov edx, OFFSET userInputString; move offset of userInputString
	call writestring ; write decrypted string
	exit
main ENDP

readUserString PROC uses eax ecx esi
	; Create a program that reads a 40-char string from the user
	; print prompt
	mov edx, OFFSET inputPrompt ; move offset of inputPrompt to edx
	call writeString ; write the string
	call crlf ; newline
	
	mov edx, OFFSET userInputString ; where to put string
	mov ecx, LENGTHOF userInputString ; how much space to allocate (40 spaces)
	call readString ; read the string from the user
	
	ret
readUserString ENDP

readEncryptionKey PROC
	mov edx, OFFSET keyPrompt ; move offset of keyprompt to edx
	call writestring ; write keyprompt
	call crlf ; newline
	
	call readchar ; read char from user
	mov encryptionKey, al ; move AL into the encryptionKey variable
	ret
readEncryptionKey ENDP

encrypt PROC
	; (de)encrypts the string
	mov esi, 0 ; for looping through userInputString
	mov ecx, LENGTHOF userInputString ; loop counter
	mov al, encryptionKey ; move encryption key into al since memory > memory is not allowed
	startLoop:
		xor userInputString[esi], al ; exclusive or on [esi] (string character) and the encryption key
		inc esi ; add one to esi (next char)
	loop startLoop
	
	ret
encrypt ENDP
END main