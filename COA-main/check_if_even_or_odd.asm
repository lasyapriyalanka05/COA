ORG 100h           ; Origin for COM file format

.CODE
    ; Display message "Enter a single-digit number: "
    MOV DX, OFFSET msg_input       ; Load the address of the input message
    MOV AH, 09h                    ; Function 09h of INT 21h to display a string
    INT 21h                        ; Call DOS interrupt to print the message

    ; Read the digit from the user
    MOV AH, 01h                    ; Function 01h of INT 21h to read a character
    INT 21h                        ; Call DOS interrupt to get the character
                       ; Convert ASCII character to numeric value (digit)

    ; Check if the number is odd or even
    MOV BL, AL                     ; Store the number in BL for checking
    AND BL, 1                      ; Check the least significant bit (odd/even test)
    JNZ odd_number                 ; If the LSB is 1, it's odd, jump to odd_number

    ; If the number is even
    MOV DX, OFFSET msg_even         ; Load the address of the "Even" message
    MOV AH, 09h                    ; Function 09h of INT 21h to display a string
    INT 21h                        ; Call DOS interrupt to print the message
    JMP end_program                ; Jump to program termination

odd_number:
    ; If the number is odd
    MOV DX, OFFSET msg_odd          ; Load the address of the "Odd" message
    MOV AH, 09h                    ; Function 09h of INT 21h to display a string
    INT 21h                        ; Call DOS interrupt to print the message

end_program:
    ; Terminate the program
    MOV AH, 4Ch                    ; Function 4Ch of INT 21h to terminate the program
    INT 21h                        ; Call DOS interrupt to exit

msg_input  DB 'Enter a single-digit number: $'   ; Message to ask for a number
msg_even   DB 0Dh, 0Ah, 'The number is even.$'   ; Message for even number
msg_odd    DB 0Dh, 0Ah, 'The number is odd.$'    ; Message for odd number

END
