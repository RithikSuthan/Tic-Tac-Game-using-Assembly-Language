; multi-segment executable file template.

data segment
; add your data here!
r db 'Game Rules:$'   ;Rules
r1 db 'Player 1 will start$'
r2 db 'Player 1-"X" Player 2-"O"$'
r3 db 'Marked board cannot be filled$'
r4 db 'Enter cell number to place your mark$'
r5 db 'Set 3 of your marks horizontally,vertically or diagonally to win$'
r6 db 'Good Luck!$'    
var db '                      Start Your Game$'  
opt db "Enter no of matches to be played:$"  
moves db 0                      
cur db 88      
tkn db 'this cell is taken! press any key...$'    
emp db '                     $'
done db 0
dr db 0          
cou db 0
g db 'Game $'
m1 db '1).Tournament$'
m2 db '2).Single match $'
m3 db '3).Exit $'
m4 db 'Enter your choice: $'
pkey db "The game is over...$"
scard db 'Match result $'
pc1 db ' (X)$'              ;Players
pc2 db ' (O)$'  
win db 'Winner of the tounament is $'    
sf db 'Tournament is draw $'
;Board
l1 db '   |   |   $'
l2 db '-----------$'
n1 db ' | $'
;Cells
c1  db '1$'
c2  db '2$'                      
c3  db '3$'
c4  db '4$'
c5  db '5$'
c6  db '6$'
c7  db '7$'
c8  db '8$'                                                  
c9  db '9$'  
j db ':$'
xc db 0h
oc db 0h
tot db 10h

;Message
w1 db 'Player $'
w2 db ' won the game!$'
drw db 'The game is draw!$'                      
inp db 32, ':: enter cell no. : $'
tra db 'Want to play again? (y/n): $'                            
player db 49,'$'
t1 db  4,  4, 4,  4,  4, 32,  4, 32,  4,  4,  4,  4, 32, 32, 32,  4,  4,  4, 4,  4, 32, 32,  4,  4, 32, 32,  4, 4,  4,  4,  32, 32, 32,   4,  4, 4,  4,  4,  32, 32,  4,   4, 32, 32, 4, 4, 4, 4, '$'
t2 db 32, 32, 4, 32, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32,  4, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32 , 32, 32, 4, 32, 32,  32,  4, 32,  32,  4, 32, 4,'$'
t3 db 32, 32, 4, 32, 32, 32,  4, 32,  4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32,  4,  4,  4,  4, 32,  4, 32, 32, 32, 32, 32, 32 , 32, 32, 4, 32, 32,  32,  4, 32,  32,  4, 32, 4, 4, 4, 4,'$'
t4 db 32, 32, 4, 32, 32, 32,  4, 32,  4,  4,  4,  4, 32, 32, 32, 32, 32, 4, 32, 32, 32,  4, 32, 32,  4, 32,  4,  4,  4,  4, 32, 32, 32 , 32, 32, 4, 32, 32,  32, 32,  4,   4, 32, 32, 4, 4, 4, 4,'$'

wi db  32, 32, 32, 'wrong input! press any key...   $'
ends

stack segment
dw   128  dup(0)
ends

code segment
   
   
start:
; set segment registers:
mov ah,06h
mov bh,3ch
mov cx,0
mov dx,2584h
int 10h
mov ax,data
mov ds,ax
mov es,ax
titlescreen:;front page

mov dh, 6;row
mov dl, 14;col
mov bh, 0 ;page number
mov ah, 2
int 10h

lea dx, t1
mov ah, 9
int 21h

;set cursor
mov ah, 2
mov dh, 7
mov dl, 14
int 10h

lea dx, t2
mov ah, 9
int 21h

mov ah, 2
mov dh, 8
mov dl, 14
int 10h

lea dx, t3
mov ah, 9
int 21h

mov ah, 2
mov dh, 9
mov dl, 14
int 10h

lea dx, t2
mov ah, 9
int 21h

mov ah, 2
mov dh, 10
mov dl, 14
int 10h

lea dx, t4
mov ah, 9
int 21h

;logo display
mov ah, 7    
int 21h

; clear screen
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h

jmp rules

rules:
mov ah,06h  ;screen color
mov bh,7ch
mov cx,0
mov dx,2584h
int 10h
mov ah, 2
mov bh, 0            
mov dh, 6
mov dl, 7
int 10h

lea dx, r
mov ah, 9
int 21h

mov ah, 2
mov dh, 7
mov dl, 7
int 10h

lea dx, r1   ;rule 1
mov ah, 9
int 21h

mov ah, 2
mov dh, 8
mov dl, 7
int 10h

lea dx, r2   ;rule 2
mov ah, 9
int 21h

mov ah, 2
mov dh, 9
mov dl, 7
int 10h

lea dx, r3   ;rule 3
mov ah, 9
int 21h

