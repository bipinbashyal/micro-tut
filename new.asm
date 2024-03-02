.model small
.stack
.data
maxchar db 255
nchars db ?
actstr db 255 dup(?)
row db 10h ;approx center for row.
.code
center macro
inc row
mov ah, 02h
mov bh, 00h
mov dl, 40
int 10h
center endm
main proc
mov ax, @data
mov ds, ax
mov bl, 01h
mov ah, 0ah
mov dx, offset maxchar
int 21h

center
lea si, actstr
mov ch, 00h
mov cl, nchars
again: mov al, [si]
cmp al, 32
jne sk_nln
center
sk_nln:mov dl, al
mov ah, 02h
int 21h
inc si
loop again
end: mov ah, 4ch
int 21h
main endp
end 
