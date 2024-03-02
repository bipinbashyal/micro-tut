TITLE TO TAKE INPUT AND DISPLAY ON 10,20 ON SCREEN
    .MODEL SMALL
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')
    ROW     DB 10
    COL     DB 20

.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         MOV AH,0AH
         LEA DX,MAXLEN
         INT 21H

         MOV AH,00H
         MOV AL,03H
         INT 10H

         MOV AH,02H
         MOV DH,ROW
         MOV DL,COL
         INT 10H

         LEA DX,STRING1
         MOV AH,09H
         INT 21H

         MOV AX,4C00H
         INT 21H

MAIN ENDP
    END MAIN

