org 100h

mov ax, 180h      ; Numerator (384 decimal)
mov bl, 62h       ; Denominator (98 decimal)

xor dx, dx        ; Zero DX before division
div bl            ; Divide AX by BL. Quotient in AL, remainder in AH

; Print quotient
mov al, al        ; Quotient is already in AL
call print_number ; Print AL (quotient)

; Print remainder
mov al, ah        ; Move remainder (AH) to AL for printing
call print_number ; Print AL (remainder)

mov ah, 4Ch       ; Exit program
int 21h

print_number:
    ; Print hexadecimal value in AL
    push ax        ; Save AX because we are going to modify it
    mov bl, al

    ; Print first digit (high nibble)
    mov ah, al
    and ah, 0F0h   ; Mask the higher nibble
    shr ah, 4      ; Shift right to align the high nibble
    add ah, 30h    ; Convert to ASCII
    cmp ah, 39h    ; Check if it's a number
    jle print_first
    add ah, 7      ; Convert to letter if needed

print_first:
    mov dl, ah     ; Move to DL for printing
    mov ah, 02h    ; Call DOS service to print
    int 21h

    ; Print second digit (low nibble)
    mov ah, bl
    and ah, 0Fh    ; Mask the low nibble
    add ah, 30h    ; Convert to ASCII
    cmp ah, 39h    ; Check if it's a number
    jle print_second
    add ah, 7      ; Convert to letter if needed

print_second:
    mov dl, ah
    mov ah, 02h
    int 21h
    pop ax         ; Restore AX
    ret
