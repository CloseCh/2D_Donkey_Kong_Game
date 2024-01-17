
WIDTH        DS.W    1                      ; WIDTH
HEIGHT       DS.W    1                      ; HEIGHT
COORX        DS.W    1                      ; COORDENATE X
COORY        DS.W    1                      ; COORDENATE Y


; ---------------------------------------------------------------------------------------------
PLOT
; INPUT     :WIDTH IN D0, HEIGHT IN D1,COORDENATE X IN D2, COORDENATE X IN D3, ADDRESS IN A0
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------

            MOVEM.W D0-D6/A0,-(A7)
            MOVE.W  D0,WIDTH
            MOVE.W  D1,HEIGHT
            MOVE.W  D2,COORX
            MOVE.W  D3,COORY
            ;DIBUJO DEL RECTANGULO
            MOVE.W  #87,D0
            CLR.W   D2
            MOVE.W  COORY,D4

            MOVE.W  (HEIGHT),D6
            SUB.W   #1,D6

.CLOOP      CLR.W   D1
            MOVE.W  COORX,D3
            MOVE.W  (WIDTH),D5
            SUB.W   #1,D5
.RLOOP      TST.B   (A0)+
            BEQ     .NEXT
            JSR     SELECCION
            TRAP    #15
                      
.NEXT       MOVE.W  D3,D1
            ADDQ.W  #1,D3
            DBRA.W  D5,.RLOOP
            MOVE.W  D4,D2
            ADDQ.W  #1,D4
            DBRA.W  D6,.CLOOP

     
            MOVEM.W (A7)+,D0-D6/A0
    
            RTE

SELECCION
            MOVEM.L D0-D6,-(A7)
            MOVE.B  #80, D0 ; TAREA PARA ELEGIR EL COLOR DEL "PEN"
            CMP.B   #1, -(A0) 
            BEQ     .ROJO
            CMP.B   #2, (A0)
            BEQ     .AZUL
            CMP.B   #3, (A0)
            BEQ     .CARNE
            CMP.B   #4, (A0)
            BEQ     .NARANJA
            CMP.B   #5, (A0)
            BEQ     .BLANCO
            BRA     .ROSA

.ROJO       MOVE.L  #$000000FF, D1
            BRA     .CONTINUE

.AZUL       MOVE.L  #$00FF0000, D1
            BRA     .CONTINUE

.CARNE      MOVE.L  #$00CADDFD, D1
            BRA     .CONTINUE

.NARANJA    MOVE.L  #$000080FF, D1
            BRA     .CONTINUE

.BLANCO     MOVE.L  #$00FFFFFF, D1
            BRA     .CONTINUE

.ROSA       MOVE.L  #$00CB00FF, D1

.CONTINUE
            TRAP    #15
            ADDA.L  #1, A0
            MOVEM.L (A7)+,D0-D6

            RTS
    




*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~1~
*~Tab size~4~
