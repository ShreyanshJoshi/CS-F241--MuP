;Write an ALP that does the following - 

;1. Open file fil1.txt (file uploaded with question)
;2. The character number from which you read is the number of vowels in your first name – for e.g. if your first name is anupama – number of vowels is 4 and you 
;       will start reading from character no. 4 counting from character 0

;3. The number of characters that must be read depends on the number of characters in your first – for e.g. if your first name is anupama – number of characters 
;       to be read is 7
;4.Once the characters have been read, they must be displayed.
;5.The row number and column number where the characters must be displayed depends on your date of birth and month for e.g. if you were born on 16th August – 
;       the column number from which the display starts will be 16 and the row number will be 08

;6. The foreground color depends on your id number if your id is 2018AAPS0928G – then take the value 09 and add 4 = 13d for to it the foreground color must be
;	    bright magenta – pl refer to table below for foreground colors. Back ground color is black and no blinking.

;7. The display should continue until the blocking function key is pressed. The blocking function key again depends again on your id no. For e.g. if your id number 
;	    is 2018AAPS0928G. Then blocking function must be ‘8’

.model tiny
.486
.data
	fname db 'fil1.txt',0
	handle dw ?
	dat1 db 10 dup('$')								; no of characters in name + 1
	curr db ?
	
.code
.startup

	mov ah,3dh
	mov al,02h			
	lea dx,fname
	int 21h
	mov handle,ax
	
	mov ah,42h										; moving the file pointer (relative to beginning of file)
	mov al,0
	mov bx,handle
	mov cx,0
	mov dx,2										; no of bytes to move = no of vowels in 1st name	
	int 21h
	
	mov ah,3fh										; reading the file
	mov bx,handle
	mov cx,9										; no of bytes to read
	lea dx,dat1										; what is read is stored here (dat1)
	int 21h
	
	mov		ah,0fh									; GET the video mode
	int		10h
	mov		curr,al									;save the current mode in location curr

	mov		ah,00									; SET the display mode - text mode. 80x25. 16 colours. 8 pages
	mov		al,03h									
	int		10h

	mov     ah,02H               					; Set cursor position
	mov     dl,13									; Column
	mov     dh,04									; Row
	mov     bh,0                  					; usually 0
	int     10H

	lea 	si,dat1
	mov 	di,01h

x2:	mov		ah,09h									;function to display character
	mov		al,[si]									;character to be displayed 
	mov		cx,1									;no of times to write the character
	mov		bh,0									;page 0 is where the display takes place
	mov		bl,0000100b
	int 	10h
	
	inc 	dl									
	mov     ah,02H               					; moving the cursor ahead, to avoid overwriting the same position
	mov     dh,04									; row remains same, increase column by 1
	mov     bh,0                  
	int     10H	
	
	inc 	si
	inc 	di
	cmp 	di,10
	jne 	x2

	mov     ah,07h
x1: int     21h
	cmp     al,'7'
	jnz     x1		   	;blocking function - same as single input with 
						;with no echo - % is used to come out of the screen
	mov		ah,00		; SET the display mode as it was before
	mov		al,curr
	int		10h
.exit
end
