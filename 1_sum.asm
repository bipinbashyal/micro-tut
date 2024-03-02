TITLE ADD 10 NUMBERS FROM 50 TO 150
    .MODEL SMALL
.STACK
.DATA
    ARR  DW 60,70,86,79,70,140,130,120,100,150
    STRING  DB "THE SUM OF NUMBERS IS: $"
    SUM DW ?
.CODE
MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX

           MOV  AX,@STACK
           MOV  SS,AX

           LEA  SI,ARR
           MOV  AX,0
           MOV  CX,10
    REPEAT:
           ADD  AX,[SI]
           INC  SI
           INC SI
           LOOP REPEAT

           MOV DX,0
           MOV CX,0
           MOV BX,10

    REPEAT2:
           CMP AX,0
           JZ NEXT
           DIV BX
           PUSH DX
           SUB DX,DX
           INC CX
           JMP REPEAT2

    NEXT:
            CMP CX,0
            JZ EXIT
            POP DX
            ADD DX,30H
            DEC CX
            MOV AH,02H
            INT 21H
            JMP NEXT

    EXIT:
           MOV  AX,4C00H
           INT  21H


MAIN ENDP
    END MAIN
