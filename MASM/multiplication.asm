COMMENT #
author ziceck
date: 26/06/2017
Template for masm code.
Type here your description about the code.
This code is an example for multiplication in assembly.
#
.286
;stack segment
spila SEGMENT stack
	DB 32 DUP ('stack___')
spila ENDS

; data segment
sdatos SEGMENT
	;put your vars here
	number1 DB ?,'$'
	result DB ?,'$'
	msg1 DB 'Type a number: ','$'
	msg2 DB 'Type other number: ','$'
	msg3 DB 'The result of the addition is: ','$'
	lineBreak DB 0DH,0AH,'$'
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
		MOV DS, AX
		MOV ES, AX
		;_____________________

		;_____________________
		;put your code here
		
		;print msg1
		MOV AH, 09H
		LEA DX, msg1
		INT 21H

		;read number1
		MOV AH, 01H
		INT 21H

		;adjustment
		SUB AL, 30H
		MOV number1, AL
 
		;print \n
		MOV AH, 09H
		LEA DX, lineBreak
		INT 21H

		;print msg2
		MOV AH, 09H
		LEA DX, msg2
		INT 21H

		;read number2
		MOV AH, 01H
		INT 21H	

		;clear AH
		MOV AH, 00H

		;Adjustment	
		SUB AL, 30H

		COMMENT #
		number1*number2 | number2 is AL
		MUl is AX*BX
		result of mul is in AL | AL=AL*BL (AX=AX*BX)
		#
		MOV BL, number1
		MUL BL

		;Adjustment
		ADD AL, 30H
		MOV result, AL

		;print \n
		MOV AH, 09H
		LEA DX, lineBreak
		INT 21H

		;print result
		MOV AH, 09H
		LEA DX, msg3
		INT 21H

		MOV AH, 09H
		LEA DX, result
		INT 21H
		;______________________
		RET
	MAIN ENDP
scodigo ENDS
END MAIN