mov ah, 2
mov dh, 10
mov dl, 7
int 10h

lea dx, r4   ;rule 4
mov ah, 9
int 21h

mov ah, 2
mov dh, 11
mov dl, 7
int 10h

lea dx, r5  ;rule 5
mov ah, 9
int 21h

mov ah, 2
mov dh, 12
mov dl, 7
int 10h

lea dx, r6  ;rule 6
mov ah, 9
int 21h

mov ah, 2
mov dh, 13
mov dl, 7
int 10h

mov ah, 2
mov dh, 15
mov dl, 7
int 10h
   
lea dx,var
mov ah,9
int 21h
   
mov ah,0h
int 16h
i1:        
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h

mov ah,06h
mov bh,7ch
mov cx,0
mov dx,2584h
int 10h
         
mov ah, 2
mov bh, 0
mov dh, 6
mov dl, 7
int 10h

mov ah, 2
mov dh, 7
mov dl, 7
int 10h

lea dx, m1
mov ah, 9
int 21h


mov ah, 2
mov dh, 8
mov dl, 7
int 10h
 
lea dx, m2
mov ah, 9
int 21h
 
mov ah, 2
mov dh, 9
mov dl, 7
int 10h
 
lea dx, m3
mov ah, 9
int 21h  

mov ah, 2
mov dh, 11
mov dl, 7
int 10h
     
lea dx, m4
mov ah, 9
int 21h  

mov ah,01
int 21h
sub al,30h
 
cmp al,32h
je ji        
 
cmp al,1
je init1

cmp al,2
je init2

cmp al,3
je exit

ji:
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
mov ah, 2
mov dh, 15
mov dl, 9
int 10h

lea dx,wi
mov ah,09
int 21h  
mov ah, 7
int 21h
jmp i1  


init2:
call init
jmp tryagain1

init1:

mov ah, 2
mov dh, 15
mov dl, 7
int 10h

lea dx,opt
mov ah,09h
int 21h
 

mov ah,01h
int 21h
sub al,30h
mov tot,al

mov cou,0
labk:
cmp al,0
je tryagain
call main
dec tot
mov al,tot
jmp labk

proc main
init:
inc cou

mov player, 50     ; initializing all variables
mov moves, 0
mov done, 0
mov dr, 0

mov c1, 49
mov c2, 50
mov c3, 51
mov c4, 52
mov c5, 53
mov c6, 54
mov c7, 55
mov c8, 56
mov c9, 57

jmp plrchange


 
victory:

lea dx, w1
mov ah, 9
int 21h

cmp player,49
je v

cmp player,50
je v1





v:      
inc xc
lea dx, player
mov ah, 9
int 21h
lea dx, w2
mov ah, 9
int 21h


mov ah, 2
mov dh, 17
mov dl, 28
int 10h

lea dx, pkey
mov ah, 9
int 21h

mov ah, 2
mov dh, 18
mov dl, 30
int 10h

lea dx, scard
mov ah, 9
int 21h
       
mov ah, 2
mov dh, 19
mov dl, 30
int 10h
 
lea dx, w1
mov ah, 9
int 21h

lea dx, pc1
mov ah, 9
int 21h
   

lea dx,j
mov ah, 9
int 21h

mov al,xc
add al,30h
mov dl,al
mov ah,02
int 21h

mov ah, 2
mov dh, 20
mov dl, 30
int 10h
   
lea dx, w1
mov ah, 9
int 21h

lea dx, pc2
mov ah, 9
int 21h
   

lea dx,j
mov ah, 9
int 21h

mov al,oc
add al,30h
mov dl,al
mov ah,02
int 21h

mov ah,7h
int 21h

jmp l

v1:
inc oc
lea dx, player
mov ah, 9
int 21h
lea dx, w2
mov ah, 9
int 21h


mov ah, 2
mov dh, 17
mov dl, 28
int 10h

lea dx, pkey
mov ah, 9
int 21h

mov ah, 2
mov dh, 18
mov dl, 30
int 10h

lea dx, scard
mov ah, 9
int 21h
       
mov ah, 2
mov dh, 19
mov dl, 30
int 10h
 
lea dx, w1
mov ah, 9
int 21h

lea dx, pc1
mov ah, 9
int 21h
   

lea dx,j
mov ah, 9
int 21h

mov al,xc
add al,30h
mov dl,al
mov ah,02
int 21h

mov ah, 2
mov dh, 20
mov dl, 30
int 10h
   
lea dx, w1
mov ah, 9
int 21h

lea dx, pc2
mov ah, 9
int 21h
   

lea dx,j
mov ah, 9
int 21h

mov al,oc
add al,30h
mov dl,al
mov ah,02
int 21h

mov ah,7h
int 21h
jmp l

