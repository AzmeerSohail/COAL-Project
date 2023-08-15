;Azmeer Sohail (21i-2977)
;Abdullah Masood (21i-0822)
; B

.model small
.stack 0100h
.data
;-------------------------------TITLE PAGE AND INSTRUCTIONS PAGE------------------------------------

saveMode BYTE ?
name1 db 10 dup(?)
Welcome_str db 'W','E','L','C', 'O','M','E', ' ','T', 'O', ' ', 'B', 'R','I','C','K', ' ', 'B','R','E','A','K','E','R'
Name_str db 'E','N','T','E','R', ' ', 'Y','O','U','R',' ','N','A','M','E',':'
Inst_str db 'W','E','L','C','O','M','E',' ','T','O',' ','I','N','S','T','R','U','C','T','I','O','N','S',':'
str2 db 'E','L','I','M','I','N','A','T','E',' ','A','L','L',' ','B','R','I','C','K','S',' ','A','T',' ','T','O','P','.'
str3 db 'G','A','M','E',' ','I','S',' ','S','P','L','I','T',' ','I','N','T','O',' ','M','A','N','Y',' ','L','E','V','E','L','S','.'
str4 db 'T','H','E','R','E',' ','W','I','L','L',' ','B','E',' ','A',' ','T','I','M','E',' ','L','I','M','I','T',' ','O','F',' ','4',' ','M','I','N','S','.'
str5 db 'R','E','M','A','I','N','I','N','G',' ','T','I','M','E',' ','I','S',' ','S','H','O','W','N',' ','O','N',' ','C','O','U','N','T','E','R','.'
str6 db 'A',' ','P','L','A','Y','E','R',' ','W','I','L','L',' ','H','A','V','E',' ','M','A','X','I','M','U','M',' ','3',' ','L','I','V','E','S','.'
str7 db 'E','V','E','R','Y',' ','T','I','M','E',' ','B','A','L','L',' ','H','I','T','S',' ','B','O','T','T','O','M',' ','E','N','C','L','O','S','U','R','E'
str8 db 'P','L','A','Y','E','R',' ','L','O','S','E','S',' ','A',' ','L','I','F','E','.'
x_coord db 8
y_coord db 5
x2_coord db 12
y2_coord db 5
x3_coord db 2
y3_coord db 1
X4_coord db 5
y4_coord db 1
x5_coord db 7
y5_coord db 1
X6_coord db 9
y6_coord db 1
x7_coord db 11
y7_coord db 1
x8_coord db 13
y8_coord db 1
x9_coord db 15
y9_coord db 1
x10_coord db 17
y10_coord db 1
count db 0
count2 db 0
count3 db 0
count4 db 0
count5 db 0
count6 db 0
count7 db 0
count8 db 0
count9 db 0
count10 db 0

;---------------------------------un movable bricks-----------------
br1 dw 5000
br2 dw 5000
br3 dw 5000
br4 dw 5000
br5 dw 5000
br6 dw 5000

;------------------------------------------MENU PAGE DATA------------------------------------------
welcome db "BRICK BREAKER GAME"
new_game  db "NEW GAME"
resume db "RESUME"
instruc_tions db "INSTRUCTIONS"
H_score db "High Score"
exit db "Exit"
coun dw 0
point dw 0
box_ary db 47,75, 110,145,173

;------------------------------------LEVEL PAGE DATA--------------------------------------------------------
score db ' ','S','C','O','R','E',':'
level_name db 'L','E','V','E','L',':','0','1'
x db 2
y db 30
counter db 0
x2 db 1
y2 db 12
counter2 db 0

level2_name db  'L','E','V','E','L',':','0','2' 
x3 db 1
y3 db 12
counter3 db 0
score2 db ' ','S','C','O','R','E',':'
x4 db 2
y4 db 30
counter4 db 0

score_3 db ' ','S','C','O','R','E',':'
x5 db 2
y5 db 30
counter6 db 0
level3_name db  'L','E','V','E','L',':','0','3' 
x6 db 1
y6 db 12
counter7 db 0

lives dw 3

count15 db 0
x_c db 0
y_c db 2

x2_c db 1
y2_c db 3
count16 db 0

x3_c db 2
y3_c db 4
count17 db 0

px dw 120
py dw 180
p_width dw 80
cox db 50
coy db 2
scorex db 37
scorey db 2
brick_count dw 30
score_count dw 0
level_no dw 1 
lx db 50
ly db 2
counters dw 0
hit_comp dw 1
ab dw 1

ballx dw 120
bally dw  160
flag dw 0
flag1 dw 0
hits dw 30 dup (0)
colors   dw  30 dup(04h)


p dw 1
q dw 1
r dw 1
s dw 1

;--------------------------------FILE DATA----------------------------------------------
file db "BrickBreaker.txt",0
file_address dw ?
buffer db 5000 dup("$")

;-------------------------------------Leader Board PAGE--------------------------------------------------------------
board  db 'L','E','A','D','E','R','B','O','A','R','D',':'
countes db 0
xc db 4
yc db 3

high_score db 'H','I','G','H',' ','S','C','O','R','E','S',':'
countes2 db 0
xc2 db 7
yc2 db 3

xc3 db 10
yc3 db 20
countes5 db 0
;------------------------WIN SCREEN DATA------------------------------------------
win_str db 'G','A','M','E',' ','O','V','E','R'
win db 'Y','O','U',' ','H','A','V','E',' ','W','O','N',' ','T','H','E',' ','G','A','M','E'
w_x db 5
w_y db 10
w_count db 0
w2_x db 12
w2_y db 10 
w2_count db 0
.code
jmp main

