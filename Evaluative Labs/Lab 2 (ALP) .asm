; Two n character strings are stored in locations dat1 and  dat2. Write an ALP that will exchange the alternate characters of the two strings. 
; (0th, 2nd, 4th , 6th , 8th , 10th, 12th, 14th ). The value of n is stored in location cnt1. [You can assume that both strings will be of same size]

.model tiny
.486
.data
	dat1 db "abcdefghijklmno"
	dat2 db "ABCDEFGHIJKLMNO"
	cnt1 db 15
.code
.startup
	mov cl,cnt1
	lea si,dat1
	lea di,dat2
x1:	mov al,[di]
	mov bl,[si]
	mov [si],al
	mov [di],bl
	add si,2
	add di,2
	
	sub cl,2
	mov al,0
	cmp cl,al
	jg x1
	
.exit
end
