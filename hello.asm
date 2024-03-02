        .MODEL SMALL
.DATA
    VAR1 DB 50H
    VAR2 DB 12H
    STR1 DB "Hello World$"
.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         LEA DX,STR1
         MOV AH,09H
         INT 21H

         MOV AX,4C00H
         INT 21H
MAIN ENDP
    END MAIN