;--------------------------WIN SCREEN PROC-----------------------------------
win_screen proc
mov si,0
mov si, offset win_str
La1:

mov ah, 2
mov dh, w_x     ;row
mov dl, w_y      ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2       ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc w_count
inc w_y

cmp w_count,9
jne La1


mov si,0
mov si, offset win
La4:

mov ah, 2
mov dh, w2_x     ;row
mov dl, w2_y      ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2       ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc w2_count
inc w2_y

cmp w2_count,21
jne La4

ret
win_screen endp


;------------------------PRINT SCORE FUNCTION---------------------------------
print_score proc
OUTPUT:

;-------------------------------------------------------------------
mov dx, 0
	MOV AX, score_count
	MOV Bx, 10
	L1:
          mov dx, 0
		CMP Ax, 0
		JE DISP
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counters
		MOV AH, 0
		JMP L1

DISP:
         mov ah, 2
		mov dh, scorey; row/y
		mov dl, scorex;  col/x
		int 10h
		mov dx,0
	CMP counters, 0
	JE E
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counters
	inc scorex
	JMP DISP

E:
mov scorex,37
mov scorey,2

ret
print_score endp

;-------------------------------LEADER BOARD PROC-------------------------------------------
leader_board proc
mov si,0
mov si, offset board
La1:

mov ah, 2
mov dh, xc      ;row
mov dl, yc       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2       ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc countes
inc yc

cmp countes,12
jne La1

mov bl,10
mov cx, 22  ;x coordinate
mov dx, 40    ; y coordinate
mov al, 2      ; underline color

AS2:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 120
jne AS2

mov ah, 2
mov dh, 30                    ;row
mov dl, 30                     ;column
int 10h


mov si,0
mov si, offset high_score
La2:

mov ah, 2
mov dh, xc2      ;row
mov dl, yc2      ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b       ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc countes2
inc yc2

cmp countes2,12
jne La2

;---------------------------------Border--------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 3   ; y coordinate
mov al, 2    ; color

AS11:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne AS11


mov cx, 0
mov dx, 3
mov al, 2    ; color

AS12:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne AS12

mov cx, 0
mov dx, 190
mov al, 2            ; color

AS13:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne AS13

mov cx, 319
mov dx, 190
mov al, 2          ; color

AS14:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 3
jne AS14

ret 
leader_board endp


;---------------------------SOUND PROC-----------------------------------
sound proc
mov al, 182         ; Prepare the speaker for the
out 43h, al         ;  note.
mov ax, 4560        ; Frequency number (in decimal)
                                 ;for middle C.
out 42h, al         ; Output low byte.
mov al, ah          ; Output high byte.
out 42h, al
in al, 61h         ; Turn on note (get value from
                                ;port 61h).
or al, 00000011b   ; Set bits 1 and 0.
out 61h, al         ; Send new value.
mov bx, 2          ; Pause for duration of note.
pause1:
mov cx, 65535
pause2:
dec cx
jne pause2
dec bx
jne pause1
in al, 61h         ; Turn off note (get value from
                                ;port 61h).
and al, 11111100b   ; Reset bits 1 and 0.
out 61h, al         ; Send new value.
	
ret
sound endp


;------------------------------------------ball---------------------------------------------------

make_ball proc

push bp
mov bp,sp
sub sp,2


MOV CX, ballx   ;x-cordinate (column)
MOV DX, bally    ;y-cordinate (row) 
MOV AL, [bp+4]  ;yellow color


add dx,8
mov [bp-2],dx
mov dx,bally

mov bx,ballx
add bx,9



La1:

MOV AH, 0CH
INT 10H

inc cx
cmp cx, bx
jne La1

mov cx,ballx
inc dx
cmp dx,[bp-2]

jne La1

La2:

add sp,2
pop bp
ret 2
make_ball endp


;-----------------------------------------move ball------------------------------------

move_ball proc

B1: 
call paddle_move 



mov ax,0
push ax
mov ax,[colors+0]
push ax
mov ax,25
push ax
mov ax,20h
push ax
call brick1


mov ax,2
push ax
mov ax,[colors+2]
push ax
mov ax,70
push ax
mov ax,20h
push ax
call brick1


mov ax,4
push ax
mov ax,[colors+4]
push ax
mov ax,115
push ax
mov ax,20h
push ax
call brick1


mov ax,6
push ax
mov ax,[colors+6]
push ax
mov ax,160
push ax
mov ax,20h
push ax
call brick1

mov ax,8
push ax
mov ax,[colors+8]
push ax
mov ax,205
push ax
mov ax,20h
push ax
call brick1


mov ax,10
push ax
mov ax,[colors+10]
push ax
mov ax,255
push ax
mov ax,20h
push ax
call brick1

mov ax,12
push ax
mov ax,[colors+12]
push ax
mov ax,25
push ax
mov ax,30h
push ax
call brick1

mov ax,14
push ax
mov ax,[colors+14]
push ax
mov ax,70
push ax
mov ax,30h
push ax
call brick1

mov ax,16
push ax
mov ax,[colors+16]
push ax
mov ax,115
push ax
mov ax,30h
push ax
call brick1

mov ax,18
push ax
mov ax,[colors+18]
push ax
mov ax,160
push ax
mov ax,30h
push ax
call brick1

mov ax,20
push ax
mov ax,[colors+20]
push ax
mov ax,205
push ax
mov ax,30h
push ax
call brick1

