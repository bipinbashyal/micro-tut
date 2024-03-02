TITLE TAKE INPUT AND CONVERT INTO UPPERCASE

    .MODEL SMALL
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')

.CODE
MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX

           LEA  DX,MAXLEN
           MOV  AH,0AH
           INT  21H

           LEA  SI,STRING1
           MOV  CL,ACTLEN
           MOV  CH,00H

    REPEAT:
           MOV  AL,[SI]
           CMP  AL,'a'
           JC   NEXT
           CMP  AL,'z'
           JE   DO
           JNC  NEXT
    DO:    
           SUB  AL,'a'
           ADD  AL,'A'
           MOV  [SI],AL
    NEXT:  
           INC  SI
           LOOP REPEAT

           MOV  AH,02H
           MOV  DL,0AH
           INT  21H

           LEA  DX,STRING1
           MOV  AH,09H
           INT  21H

           MOV  AX,4C00H
           INT  21H

MAIN ENDP
    END MAIN
    


