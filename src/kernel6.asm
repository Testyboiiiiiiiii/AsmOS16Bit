
[bits 16]
[org 0x8200]
xor ax,ax 
mov ss,ax
mov sp,0x8200 ;ok this time we might need it cuz i might use bx to store string
mov bx, 0x9000 ;bx totally wanted to be used this way trust
kernelmain: ;hope you didnt look at this at purpose.
xor ax, ax
mov ss, ax
mov sp, 0x8200
mov ds, ax
call keys
call con
call diskservice
jmp kernelmain
keys:
mov ah, 0x01 ;uhh
int 0x16
jz .no
mov ah, 0x00 
int 0x16
ret
.no: ;how ba-a-a-ad can i be? im just building the economy (this is the most random shit i ever wrote)
xor al,al
ret
con:
cmp al, 0
je .getout

cmp bx, 0x900D
jae .full
cmp al, 0x0D
je .entered 
jne .else
.full:
xor al, al
mov si, fulltext
.write:
mov ah, 0x0E 
lodsb
int 0x10
cmp al, 0
jnz .write
je .restart
.restart:
mov al, 0x0D 
jmp .entered
.entered: ;mankind is dead, blood is fuel, hell is full. (random 2)
mov ah, 0x0E
int 0x10
mov al, 0x0A
int 0x10
mov al, '$'
int 0x10
mov bx, 0x9000
xor al,al
ret

.else:
mov ah, 0x0E
mov [bx], al
inc bx
int 0x10
xor al, al
ret
.getout:

ret
diskservice:
;apologie for bad england
;where were u wen club penguin die
;i was at house eating dorito when phone ring
;"Club penguin is kil"
;"no"
ret

;TEXT DATA BELOW ME ↓ 

fulltext:
db 'data overflow, try again', 0

times 512 - ($ - $$) db 0 