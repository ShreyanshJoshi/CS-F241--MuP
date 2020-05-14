;Write an ALP that will take display the following “Enter four character word ” and move the cursor to the next line. The user input of a four character string should
; be taken reversed and displayed.

;For e.g. - 
; If user enters stop what will be displayed on screen is pots. [Pl note the original string will not be displayed as the user enters it]
;The user should be allowed to enter only 4 characters (no enter allowed)

.model tiny
.486
.data
	string1 db "Enter four character word $"
	disn db 0dh,0ah,'$'
	i1 db 5
	i2 db ?
	i3 db 5 dup('$')
	pos db 5 dup('$')
.code
.startup
	lea dx,string1			; printing string 1
	mov ah,09h
	int 21h
		
	lea dx,disn				; printing next line
	mov ah,09h
	int 21h			
	
	lea di,pos
	add di,3
	
	mov cl,4
x1:	mov ah,08h				; need to take input char by char (w/o echo) should not be visible to user
	int 21h
	mov [di],al
	dec di	
	dec cl
	jnz x1
	
	lea dx,pos				; printing the required string
	mov ah,09h
	int 21h
.exit
end	
	