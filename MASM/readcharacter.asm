;author ziceck
;date: 26/06/2017
;read a character from keyboard, and print the character.

.286
;stack segment
spila SEGMENT stack
	DB 32 DUP ('stack___')
spila ENDS

; data segment
sdatos SEGMENT
	;put your vars here
	msg DB 'Type a character: ','$'
	msg2 DB 'You typed this character: ','$'
	character DB ?,'$'
	lineBreak DB 0AH,'$'
sdatos ENDS

; code segment
scodigo SEGMENT 'CODE'
	ASSUME SS:spila, DS:sdatos, CS:scodigo
	MAIN PROC FAR

		;default code, not change.
		;_____________________
		PUSH DS
		PUSH 0
		MOV AX, sdatos
		MOV DS,AX
		MOV ES,AX
		;_____________________

		;_____________________
		;put your code here
		;print message
		MOV AH , 09H   ;09h function in INT 21h
		LEA DX , msg
		INT 21H 
		
		;read character
		MOV AH,01H
		INT 21H
		MOV character,AL

		;print \n
		MOV AH,09H
		LEA DX, lineBreak
		INT 21H

		;print msg2
		MOV AH,09H
		LEA DX,msg2
		INT 21H

		;print character
		MOV AH,09H
		LEA DX, character
		INT 21H
		;______________________
		RET
	MAIN ENDP
scodigo ENDS
END MAIN
