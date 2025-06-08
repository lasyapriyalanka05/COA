ORG 100h           ; Origin for COM file format

.CODE
    ; Display message "Enter first digit: "
    MOV DX, OFFSET msg_input1   ; Load the address of the first input message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Read the first digit from the user
    MOV AH, 01h                 ; Function 01h of INT 21h to read a character
    INT 21h                     ; Call DOS interrupt to get the character
                    ; Convert ASCII character to numeric value (digit)
    MOV BL, AL                  ; Store the first digit in BL

    ; Display message "Enter second digit: "
    MOV DX, OFFSET msg_input2   ; Load the address of the second input message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Read the second digit from the user
    MOV AH, 01h                 ; Function 01h of INT 21h to read a character
    INT 21h                     ; Call DOS interrupt to get the character
                 ; Convert ASCII character to numeric value (digit)
    MOV BH, AL                  ; Store the second digit in BH

    ; Compare the two digits
    CMP BL, BH                  ; Compare the first and second digits
    JE digits_equal             ; If equal, jump to digits_equal

    ; If not equal, display the "Not Equal" message
    MOV DX, OFFSET msg_not_equal  ; Load the address of the "Not Equal" message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message
    JMP end_program             ; Jump to program termination

digits_equal:
    ; If digits are equal, display the "Equal" message
    MOV DX, OFFSET msg_equal    ; Load the address of the "Equal" message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

end_program:
    ; Terminate the program
    MOV AH, 4Ch                 ; Function 4Ch of INT 21h to terminate program
    INT 21h                     ; Call DOS interrupt to exit

msg_input1   DB 'Enter first digit: $'        ; Message for first input
msg_input2   DB 0Dh, 0Ah, 'Enter second digit: $'   ; Message for second input
msg_equal    DB 0Dh, 0Ah, 'The digits are equal.$'  ; Message for equal digits
msg_not_equal DB 0Dh, 0Ah, 'The digits are not equal.$' ; Message for not equal digits

END