draw:
lea dx, drw
mov ah, 9
int 21h
mov ah, 2
mov dh, 17
mov dl, 28
int 10h

lea dx, pkey
mov ah, 9
int 21h

mov ah, 7  
int 21h

jmp l

check:  

check1:  
mov al, c1
mov bl, c2
mov cl, c3

cmp al, bl
jnz check2

cmp bl, cl
jnz check2

mov done, 1
jmp board

check2:  
mov al, c4
mov bl, c5
mov cl, c6

cmp al, bl
jnz check3

cmp bl, cl
jnz check3


mov done, 1
jmp board


check3:  
mov al, c7
mov bl, c8
mov cl, c9

cmp al, bl
jnz check4

cmp bl, cl
jnz check4

mov done, 1
jmp board


check4:  
mov al, c1
mov bl, c4
mov cl, c7

cmp al, bl
jnz check5

cmp bl, cl
jnz check5

mov done, 1
jmp board


check5:  
mov al, c2
mov bl, c5
mov cl, c8

cmp al, bl
jnz check6

cmp bl, cl
jnz check6

mov done, 1
jmp board


check6:  
mov al, c3
mov bl, c6
mov cl, c9

cmp al, bl
jnz check7

cmp bl, cl
jnz check7

mov done, 1
jmp board


check7:  
mov al, c1
mov bl, c5
mov cl, c9

cmp al, bl
jnz check8

cmp bl, cl
jnz check8

mov done, 1
jmp board


check8:  
mov al, c3
mov bl, c5
mov cl, c7

cmp al, bl
jnz drawcheck

cmp bl, cl
jnz drawcheck

mov done, 1
jmp board

drawcheck:
mov al, moves
cmp al, 9
jb plrchange

mov dr, 1
jmp board
jmp exit
   
   

plrchange:

cmp player, 49
jz p2
cmp player, 50
jz p1

p1:
mov player, 49
mov cur, 88

jmp board
p2:
mov player, 50
mov cur, 79
jmp board


board:

; clear screen
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h

 
mov ah, 2
mov bh, 0
mov dh, 4
mov dl, 33
int 10h
 
lea dx,g
mov ah,9h
int 21h

mov al,cou
add al,30h
mov dl,al
mov ah,02h
int 21h  

mov ah, 2
mov bh, 0
mov dh, 6
mov dl, 30
int 10h

lea dx, l1
mov ah, 9
int 21h


mov ah, 2
mov dh, 7
mov dl, 30
int 10h

mov ah, 2
mov dl, 32
int 21h

; --------------------------------
; cell 1

lea dx, c1
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 2

lea dx, c2
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 3

lea dx, c3
mov ah, 9
int 21h

; ---------------------------------



mov ah, 2
mov dh, 8
mov dl, 30
int 10h


lea dx, l2
mov ah, 9
int 21h



mov ah, 2
mov dh, 9
mov dl, 30
int 10h

lea dx, l1
mov ah, 9
int 21h


mov ah, 2
mov dh, 10
mov dl, 30
int 10h

mov ah, 2
mov dl, 32
int 21h

; --------------------------------
; cell 4

lea dx, c4
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 5

lea dx, c5
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 6

lea dx, c6
mov ah, 9
int 21h

; ---------------------------------


mov ah, 2
mov dh, 11
mov dl, 30
int 10h

lea dx, l1
mov ah, 9
int 21h


mov ah, 2
mov dh, 12
mov dl, 30
int 10h


lea dx, l2
mov ah, 9
int 21h



mov ah, 2
mov dh, 13
mov dl, 30
int 10h

lea dx, l1
mov ah, 9
int 21h



mov ah, 2
mov dh, 14
mov dl, 30
int 10h

mov ah, 2
mov dl, 32
int 21h


; --------------------------------
; cell 4

lea dx, c7
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 5

lea dx, c8
mov ah, 9
int 21h

lea dx, n1
mov ah, 9
int 21h

; cell 6

lea dx, c9
mov ah, 9
int 21h

; ---------------------------------


mov ah, 2
mov dh, 15
mov dl, 30
int 10h


lea dx, l1
mov ah, 9
int 21h


mov ah, 2
mov dh, 16
mov dl, 20
int 10h


cmp done, 1  

;cmp player,49
;inc xc
;cmp player,50
;inc oc


jz victory

cmp dr, 1
jz draw



input:

lea dx, w1
mov ah, 9
int 21h

mov ah, 2
mov dl, player
int 21h

cmp player, 49
jz pl1

lea dx, pc2
mov ah, 9
int 21h
jmp takeinput


pl1:
lea dx, pc1
mov ah, 9
int 21h

takeinput:
lea dx, inp
mov ah, 9
int 21h

mov ah, 1
int 21h

inc moves

mov bl, al
sub bl, 48

mov cl, cur

