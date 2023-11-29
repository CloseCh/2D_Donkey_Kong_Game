; =============================================================================================
; MAP
; =============================================================================================

; ------------------------------------------------------------------------------
MAPUPD
; SWITCHES A CELL MAP VALUE IF POINTED BY MOUSE AND CLICKED.
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            RTS


; ------------------------------------------------------------------------------
MAPPLOT
; PLOTS THE MAP
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D7/A0,-(A7)

            LEA     MAPDATA1,A0
            CLR.W   D2
            MOVE.W  #BLCHEIGH/2,D4
            MOVE.W  #(SCRHEIGH/BLCHEIGH)-1,D6
            
.CLOOP      CLR.W   D1
            MOVE.W  #BLCWIDTH,D3
            MOVE.W  #(SCRWIDTH/BLCWIDTH)-1,D5 ; VECES DE INTERACIÓN POR X: REINICIAR PARA DIBUJAR LA FILA COMPLETA
            
.RLOOP      MOVE.B  (A0)+,D7 ; A0 APUNTA A LAS POSICIONES DEL MAPA MODIFICANDO EL FLAG Z 
            BTST.L  #1,D7
            BEQ     .BL1
            ADD.W   #BLCWIDTH/2,D4  ;PARA DIBUJAR CORRECTAMENTE EL RECUADRO
            JSR     BL2PLOT
            SUB.W   #BLCWIDTH/2,D4  ;PARA POSICIONAR CORRECTAMENTE LA COORDENADA

.BL1        BTST.L  #0,D7
            BEQ     .NEXT
            JSR     BL1PLOT
            

.NEXT       MOVE.W  D3,D1
            ADD.W   #BLCWIDTH,D3
            DBRA.W  D5,.RLOOP
            ; AQUI SE BAJA A LA SIGUIENTE FILA, VOLVIEDO AL INICIO DE X Y BAJAR Y
            ADD.W   #BLCWIDTH/2,D4  ;PARA POSICIONAR CORRECTAMENTE LA SIGUIENTE COORDENADA
            MOVE.W  D4,D2
            ADD.W   #BLCWIDTH/2,D4
            DBRA.W  D6,.CLOOP


            MOVEM.L (A7)+,D0-D7/A0

            RTS
; ------------------------------------------------------------------------------
BL1PLOT
; PLOTS A BLOCK 1 (PATH)
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1/D5,-(A7)
            MOVE.L  D1,D5
            ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$001D17D8,D1
            TRAP    #15

            MOVE.L  D5,D1
            MOVE.B  #87,D0
            TRAP    #15
            MOVEM.L (A7)+,D0-D1/D5
            RTS
; ------------------------------------------------------------------------------
BL2PLOT
; PLOTS A BLOCK 2 (LADDER)
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1/D5,-(A7)
            MOVE.L  D1,D5
            ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$00FF0000,D1
            TRAP    #15

            MOVE.L  D5,D1
            MOVE.B  #87,D0
            TRAP    #15
            MOVEM.L (A7)+,D0-D1/D5
            RTS

; --- DATA ---------------------------------------------------------------------

MAPDATA1    DC.B    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
            DC.B    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
            DC.B    0,0,1,1,1,1,0,0,0,0,0,0,1,3,1,0,0,0,0,0
            DC.B    0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0
            DC.B    0,0,1,3,1,1,3,1,1,1,1,1,1,1,1,1,1,1,0,0
            DC.B    0,0,0,2,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
            DC.B    0,0,1,1,1,1,1,1,1,1,1,1,3,1,1,1,3,1,0,0
            DC.B    0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,2,0,0,0
            DC.B    0,0,1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,0,0
            DC.B    0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
            DC.B    0,0,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,0,0
            DC.B    0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0
            DC.B    0,0,1,1,1,3,1,1,1,1,1,1,1,1,1,3,1,1,0,0
            DC.B    0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0
            DC.B    0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
