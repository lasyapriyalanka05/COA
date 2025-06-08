ORG 100h               ; Origin for COM file format
.CODE

    ; Display message "The reverse order of A to Z is: "
    MOV DX, OFFSET msg_intro   ; Load the address of the introductory message
    MOV AH, 09h                ; Function 09h of INT 21h to display a string
    INT 21h                    ; Call DOS interrupt to print the message

    MOV AL, 'A'                ; Start with ASCII value of 'Z'
    MOV CX, 26                 ; Set loop counter to 26 for letters A-Z

print_char:
    ; Display the current character
    MOV DL, AL                 ; Load the ASCII character into DL for output
    MOV AH, 02h                ; Function 02h of INT 21h to display a character
    INT 21h                    ; Call DOS interrupt to print the character

    ; Move to the previous character
    inc AL                     ; Decrement AL to the previous ASCII character

    ; Check if we have printed all letters
    LOOP print_char            ; Loop until CX reaches 0

    ; Terminate the program
    MOV AH, 4Ch                ; Function 4Ch of INT 21h to terminate program
    INT 21h                    ; Call DOS interrupt to exit
                          
msg_intro   DB 'The alphabets from A to Z is: $' ; Introductory message
END