mov ax,22
push ax
mov ax,[colors+22]
push ax
mov ax,255
push ax
mov ax,30h
push ax
call brick1

mov ax,24
push ax
mov ax,[colors+24]
push ax
mov ax,25
push ax
mov ax,40h
push ax
call brick1

mov ax,26
push ax
mov ax,[colors+26]
push ax
mov ax,70
push ax
mov ax,40h
push ax
call brick1


mov ax,28
push ax
mov ax,[colors+28]
push ax
mov ax,115
push ax
mov ax,40h
push ax
call brick1

mov ax,30
push ax
mov ax,[colors+30]
push ax
mov ax,160
push ax
mov ax,40h
push ax
call brick1

mov ax,32
push ax
mov ax,[colors+32]
push ax
mov ax,205
push ax
mov ax,40h
push ax
call brick1


mov ax,34
push ax
mov ax,[colors+34]
push ax
mov ax,255
push ax
mov ax,40h
push ax
call brick1

mov ax,36
push ax
mov ax,[colors+36]
push ax
mov ax,25
push ax
mov ax,50h
push ax
call brick1

mov ax,38
push ax
mov ax,[colors+38]
push ax
mov ax,70
push ax
mov ax,50h
push ax
call brick1

mov ax,40
push ax
mov ax,[colors+40]
push ax
mov ax,115
push ax
mov ax,50h
push ax
call brick1

mov ax,42
push ax
mov ax,[colors+42]
push ax
mov ax,160
push ax
mov ax,50h
push ax
call brick1

mov ax,44
push ax
mov ax,[colors+44]
push ax
mov ax,205
push ax
mov ax,50h
push ax
call brick1

mov ax,46
push ax
mov ax,[colors+46]
push ax
mov ax,255
push ax
mov ax,50h
push ax
call brick1

mov ax,48
push ax
mov ax,[colors+48]
push ax
mov ax,25
push ax
mov ax,60h
push ax
call brick1

mov ax,50
push ax
mov ax,[colors+50]
push ax
mov ax,70
push ax
mov ax,60h
push ax
call brick1

mov ax,52
push ax
mov ax,[colors+52]
push ax
mov ax,115
push ax
mov ax,60h
push ax
call brick1

mov ax,54
push ax
mov ax,[colors+54]
push ax
mov ax,160
push ax
mov ax,60h
push ax
call brick1

mov ax,56
push ax
mov ax,[colors+56]
push ax
mov ax,205
push ax
mov ax,60h
push ax
call brick1

mov ax,58
push ax
mov ax,[colors+58]
push ax
mov ax,255
push ax
mov ax,60h
push ax
call brick1


mov ah,1
int 16h
.if(al==27)
call clear_screen
jmp Bout
.endif


mov ax,00h
push ax
call make_ball


cmp flag,1
je B
A:
dec bally
cmp bally,25
mov ax,0
mov flag,ax
je B
jmp CONTE
B:
inc bally

mov ax,px
add ax,p_width
mov bx,ax
mov ax,px
mov cx,py
sub cx,6
.IF (ballx>=ax && ballx<=bx && bally==cx)
mov ax,1
mov flag,ax
.ELSEIF(bally==180)
jmp Bin
.ELSE
mov ax,1
mov flag,ax
.ENDIF

je A

CONTE:


cmp flag1,1
je D
Ce:
dec ballx
cmp ballx,2

mov ax,0
mov flag1,ax
je D
jmp Bstart
D:
inc ballx
cmp ballx,310
mov ax,1
mov flag1,ax
je Ce


Bstart:

mov ax,04h
push ax
call make_ball
;----------------------------------------un necessary----------------------

;-------------------------------------printing score----------------------
call print_score


mov cx,1000
L2:

LOOP  L2

jmp B1



Bout:
call menu


Bin:
dec lives
ret
move_ball endp

;--------------------------------------ASSIGNING COLORS---------------------------------------
assign_colors proc
mov [colors+0],04
mov [colors+2],01
mov [colors+4],15
mov [colors+6],14
mov [colors+8],5
mov [colors+10],1
mov [colors+12],1
mov [colors+14],4
mov [colors+16],1
mov [colors+18],15
mov [colors+20],14
mov [colors+22],5
mov [colors+24],5
mov [colors+26],1
mov [colors+28],4
mov [colors+30],1
mov [colors+32],15
mov [colors+34],14
mov [colors+36],14
mov [colors+38],5
mov [colors+40],1
mov [colors+42],4
mov [colors+44],1
mov [colors+46],15
mov [colors+48],15
mov [colors+50],14
mov [colors+52],5
mov [colors+54],1
mov [colors+56],4
mov [colors+58],1
ret
assign_colors endp

;------------------------BRICK MAKING FUNCTION------------------------------------------------
brick1 proc
mov p,1
mov q,1
mov r,1
mov s,1
push bp
mov bp,sp 
mov si,[bp+10]
;; y bp+4   ; x bp+6
mov cx,[bp+6]       ; inital x coordniate(column)
mov dx,[bp+4]         ; intial y coordinate(row)


ROW1_B1:
		
mov ah,0ch                   ; for writing the pixel
mov bh,00h                    ; page number
mov al,[bp+8]              ; red coloured pixel
int 10h 

inc cx                          ;move to next column
mov ax,cx
sub ax,[bp+6]
cmp ax,26                  ;width
jng ROW1_B1

