TITLE PROGRAM TO DISPLAY CAPITAL IN CENTER
    .MODEL SMALL
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STRING DB 50 DUP('$')
    MSG    DB "The total no of words are: $"
    ROW    DB 12
    COL    DB 40
    WORDS  DB 01H

.CODE

    ; CENTER MACRO
    ;     MOV AH,02H
    ;     MOV DH,ROW
    ;     MOV DL,COL
    ;     INT 10H
    ; CENTER ENDM
    
    ; ENDM

MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX

           MOV  AH,0AH
           LEA  DX,MAXLEN
           INT  21H

           MOV  CL,ACTLEN
           MOV  CH,00H
           LEA  SI,STRING

           MOV  AH,00H
           MOV  AL,03H
           INT  10H

           MOV  AH,02H
           MOV  DH,ROW
           MOV  DL,COL
           INT  10H
        
    REPEAT:
           MOV  AL,[SI]
           CMP  AL,'a'
           JC   SKIP
           CMP  AL,'z'
           JE   DO
           JNC  SKIP
    DO:    SUB  AL,'a'
           ADD  AL,'A'
    SKIP:  
           CMP  AL,20H
           JNE  NEXT
           INC  ROW
           MOV  AH,02H
           MOV  DH,ROW
           MOV  DL,COL
           INT  10H
           INC  WORDS

    NEXT:  
           MOV  AH,02H
           MOV  DL,AL
           INT  21H
           INC  SI
           LOOP REPEAT

           MOV  AH,02H
           MOV  DL,0AH
           INT  21H

        
           LEA  DX,MSG
           MOV  AH,09H
           INT  21H

           MOV  DL,WORDS
           ADD  DL,30H
           MOV  AH,02H
           INT  21H

           MOV  AX,4C00H
           INT  21H
MAIN ENDP
    END MAIN
    


