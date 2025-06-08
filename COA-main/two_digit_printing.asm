ORG 100h           ; Origin for COM file format

.data
    number db 18   ; Two-digit number to display (e.g., 18)

.CODE
    ; Print the message "The output to be printed on screen is: "
    MOV DX, OFFSET msg_output   ; Load the address of the output message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Load the two-digit number into AL
    MOV AL, number

    ; Divide the number by 10 to separate tens and ones place
    MOV AH, 0                    ; Clear upper half of AX
    MOV BL, 10                   ; Divisor to divide by 10
    DIV BL                       ; Divide AX by 10, quotient -> AL, remainder -> AH

    ; Convert the tens digit to ASCII and print it
    ADD AL, '0'                  ; Convert the tens place to ASCII ('0' + digit)
    MOV DL, AL                   ; Move the ASCII tens digit to DL
    MOV AH, 02h                  ; Function 02h of INT 21h to print a single character
    INT 21h                      ; Call DOS interrupt to display tens digit

    ; Convert the ones digit to ASCII and print it
    MOV AL, AH                   ; Move the ones place from AH to AL
    ADD AL, '0'                  ; Convert the ones place to ASCII ('0' + digit)
    MOV DL, AL                   ; Move the ASCII ones digit to DL
    MOV AH, 02h                  ; Function 02h of INT 21h to print a single character
    INT 21h                      ; Call DOS interrupt to display ones digit

    ; Terminate the program
    MOV AH, 4Ch                  ; Function 4Ch of INT 21h to terminate program
    INT 21h                      ; Call DOS interrupt to exit

msg_output DB 0Dh, 0Ah, 'The two digit number is: $'  ; Message
END