mov cx,[bp+6]           ; cx reset to original value
inc dx                           ; next line
mov ax,dx
sub ax,[bp+4]
cmp ax,8             ;height
jng ROW1_B1	

;------------------------bricks not to be broken----------------------------
.IF(si==br1|| si==br2  || si==br3 || si==br4 || si==br5 || si==br6 )
mov ax,5000
mov hit_comp,ax
.ELSE
mov ax,ab
mov hit_comp,ax
.ENDIF

;upper side of brick
mov bx,[bp+6]
add bx,26
mov ax,[bp+6]
mov dx,[bp+4]
.IF (ballx>=ax && ballx<=bx && bally==dx)
inc [hits+si]

;score_count incrementer
.IF (hit_comp!=5000)
.IF ([colors+si]==5)
mov ax,1
add score_count,ax
.ELSEIF ([colors+si]==14)
mov ax,2
add score_count,ax
.ELSEIF([colors+si]==1)
mov ax,3
add score_count,ax
.ELSEIF([colors+si]==15)
mov ax,4
mov score_count,ax
.ELSEIF([colors+si]==4)
mov ax,5
add score_count,ax
.ENDIF
.ENDIF


cmp [colors+si],0
je skip1
mov flag,0
skip1:
mov ax,hit_comp
.IF ([hits+si]==ax)
.IF (p==1)
dec brick_count
inc p
call sound
.ENDIF
mov [colors+si],0
.ENDIF
jmp CONTINUE

.ENDIF



;lower side of brick
mov ax,[bp+6]
mov bx,[bp+6]
add bx,26
mov dx,[bp+4]
add dx,8
.IF (ballx>=ax && ballx<=bx && bally==dx)

inc [hits+si]

.IF (hit_comp!=5000)
.IF ([colors+si]==5)
mov ax,1
add score_count,ax
.ELSEIF ([colors+si]==14)
mov ax,2
add score_count,ax
.ELSEIF([colors+si]==1)
mov ax,3
add score_count,ax
.ELSEIF([colors+si]==15)
mov ax,4
add score_count,ax
.ELSEIF([colors+si]==4)
mov ax,5
add score_count,ax
.ENDIF

.ENDIF

cmp [colors+si],0
je skip2
mov flag,1
skip2:
mov ax,hit_comp
.IF ([hits+si]==ax)
.IF (q==1)
dec brick_count
inc q
call sound
.ENDIF
mov [colors+si],0
.ENDIF
jmp CONTINUE
.ENDIF




;right side of brick
mov ax,[bp+4]
mov bx,[bp+4]
add bx,8
mov dx,[bp+6]
add dx,26
.IF (bally>=ax && bally<=bx && ballx==dx)
inc [hits+si]
.IF (hit_comp!=5000)
.IF ([colors+si]==5)
mov ax,1
add score_count,ax
.ELSEIF ([colors+si]==14)
mov ax,2
add score_count,ax
.ELSEIF([colors+si]==1)
mov ax,3
add score_count,ax
.ELSEIF([colors+si]==15)
mov ax,4
mov score_count,ax
.ELSEIF([colors+si]==4)
mov ax,5
add score_count,ax
.ENDIF

.ENDIF

cmp [colors+si],0
je skip3
mov flag1,1
skip3:
mov ax,hit_comp
.IF ([hits+si]==ax)
.IF (r==1)
dec brick_count
inc r
call sound
.ENDIF
mov [colors+si],0
.ENDIF
jmp CONTINUE
.ENDIF



;left side of brick
mov ax,[bp+4]
mov bx,[bp+4]
add bx,8
mov dx,[bp+6]
mov cx,bally
add cx,9
.IF (cx>=ax && cx<=bx && ballx==dx)
inc [hits+si]

.IF (hit_comp!=5000)

.IF ([colors+si]==5)
mov ax,1
add score_count,ax

.ELSEIF ([colors+si]==14)
mov ax,2
add score_count,ax
.ELSEIF([colors+si]==1)
mov ax,3
add score_count,ax
.ELSEIF([colors+si]==15)
mov ax,4
add score_count,ax
.ELSEIF([colors+si]==4)
mov ax,5
add score_count,ax
.ENDIF

.ENDIF

cmp [colors+si],0
je skip4
mov flag1,0
skip4:
mov ax,hit_comp
.IF ([hits+si]==ax)
.IF (s==1)
dec brick_count
inc s
call sound
.ENDIF
mov [colors+si],0
.ENDIF
jmp CONTINUE
.ENDIF

CONTINUE:

pop bp
ret 8
brick1 endp


;----------------------------------------CLEAR SCREEN FUNCTION------------------------------------------------
clear_screen proc
mov ax,13h
int 10h
ret 
clear_screen endp


;----------------------------------------------PRINT SCREEN FUNCTION----------------------------------
print_str proc 
push bp 
mov bp,sp

l1:
mov ax,0
;setting cursor position
mov ah, 2
mov dh, [bp+6]; row/y
mov dl, [bp+4];  col/x
int 10h

mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,[bp+8]   ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc coun

mov ax,[bp+4]
add ax,1

mov [bp+4],ax
mov ax,[bp+10]

cmp coun,ax
jne l1

pop bp
mov coun,0
ret 8
print_str endp


;-------------------------------------------block making function------------------------------
make_block proc
push bp
mov bp,sp
;;;

MOV CX, [bp+4]   ;x-cordinate (column)
MOV DX, [bp+6]    ;y-cordinate (row)
MOV AL, 1111b  ;yellow color

