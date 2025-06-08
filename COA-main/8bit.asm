org 100h       
;start address for the program
;define the 8-bit numbers to add
num1 db 41h             ;first hexadecimal number
num2 db 85h             ;second hexadecimal number
start:
    mov al, num1         ;load the 1st number into a register AL
    add al,num2          ;  add the second number to AL 
    ;result is now in AL
    ;convert result to a printable ASCII value for display
    ;save the result for the display
    mov bl,al         
    ;convert upper nibble 4-bits of AL to a character
    mov ah,al
    and ah,0F0h     ;mask the lower nibble
    shr ah,4               ;shift right by 4 to get the upper nibble
    add ah,30h      ;convert to ASCII digit 0-9
    cmp ah,39h
    jle print_first_digit
    add ah, 7             ;conveert to ASCII letter (A_F) if necessary
print_first_digit:
      mov dl, ah       ;move 1st digit to DL for printing
      mov ah, 02h       ;BIOS interrupt to display character
      int 21h
      
      ;lower nibble
      mov ah,bl
      and ah,0Fh             ;mask the upper nibble
      add ah,30h              ;convert to ASCII digit (0-9)
      cmp ah, 39h
      jle print_second_digit
      add ah,7                 ;conveert to ASCII letter (A_F) if necessary
print_second_digit:
      mov dl, ah          ;move the second digit to DL for printing
      mov ah, 02h         ;BIOS interrupt to display character
      int 21h    
      ;end of the program
      mov ah,4Ch           ;terminate the program
      int 21h  