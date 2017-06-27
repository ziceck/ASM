;author ziceck
;date: 26/06/2017
;Code for hello world with assembly MASM.

.286
;stack segment
spila SEGMENT stack
	DB 32 DUP ('stack___')
spila ENDS

; data segment
sdatos SEGMENT
	hello DB 'Hello Wolrd ','$'
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
	
	;print hello world
	MOV AH , 09H   ;09h function in INT 21h
	LEA DX , hello
	INT 21H 
	;end print hello world

	RET
MAIN ENDP
scodigo ENDS
END MAIN