mov bx,[bp+4]
add bx,102
La1:
MOV AH, 0CH
INT 10H

inc cx
cmp cx, bx
jne La1

mov bx,[bp+6]
add bx,22
L2:

MOV AH, 0CH
INT 10H

inc dx
cmp dx, bx
jne L2


L3:

MOV AH, 0CH
INT 10H

dec cx
cmp cx, [bp+4]
jne L3


L4:
MOV AH, 0CH
INT 10H
dec dx
cmp dx,[bp+6]
jne L4

;;;;;
pop bp
ret 4
make_block endp



;-----------------------------------------menu--------------------------------------------

menu proc

call clear_screen
mov ax,0
mov si,point
mov al,[box_ary+si]              ;row
push ax
mov ax,115                ;col
push ax
call make_block


mov si,offset welcome
mov ax, lengthof welcome
push ax
mov ax, 1111b 
push ax
mov ax,2; y/row
push ax
mov ax,170 ;x/col
push ax
call print_str


mov si,offset new_game
mov ax, lengthof new_game
push ax
mov ax, 2 
push ax
mov ax,6; y/row
push ax
mov ax,175 ;x/col
push ax
call print_str


mov si,offset resume
mov ax, lengthof resume
push ax
mov ax, 2
push ax
mov ax,10; y/row
push ax
mov ax,175 ;x/col
push ax
call print_str


mov si,offset instruc_tions
mov ax, lengthof instruc_tions
push ax
mov ax, 2 
push ax
mov ax,14; y/row
push ax
mov ax,175 ;x/col
push ax
call print_str


mov si,offset H_score
mov ax, lengthof H_score
push ax
mov ax, 2 
push ax
mov ax,18; y/row
push ax
mov ax,175 ;x/col
push ax
call print_str


mov si,offset exit
mov ax, lengthof exit
push ax
mov ax, 2 
push ax
mov ax,22; y/row
push ax
mov ax,175 ;x/col
push ax
call print_str



mov ah, 2
mov dh, 20; row/y
mov dl, 0;  col/x
int 10h

mov ax,0
ret
menu endp



Instructions proc
; Wait for a keystroke.
;mov ah,0
;int 16h

; Restore the starting video mode.
mov ah,0 ; set video mode
mov al,saveMode ; saved video mode
int 10h


mov ah, 0      ;video mode
mov al, 13H      ; 80x25 (text mode)  
int 10h


;------------------------------------------Instructions page --------------------------------------
mov si,0
mov si,offset Inst_str

AS1:
mov ah, 2
mov dh, x3_coord      ;row
mov dl, y3_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2   ;text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count3
inc y3_coord

cmp count3,24
jne AS1

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h


mov bl,10
mov cx, 7   ;x coordinate
mov dx, 25    ; y coordinate
mov al, 2      ; underline color

AS2:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 197
jne AS2


mov si,0
mov si,offset str2
AS3:
mov ah, 2
mov dh, x4_coord      ;row
mov dl, y4_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b       ; Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count4
inc y4_coord

cmp count4,28
jne AS3

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h


mov si,0
mov si,offset str3
AS4:
mov ah, 2
mov dh, x5_coord      ;row
mov dl, y5_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b         ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count5
inc y5_coord

cmp count5,31
jne AS4

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h


mov si,0
mov si,offset str4
AS5:
mov ah, 2
mov dh, x6_coord      ;row
mov dl, y6_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b         ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count6
inc y6_coord

cmp count6,37
jne AS5

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h

mov si,0
mov si,offset str5
AS6:
mov ah, 2
mov dh, x7_coord      ;row
mov dl, y7_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b        ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count7
inc y7_coord

cmp count7,35
jne AS6

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h


mov si,0
mov si,offset str6
AS8:
mov ah, 2
mov dh, x8_coord      ;row
mov dl, y8_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b        ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count8
inc y8_coord

cmp count8,35
jne AS8

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h


mov si,0
mov si,offset str7
AS9:
mov ah, 2
mov dh, x9_coord      ;row
mov dl, y9_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count9
inc y9_coord

cmp count9,37
jne AS9

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h

mov si,0
mov si,offset str8
AS10:
mov ah, 2
mov dh, x10_coord      ;row
mov dl, y10_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count10
inc y10_coord

cmp count10,20
jne AS10

mov ah, 2
mov dh, 100     ;row
mov dl, 0     ;column
int 10h


;---------------------------------Border--------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 3   ; y coordinate
mov al, 2    ; color

AS11:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne AS11


mov cx, 0
mov dx, 3
mov al, 2    ; color

AS12:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne AS12

mov cx, 0
mov dx, 190
mov al, 2            ; color

AS13:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne AS13

mov cx, 319
mov dx, 190
mov al, 2          ; color

AS14:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 3
jne AS14
ret
Instructions endp


;--------------------------------------TITLE PAGE--------------------------------------------------------------
title_page proc
;setting cursor position
mov si,0
mov si,offset Welcome_str

A1:
mov ah, 2
mov dh, x_coord      ;row
mov dl, y_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count
inc y_coord

cmp count,24
jne A1

mov ah, 2
mov dh, 12                    ;row
mov dl, 8                     ;column
int 10h

mov si,0
mov si,offset Name_str
A2:
mov ah, 2
mov dh, x2_coord      ;row
mov dl, y2_coord       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,2       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count2
inc y2_coord

cmp count2,16
jne A2

;---------------------------------Border--------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 5    ; y coordinate
mov al, 2      ; color

A3:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 320
jne A3

