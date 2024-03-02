TITLE DISPLAY STRING IN CENTER
    .MODEL SMALL
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')

.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         LEA DX,MAXLEN
         MOV AH,0AH
         INT 21H

         MOV AH,0
         MOV AL,03H
         INT 10H

         MOV AH,02H
         MOV DH,12
         MOV DL,40
         INT 10H

         MOV AH,09H
         LEA DX,STRING1
         INT 21H

         MOV AX,4C00H
         INT 21H

MAIN ENDP
    END MAIN