
M_XDATA SEGMENT 
      
      ALGDGADU DB ?
       OUTER_FACT DW ?
       WELCOME DB "BIENVENIDO, PROGRAMA PARA CALCULAR FACTORIAL DE NUMERO DE 1 DIGITO",10,13,24H
       WOW64 DB "Ingrese Numero: ",10,13,24H 
       EQUAL DB "!= --GUARDADO EN VARIABLE 'OUTER_FACT'--$",  
       
       
M_XDATA ENDS

FULLCODE SEGMENT
    
ASSUME CS:FULLCODE, DS:M_XDATA         ;<=THIS{AUTO ASIGN ON ME.DISPOSE() BY CHECHESWAP! JJNB}

START:  
                
            MOV AX,M_XDATA
            MOV DS, AX
            
               
               MOV DX, OFFSET WELCOME
               MOV AH, 09H
               INT 21H
               
               
               MOV DX, OFFSET WOW64
               MOV AH, 09H
               INT 21H
               
               
               
               MOV AH, 1H
               INT 21H
               MOV BX, OFFSET ALGDGADU
               SUB AL,30H
               MOV [BX], AL
               
               CMP AL, 01H
               JBE NEXTQ
                                              
                MOV AX,1       
                       
                MOV BL, ALGDGADU
                MOV BH, 0H
                
                CALL $FACTORIAL
                MOV OUTER_FACT, AX  
                
                    LEA DX, EQUAL
                    MOV AH, 09H
                    INT 21H 

                MOV AH, 4CH
                INT 21H

                    $FACTORIAL PROC
                    CMP BX, 1
                    JE HVOC
                    PUSH BX
                    DEC BX
                    CALL $FACTORIAL
                    POP BX
                    MUL BX

                        HVOC:                         
                          RET
                           $FACTORIAL ENDP 
                            FULLCODE ENDS
                                 
                                    
                                NEXTQ:
                                MOV AH, 02H
                                MOV DL, 021H 
                                INT 21H 
                                MOV AH, 02H
                                MOV DL, 03DH 
                                INT 21H
                                MOV AH, 02H
                                MOV DL, 31H 
                                INT 21H 
                                

                                                               

END START