mov cx, 0
mov dx, 5
mov al, 2       ;color

A4:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne A4

mov cx, 0
mov dx, 190
mov al, 2       ;color

A5:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne A5

mov cx, 319
mov dx, 190
mov al, 2           ;color

A6:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 5
jne A6


;-------------------------------------------pixels-----------------------------------------------

mov cx, 10
mov dx, 10
mov al, 1111b
pixel:
mov ah,0ch
int 10h
add dx,10
cmp dx,190
jne pixel

mov cx, 20
mov dx, 10
mov al, 1111b
pixel2:
mov ah,0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel2


mov cx, 30
mov dx, 10
mov al, 1111b
pixel3:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel3

mov cx, 40
mov dx, 10
mov al,1111b
pixel4:
mov ah, 0Ch
int 10h
add dx, 10
cmp dx, 190
jne pixel4

mov cx,50
mov dx,10
mov al,1111b
pixel5:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel5

mov cx,60
mov dx,10
mov al,1111b
pixel6:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel6

mov cx,70
mov dx,10
mov al,1111b
pixel7:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel7

mov cx,80
mov dx,10
mov al,1111b
pixel8:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel8

mov cx,90
mov dx,10
mov al,1111b
pixel9:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel9

mov cx,100
mov dx,10
mov al,1111b
pixel10:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel10

mov cx,110
mov dx,10
mov al,1111b
pixel11:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel11

mov cx,120
mov dx,10
mov al,1111b
pixel12:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel12

mov cx,130
mov dx,10
mov al,1111b
pixel13:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel13

mov cx,140
mov dx,10
mov al,1111b
pixel14:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel14

mov cx,150
mov dx,10
mov al,1111b
pixel15:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel15

mov cx,160
mov dx,10
mov al,1111b
pixel16:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel16

mov cx,170
mov dx,10
mov al,1111b
pixel17:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel17

mov cx,180
mov dx,10
mov al,1111b
pixel18:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel18

mov cx,190
mov dx,10
mov al,1111b
pixel19:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel19

mov cx,200
mov dx,10
mov al,1111b
pixel20:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel20

mov cx,210
mov dx,10
mov al,1111b
pixel21:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel21

mov cx,220
mov dx,10
mov al,1111b
pixel22:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel22

mov cx,230
mov dx,10
mov al,1111b
pixel23:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel23

mov cx,240
mov dx,10
mov al,1111b
pixel24:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel24

mov cx,250
mov dx,10
mov al,1111b
pixel25:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel25

mov cx,260
mov dx,10
mov al,1111b
pixel26:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel26

mov cx,270
mov dx,10
mov al,1111b
pixel27:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel27

mov cx,280
mov dx,10
mov al,1111b
pixel28:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel28

mov cx,290
mov dx,10
mov al,1111b
pixel29:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel29

mov cx,300
mov dx,10
mov al,1111b
pixel30:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel30

mov cx,310
mov dx,10
mov al,1111b
pixel31:
mov ah, 0ch
int 10h
add dx, 10
cmp dx, 190
jne pixel31



;-------------------------------------------INPUT name-------------------------------------------
mov ah,2
mov dh, 12    ; row
mov dl, 21   ;column
int 10h

mov si,0
mov si, offset name1
mov cx,6
Loop1:
mov bx, [si]
mov ah, 3fh
int 21h
inc si
inc dl

mov ah,0
int 16h
cmp ah,28
call sound
je L_2


jmp Loop1

L_2:
mov file_address,ax
mov cx,0
mov dx,0
mov ah,42h
mov al,0
int 21h

mov ah,40h
mov bx, file_address
mov cx,6
mov dx, offset name1
int 21h

ret

title_page endp



;----------------------------------------DRAW PADDLES FUNCTION------------------------------------
make_paddle proc 

push bp
mov bp,sp
sub sp,2
MOV CX, [bp+4]   ;x-cordinate (column)
MOV DX, [bp+6]    ;y-cordinate (row)
MOV AL,   [bp+8]  ;color

add dx,4
mov [bp-2],dx
mov dx,[bp+6]

mov bx,[bp+4]
add bx,p_width


La1:

MOV AH, 0CH
INT 10H

inc cx
cmp cx, bx
jne La1

mov cx,[bp+4]
add dx,1
cmp dx,[bp-2]

jne La1
jmp La2
La2:
add sp,2
pop bp
ret 6

make_paddle endp


paddle_move proc            ;paddle and border
P1: 
mov ax,0Fh
push ax
mov ax,py          ;y/row
push ax
mov ax,px        ;x/col
push ax
call make_paddle

 mov ah,1
 int 16h
 jz Pout

 mov ah,0
 int 16h


cmp ah,4Bh   ; left
je Pleft

cmp ah,4Dh ;right
je Pright
jmp Pout

Pleft:

mov ax,00h
push ax
mov ax,py          ;y/row
push ax
mov ax,px        ;x/col
push ax
call make_paddle


cmp px,4
jne P3
jmp P4 
P3:
mov ax,px
sub ax,4
mov px,ax
jmp P1

Pright:

mov ax,00h
push ax
mov ax,py          ;y/row
push ax
mov ax,px        ;x/col
push ax
call make_paddle


cmp px,256
jne P5
jmp P4 
P5:
mov ax,px
add ax,4
mov px,ax
P4:

Pout:
ret
paddle_move endp



;-----------------------------------------------LEVEL 1------------------------------------------------------


make_heart proc
push bp
mov bp,sp

