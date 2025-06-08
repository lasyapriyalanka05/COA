ORG 100h           ; Origin for COM file format

.CODE
    ; Display message "Enter first digit: "
    MOV DX, OFFSET msg_input1   ; Load the address of the first input message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Read the first digit from the user
    MOV AH, 01h                 ; Function 01h of INT 21h to read a character
    INT 21h                     ; Call DOS interrupt to get the character
    SUB AL, '0'                 ; Convert ASCII character to numeric value (digit)
    MOV BL, AL                  ; Store the first digit in BL

    ; Display message "Enter second digit: "
    MOV DX, OFFSET msg_input2   ; Load the address of the second input message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Read the second digit from the user
    MOV AH, 01h                 ; Function 01h of INT 21h to read a character
    INT 21h                     ; Call DOS interrupt to get the character
    SUB AL, '0'                 ; Convert ASCII character to numeric value (digit)
    MOV BH, AL                  ; Store the second digit in BH

    ; Add the two digits
    ADD BL, BH                  ; BL = BL + BH (add the two digits)

    ; Convert the result to ASCII
    ADD BL, '0'                 ; Convert the result back to ASCII

    ; Display the result message "The result is: "
    MOV DX, OFFSET msg_result   ; Load the address of the result message
    MOV AH, 09h                 ; Function 09h of INT 21h to display a string
    INT 21h                     ; Call DOS interrupt to print the message

    ; Display the result
    MOV DL, BL                  ; Move the result (BL) to DL
    MOV AH, 02h                 ; Function 02h of INT 21h to display a single character
    INT 21h                     ; Call DOS interrupt to print the result

    ; Terminate the program
    MOV AH, 4Ch                 ; Function 4Ch of INT 21h to terminate program
    INT 21h                     ; Call DOS interrupt to exit

msg_input1  DB 'Enter first digit: $'       ; Message for first input
msg_input2  DB 0Dh, 0Ah, 'Enter second digit: $'  ; Message for second input
msg_result  DB 0Dh, 0Ah, 'The result is: $' ; Result message

END
