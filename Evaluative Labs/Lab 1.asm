; Write an ALP that will examine a set of 10 signed 8-bit nos. The numbers are stored from location num1. All the positive numbers must be copied to location 
; starting from pos1 and all negative numbers must be copied to location starting from neg1.

.model tiny
.486
.data
	num1 db -4,43,81,-1,0,23,66,-56,-73,1
	pos1 db 10 dup(?)
	neg1 db 10 dup(?)
.code
.startup
	mov cl,10
	mov bl,0
	lea si,num1
	lea di,pos1
	lea bp,neg1
	
x1:	cmp [si],bl
	jge x2
	mov al,[si]
	mov [bp],al
	inc bp
	inc si
	dec cl
	jnz x1
	jmp x3

x2:	mov al,[si]
	mov [di],al
	inc di
	inc si
	dec cl
	jnz x1

x3:	
.exit
end
