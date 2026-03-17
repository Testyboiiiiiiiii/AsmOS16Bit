
[bits 16]
[org 0x7c00]
;uhh so i will set up stack guys
xor ax, ax
mov ss, ax
mov sp, 0x7c00
;wait why am i even doing this i dont need es yet
;maybe you guys will
readafter:
xor ax, ax
mov es, ax
mov ah, 0x02
mov al, 0x02
mov cl, 0x02
mov ch, 0x00
mov dl, 0x00 
mov dh, 0x00
mov bx, 0x7E00
int 13h
jc readafter
jmp 0x7E00
times 510 - ($ - $$) db 0
dw 0xAA55
;let me announce that we use GNU GPL 3.0
;then we will jump to main.asm (i finally learned linkers yay)

writegpltext:
xor ax, ax
mov ds, ax
mov ah, 0x0E
mov si, gpltext
actuallywrite:
lodsb
int 10h
cmp al, 0
jnz actuallywrite


jumptomain:
xor ax, ax
mov es, ax
mov ah, 0x02
mov cl, 0x03
mov al, 0x01 ;i wanted to allocate 2 sectors for kernel, but not rn
mov ch, 0x00
mov dl, 0x00 
mov dh, 0x00 ;we are still in floppy
mov bx, 0x8200
int 13h
jc jumptomain
jmp 0x8200

;hlt and jmp $ will have new jobs!
; (this function was unfinished and i used the two to keep it from executing the ascii below)

gpltext:
db 'this software uses the gpl gnu 3.0', 0
times 1024 - ($ - $$) db 0 