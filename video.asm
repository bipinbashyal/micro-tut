TITLE VIDEO CLASS
    .MODEL SMALL
.DATA
    VAR1 DB 10H
.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         MOV AH,00H
         MOV AL,03H
         INT 10H

    ; set cursor size max(0-14) normal(13-14)
         MOV AH,01H
         MOV CH,13
         MOV CL,14
         INT 10H

    ;  set cursor position
    ;  MOV AH,02H
    ;  MOV BH,00
    ;  MOV DH,12       ;ROW
    ;  MOV DL,30       ;COL
    ;  INT 10H

    ; KNOW STATUS OF CURSOR
         MOV AH,03H
         MOV BH,00H
         INT 10H

         MOV AX, 0705H    ; Request scroll
         MOV BH, 61H      ;blue on brown for attribute on
         MOV CX, 0110     ; Full screen
         MOV DX, 2070
         INT 10H
    
         MOV AX,4C00H
         INT 21H
MAIN ENDP
END MAIN