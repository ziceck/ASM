;author ziceck
;date: 26/06/2017
;Template for masm code.

.286
;stack segment
spila SEGMENT stack
	DB 32 DUP ('stack___')
spila ENDS

; data segment
sdatos SEGMENT
	;put your vars here
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


		;______________________
		RET
	MAIN ENDP
scodigo ENDS
END MAIN