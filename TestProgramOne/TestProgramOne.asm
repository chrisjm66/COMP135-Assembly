; Title: Test Program I
; Author: Chris Mangan

INCLUDE Irvine32.inc

.data
	num BYTE ? ; unassigned value
	
.code
	main PROC
		; Positive Value
		mov num, 73d ; masm assumes decimal
		movsx eax, num ; move signed
		call DumpRegs
		call WriteInt
		movzx eax, num ; move unsigned
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
		
		call loopSetup
		exit
	main ENDP
	
	otherStuff PROC
		; Here's some other useful ones
		inc eax ; increments eax by 1
		dec eax ; decrements eax by 1
		add eax, 1 ; adds 2nd arg to 1st
		sub eax, 1 ; subtracts 2nd arg to 1st
		;neg 73 ; returns -73
	otherStuff ENDP
	
	loopSetup PROC
		; NOTE: ECX is the primary loop register. Don't use it for anything else if using loops.
		mov ecx, 10 ; loop will run 10 times
		mov eax, 0
		
		call DumpRegs ; this is just for space.
		
		loopStart:
			mov eax, ecx ; move counter into eax
			call WriteInt
			
			JMP loopStart; this jumps immediately to the LOOP command.
			
			call WriteInt ; this will not run b/c of the jump
		loop loopStart ; loops through loopstart and subtracts 1 from ecx each time.
		; LOOP COMMAND TESTS FOR 0. IF IT DOES NOT HIT 0 YOU WILL GET AN INF. LOOP.
		
	loopSetup ENDP

END main