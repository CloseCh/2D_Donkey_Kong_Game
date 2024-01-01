
SCRWIDTHX    DS.W 1                    ; SCREEN WIDTH
SCRHEIGHX    DS.W 1                   ; SCREEN HEIGHT
TILWIDTH    EQU     1                      ; TILE WIDTH
TILHEIGH    EQU     1                      ; TILE HEIGHT

; ---------------------------------------------------------------------------------------------
PLOT
; INPUT     :WIDTH IN D0, HEIGHT IN D1
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
        
        MOVEM.L D0-D6/A0,-(A7)
        MOVE.W D0,SCRWIDTHX
        MOVE.W D1,SCRHEIGHX
        MOVE.L (MAIMAGE) , A0
        ;DIBUJO DEL RECTANGULO
        MOVE.W #87,D0
        CLR.W D2
        MOVE.W MAPOINTY,D4

        MOVE.W  (SCRHEIGHX),D6
        SUB.W #1,D6

.CLOOP  CLR.W   D1
        MOVE.W  MAPOINTX,D3
        MOVE.W  (SCRWIDTHX),D5
        SUB.W #1,D5
.RLOOP  TST.B   (A0)+
        BEQ     .NEXT
        JSR SELECCION
        TRAP    #15
                      
.NEXT   MOVE.W  D3,D1
        ADD.W   #TILWIDTH,D3
        DBRA.W  D5,.RLOOP
        MOVE.W  D4,D2
        ADD.W   #TILHEIGH,D4
        DBRA.W  D6,.CLOOP

     
    MOVEM.L (A7)+,D0-D6/A0
    
    RTE

SELECCION
     MOVEM.L D0-D6,-(A7)
     MOVE.B #80,D0 ;TAREA PARA ELEGIR EL COLOR DEL "PEN"
       
        
    
        CMP.B #1,-(A0) ;COMPARA SI ES ROJO  
        BNE AZUL ;SINO ES AZUL
        MOVE.L  #$000000FF,D1
        TRAP    #15
        MOVE.B  #81,D0 ; TAREA PARA ELEGIR EL RELLENO DEL RECTANGULO.
        MOVE.L  #$000000FF,D1
        TRAP    #15
        BRA CONTINUE

AZUL    CMP.B #2,(A0)
        BNE CARNE
        MOVE.L  #$00FF0000,D1 
        TRAP    #15
        MOVE.B  #81,D0
        MOVE.L  #$00FF0000,D1
        TRAP    #15
        BRA CONTINUE
        
CARNE   CMP.B #3,(A0)
        BNE NARANJA
        MOVE.L  #$00CADDFD,D1 
        TRAP    #15
        MOVE.B  #81,D0
        MOVE.L  #$00CADDFD,D1
        TRAP    #15
        BRA CONTINUE

NARANJA CMP.B #4,(A0)
        BNE BLANCO
        MOVE.L  #$000080FF,D1 
        TRAP    #15
        MOVE.B  #81,D0
        MOVE.L  #$000080FF,D1
        TRAP    #15
        BRA CONTINUE

BLANCO  CMP.B #5,(A0)
        BNE ROSA
        MOVE.L  #$00FFFFFF,D1 
        TRAP    #15
        MOVE.B  #81,D0
        MOVE.L  #$00FFFFFF,D1
        TRAP    #15
        BRA CONTINUE

ROSA    MOVE.L  #$00CB00FF,D1 
        TRAP    #15
        MOVE.B  #81,D0
        MOVE.L  #$00CB00FF,D1
        TRAP    #15
        

       
CONTINUE
    ADDA.L #1,A0
    MOVEM.L (A7)+,D0-D6

    RTS
    



*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
