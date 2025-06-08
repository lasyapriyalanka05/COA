org 100h

mov al, 18h  ; Numerator (24 decimal)
mov bl, 05h  ; Denominator (5 decimal)

; Zero the higher byte of AX before division, because AX is used for 16-bit division.
xor ah, ah   

div bl       ; Divide AX by BL. AL = quotient, AH = remainder.

; Store quotient and remainder for further processing
mov cl, al   ; Move quotient to CL
mov ch, ah   ; Move remainder to CH

; Print quotient
mov al, cl   ; Load quotient into AL for printing
call print_number

; Print remainder
mov al, ch   ; Load remainder into AL for printing
call print_number

mov ah, 4Ch  ; Exit program
int 21h

print_number:
    ; Print hexadecimal value in AL
    mov bl, al

    ; Print first digit
    mov ah, al
    and ah, 0F0h
    shr ah, 4
    add ah, 30h
    cmp ah, 39h
    jle print_first
    add ah, 7

print_first:
    mov dl, ah
    mov ah, 02h
    int 21h

    ; Print second digit
    mov ah, bl
    and ah, 0Fh
    add ah, 30h
    cmp ah, 39h
    jle print_second
    add ah, 7

print_second:
    mov dl, ah
    mov ah, 02h
    int 21h
    ret