cmp bl, 1
jz  c1u

cmp bl, 2
jz  c2u

cmp bl, 3
jz  c3u

cmp bl, 4
jz  c4u

cmp bl, 5
jz  c5u

cmp bl, 6
jz  c6u

cmp bl, 7
jz  c7u

cmp bl, 8
jz  c8u

cmp bl, 9
jz  c9u
dec moves


mov ah, 2
mov dh, 16
mov dl, 20
int 10h

lea dx, wi  
mov ah, 9
int 21h

mov ah, 7  
int 21h


mov ah, 2
mov dh, 16
mov dl, 20
int 10h

lea dx, emp
mov ah, 9
int 21h


mov ah, 2
mov dh, 16
mov dl, 20
int 10h

jmp input


taken:
dec moves

mov ah, 2
mov dh, 16
mov dl, 20
int 10h

lea dx, tkn  
mov ah, 9
int 21h

mov ah, 7    
int 21h


mov ah, 2
mov dh, 16
mov dl, 20
int 10h

lea dx, emp  
mov ah, 9
int 21h


mov ah, 2
mov dh, 16
mov dl, 20
int 10h

jmp input







c1u:
cmp c1, 88  
jz taken
cmp c1, 79  
jz taken

mov c1, cl
jmp check

c2u:
cmp c2, 88  
jz taken
cmp c2, 79  
jz taken

mov c2, cl
jmp check
c3u:
cmp c3, 88  
jz taken
cmp c3, 79  
jz taken

mov c3, cl
jmp check
c4u:
cmp c4, 88  
jz taken
cmp c4, 79  
jz taken

mov c4, cl
jmp check
c5u:
cmp c5, 88  
jz taken
cmp c5, 79  
jz taken

mov c5, cl
jmp check
c6u:
cmp c6, 88  
jz taken
cmp c6, 79  
jz taken

mov c6, cl
jmp check
c7u:
cmp c7, 88  
jz taken
cmp c7, 79  
jz taken

mov c7, cl
jmp check
c8u:
cmp c8, 88  
jz taken
cmp c8, 79  
jz taken

mov c8, cl
jmp check
c9u:
cmp c9, 88  
jz taken
cmp c9, 79  
jz taken

mov c9, cl
jmp check



l:
;dec tot
;mov al,tot
;jmp labk

ret
main endp
 
; ----------- try again -----------

tryagain:
; clear screen
   
mov cl,xc
mov bl,oc      
cmp cl,bl
ja print

cmp bl,cl
ja print1

cmp cl,bl
je print2          

o:
mov xc,0
mov oc,0              
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
 

mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h



lea dx, tra  
mov ah, 9
int 21h

mov ah, 1
int 21h

cmp al, 121  
jz init1

cmp al, 89  
jz init1

cmp al, 110  
jz i1
cmp al, 78  
jz i1


mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h

lea dx, wi  
mov ah, 9
int 21h

mov ah, 7
int 21h


mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h

lea dx, emp  
mov ah, 9
int 21h



jmp tryagain
 

tryagain1:
; clear screen
               
               
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h

mov xc,0
mov oc,0

mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h



lea dx, tra  
mov ah, 9
int 21h

mov ah, 1
int 21h

cmp al, 121  
jz init2

cmp al, 89  
jz init2

cmp al, 110  
jz i1
cmp al, 78  
jz i1


mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h

lea dx, wi  
mov ah, 9
int 21h

mov ah, 7
int 21h


mov ah, 2
mov bh, 0
mov dh, 10
mov dl, 24
int 10h

lea dx, emp  
mov ah, 9
int 21h



jmp tryagain1

print:  

 mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h

mov ah, 2
mov dh, 20
mov dl, 30
int 10h
       

lea dx,win
mov ah, 9
int 21h
     
lea dx,w1
mov ah,9
int 21h

mov al,1
add al,30h
mov dl,al
mov ah,02
int 21h  

mov ah, 7
int 21h

jmp o

 
print1:
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
mov ah, 2
mov dh, 20
mov dl, 30
int 10h

lea dx,win
mov ah, 9
int 21h  

lea dx,w1
mov ah,9
int 21h

mov al,2
add al,30h
mov dl,al
mov ah,02
int 21h

mov ah, 7
int 21h

jmp o
   
print2:
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
mov ah, 2
mov dh, 20
mov dl, 30
int 10h
 
lea dx,sf
mov ah, 9
int 21h  

mov ah, 7
int 21h

jmp o

exit:
; --------------------  
     
mov ah, 2
mov dh, 14
mov dl, 7
int 10h
lea dx, pkey
mov ah, 9
int 21h        

; wait for any key....
mov ah, 1
int 21h
mov ax, 4c00h ; exit to operating system.
int 21h
ends

end start ; set entry point and stop the assembler.
