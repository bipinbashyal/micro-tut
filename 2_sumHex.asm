TITLE SUM OF NUMBERS BTW 30 AND 100 DISPLAY IN HEX
    .MODEL SMALL
.DATA
.STACK 32
    ARR1 DW 30,40,50,60,70,85,97,77,65,80
.CODE
MAIN PROC FAR
            MOV  AX,@DATA
            MOV  DS,AX

            MOV  AX,@STACK
            MOV  SS,AX

            MOV  AX,0
            MOV  CX,10
            LEA  SI,ARR1
    REPEAT: 
            ADD  AX,[SI]
            INC  SI
            INC  SI
            LOOP REPEAT

            MOV  DX,0
            MOV  BX,16
            MOV  CX,0

    REPEAT2:
            CMP  AX,0
            JZ   NEXT
            DIV  BX
            PUSH DX
            INC  CX
            SUB  DX,DX
            JMP  REPEAT2

    NEXT:   
            CMP  CX,0
            JZ   EXIT
            POP  DX
            CMP  DX,10
            JNC  NEXT2
            ADD  DX,30H
            JMP  OUT1
    NEXT2:  
            ADD  DX,37H
    OUT1:   
            MOV  AH,02H
            INT  21H
            DEC  CX
            JMP  NEXT

    EXIT:   
            MOV  AX,4C00H
            INT  21H
MAIN ENDP
END MAIN

    