A_2:
mov ah, 2
mov dh, x_c      ;row
mov dl, y_c       ;column
int 10h
mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,4       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count15
inc y_c

mov al,[bp+4]
cmp count15,al
jne A_2


pop bp
ret 2
make_heart endp


make_heart2 proc
push bp
mov bp,sp

A_2:
mov ah, 2
mov dh, x2_c      ;row
mov dl, y2_c       ;column
int 10h
mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,4       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count16
inc y2_c

mov al,[bp+4]
cmp count16,al
jne A_2

pop bp
ret 2
make_heart2 endp


make_heart1 proc
push bp
mov bp,sp

A_2:
mov ah, 2
mov dh, x3_c      ;row
mov dl, y3_c       ;column
int 10h
mov al,3    ;ASCII code of Character 
mov bx,0
mov bl,4       ;Text color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc count17
inc y2_c

mov al,[bp+4]
cmp count17,al
jne A_2

pop bp
ret 2
make_heart1 endp



level proc
;-----------------------------------------BACKGROUND COLOR-----------------------------------------------
mov ah, 06h
mov al, 0
mov cx, 0
mov dh, 24
mov dl, 80
mov bh, 0
int 10h

MOV AH,02H
MOV BX,0
MOV DH, 150 ;Row Number
MOV DL, 150 ;Column Number
INT 10H


mov ah, 06h
mov al, 0
mov bh, 2     ;color
mov ch, 0     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 2     ;Bottom row of window
mov dl, 100     ;Right most column of window
int 10h



mov si,offset score
Lab_1:

mov ah, 2
mov dh, x      ;row
mov dl, y       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;white color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter
inc y

cmp counter,7
jne Lab_1



mov si,offset level_name
l_s4:
mov ah, 2
mov dh, x2      ;row
mov dl, y2       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter2
inc y2

cmp counter2,8
jne l_s4

mov ah, 2
mov dh, 120                    ;row
mov dl, 8                     ;column
int 10h


;---------------------------------Border-----------------------------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 5    ; y coordinate
mov al, 2      ; color

Ab3:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 320
jne Ab3

mov cx, 0
mov dx, 5
mov al, 2       ;color

Ab4:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne Ab4

mov cx, 0
mov dx, 190
mov al, 2       ;color

Ab5:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne Ab5

mov cx, 319
mov dx, 190
mov al, 2           ;color

Ab6:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 5
jne Ab6


.while (lives>0)
call assign_colors
.IF (lives==3)
.if(brick_count==1)
jmp ex
.endif
mov p_width,60
mov ax,3
push ax
call make_heart
call intialize_hit
call print_score
mov ax,0
call move_ball
.if(brick_count==1)
call level2
.endif

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif


.ELSEIF(lives==2)
mov p_width,60
mov ax,2
push ax
call make_heart2
;call intialize_hit
call print_score
mov ax,0
call move_ball

.if(brick_count==1)
call level2
.endif

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif

.ELSEIF (lives==1)
mov p_width,60
mov ax,1
push ax
call make_heart1
;call intialize_hit
call print_score
mov ax,0
call move_ball

.if(brick_count==1)
call level2
.endif
.ELSE 

.ENDIF



mov ballx,120
mov bally,110
.ENDW

ex:
ret

level endp


intialize_hit proc
mov si,0
mov cx,30
l:
mov [hits+si],0
inc si 
inc si
LOOP l
ret
intialize_hit endp



level2 proc
mov lives,3
;-----------------------------------------BACKGROUND COLOR-----------------------------------------------
mov ah, 06h
mov al, 0
mov cx, 0
mov dh, 24
mov dl, 80
mov bh, 0
int 10h

MOV AH,02H
MOV BX,0
MOV DH, 150 ;Row Number
MOV DL, 150 ;Column Number
INT 10H


mov ah, 06h
mov al, 0
mov bh, 2     ;color
mov ch, 0     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 2     ;Bottom row of window
mov dl, 100     ;Right most column of window
int 10h



mov si,offset score
Lab_5:

mov ah, 2
mov dh, x4      ;row
mov dl, y4       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;white color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter4
inc y4

cmp counter4,7
jne Lab_5



mov si,offset level2_name
l_s7:
mov ah, 2
mov dh, x3      ;row
mov dl, y3       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter3
inc y3

cmp counter3,8
jne l_s7

mov ah, 2
mov dh, 120                    ;row
mov dl, 8                     ;column
int 10h


;---------------------------------Border-----------------------------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 5    ; y coordinate
mov al, 2      ; color

Ab10:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 320
jne Ab10

mov cx, 0
mov dx, 5
mov al, 2       ;color

Ab11:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne Ab11

mov cx, 0
mov dx, 190
mov al, 2       ;color

Ab12:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne Ab12

mov cx, 319
mov dx, 190
mov al, 2           ;color

Ab13:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 5
jne Ab13


.while (lives>0)
call assign_colors
.IF (lives==3)
mov score_count,0
mov p_width,40
mov ax,3
push ax
call make_heart
call intialize_hit
call print_score
mov ax,0
call move_ball

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif

.ELSEIF(lives==2)

mov p_width,40
mov ax,2
push ax
call make_heart2
call intialize_hit
call print_score
mov ax,0
call move_ball

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif

.ELSEIF (lives==1)

mov p_width,40
mov ax,1
push ax
call make_heart1
call intialize_hit
call print_score
mov ax,0
call move_ball
.ELSE 

.ENDIF



mov ballx,120
mov bally,110
.ENDW

ex:
ret

