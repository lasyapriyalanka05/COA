org 100h
mov ax,0078h 
mov bx,0034h 
mul bx
 mov bx, ax 
 mov ah, bh 
 shr ah, 4 
 add ah, 30h
 cmp ah, 39h 
 jle print_high_nibble
 add ah, 7 
print_high_nibble:
 mov dl, ah
 mov ah, 02h 
 int 21h
 
 mov ah, bh
 and ah, 0fh
 add ah, 30h 
 cmp ah, 39h 
 jle print_low_nibble
 add ah, 7 
print_low_nibble:
 mov dl, ah 
 mov ah, 02h 
 int 21h
 
 mov ah, bl 
 shr ah, 4 
 add ah, 30h 
 cmp ah, 39h 
 jle print_high_nibble2
 add ah, 7 
print_high_nibble2:
 mov dl, ah 
 mov ah, 02h 
 int 21h
 
 mov ah, bl 
 and ah, 0fh 
 add ah, 30h 
 cmp ah, 39h 
 jle print_low_nibble2
 add ah, 7 
print_low_nibble2:
 mov dl, ah 
 mov ah, 02h 
 int 21h
 mov ah, 4ch 
 int 21h