level2 endp



level3 proc
mov lives,3
;-----------------------------------------BACKGROUND COLOR-----------------------------------------------
mov ah, 06h
mov al, 0
mov cx, 0
mov dh, 24
mov dl, 80
mov bh, 0
int 10h

MOV AH,02H
MOV BX,0
MOV DH, 150 ;Row Number
MOV DL, 150 ;Column Number
INT 10H


mov ah, 06h
mov al, 0
mov bh, 2     ;color
mov ch, 0     ;top row of window
mov cl, 0     ;left most column of window
mov dh, 2     ;Bottom row of window
mov dl, 100     ;Right most column of window
int 10h



mov si,offset score_3
Lab_6:

mov ah, 2
mov dh, x5      ;row
mov dl, y5       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;white color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter6
inc y5

cmp counter6,7
jne Lab_6



mov si,offset level3_name
l_s8:
mov ah, 2
mov dh, x6      ;row
mov dl, y6       ;column
int 10h
mov al,[si]    ;ASCII code of Character 
mov bx,0
mov bl,1111b   ;Green color
mov cx,1       ;repetition count

mov ah,09h
int 10h

inc si
inc counter7
inc y6

cmp counter7,8
jne l_s8

mov ah, 2
mov dh, 120                    ;row
mov dl, 8                     ;column
int 10h


;---------------------------------Border-----------------------------------------------------------------
mov bl,10
mov cx, 0   ;x coordinate
mov dx, 5    ; y coordinate
mov al, 2      ; color

Ab10:
mov ah, 0Ch
int 10h

inc cx
cmp cx, 320
jne Ab10

mov cx, 0
mov dx, 5
mov al, 2       ;color

Ab11:
mov ah, 0Ch
int 10h
inc dx
cmp dx, 190
jne Ab11

mov cx, 0
mov dx, 190
mov al, 2       ;color

Ab12:
mov ah, 0Ch
int 10h
inc cx
cmp cx, 320
jne Ab12

mov cx, 319
mov dx, 190
mov al, 2           ;color

Ab13:
mov ah, 0Ch
int 10h
dec dx
cmp dx, 5
jne Ab13


.while (lives>0)
call assign_colors
.IF (lives==3)
mov score_count, 0
mov br1, 0
mov br2, 6
mov br3, 10
mov br4, 20
mov br5, 30
mov p_width,40
mov ax,3
push ax
call make_heart
call intialize_hit
call print_score
mov ax,0
call move_ball

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif

.ELSEIF(lives==2)
mov score_count, 0
mov br1, 0
mov br2, 6
mov br3, 10
mov br4, 20
mov br5, 30
mov p_width,40
mov ax,2
push ax
call make_heart2
call intialize_hit
call print_score
mov ax,0
call move_ball

mov ah, 1
int 16h
.if(al==27)
jmp ex
.endif

.ELSEIF (lives==1)
mov score_count, 0
mov br1, 0
mov br2, 6
mov br3, 10
mov br4, 20
mov br5, 30
mov p_width,40
mov ax,1
push ax
call make_heart1
call intialize_hit
call print_score
mov ax,0
call move_ball
.ELSE 

.ENDIF



mov ballx,120
mov bally,110
.ENDW

ex:
ret

level3 endp



;-------------------------------------------------main---------------------------------------------
main proc

mov ax,@data
mov ds,ax
mov ax,0
mov bx,0


;-------------------Create file------------------------------------
mov ah,3ch
mov cl, 0
mov dx, offset file
int 21h


mov ah,0Fh
int 10h
mov saveMode,al

;video mode (graphic)
mov ah, 0      ;video mode
mov al, 13h      ; 80x25 (text mode)  
int 10h

call title_page

call clear_screen

call menu
;--------------------------OPEN FILE---------------------------------------------------------
mov ah,3DH
mov al,2
mov dx, offset file
int 21h

;---------------------------WRITE INTO FILE-----------------------------------
mov file_address,ax
mov cx,0
mov dx,0
mov ah,42h
mov al,0
int 21h

mov ah,40h
mov bx, file_address
mov cx,8
mov dx, offset level_name
int 21h

mov ah,40h
mov bx, file_address
mov cx,6
mov dx, offset score
int 21h

mov ah,40h
mov bx, file_address
mov cx,6
mov dx, offset name1
int 21h



Label1: 
 mov ah,0
 int 16h
 
cmp ah,28   ;enter

je outer
cmp ah,48h   ; up

je up
cmp ah,050h ;down
je down
jmp Label1

up:
call sound
call clear_screen


cmp point,0
jne ELS
mov point,4
jmp cont

ELS:
dec point

CONT:
call menu
jmp Label1

down:
call sound
call clear_screen

cmp point,4
jne ELS2

mov point,0
jmp CONT2
ELS2:
inc point

CONT2:
call menu
jmp Label1

outer:
call clear_screen
cmp point,2
jne LELSE
LIF:

call INSTRUCTIONS

mov ah,0
int 16h
.if(al==27)
call sound
call menu
.endif

LELSE:
cmp point,4
jne cont3
L_IF:
call clear_screen

cont3:
cmp point,0
jne cont4
LIF2:
call level

;call level2

cont4:
cmp point,3
jne cont5

L_IF3:
call leader_board
mov ah,0
int 16h
.if(al==27)  
call sound 
call menu
.endif

cont5:
cmp point,1
jne cont6
L_IF4:
call level2

;call level3



cont6:
mov ah, 4ch
int 21h


main endp
end