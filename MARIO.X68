; =============================================================================================
; MARIO MANAGEMENT
; =============================================================================================

; ---------------------------------------------------------------------------------------------
MAINIT
; INITIALIZE MARIO
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            
            ; SET THE INIT POINT
            MOVE.W  #100,MAPOINTX
            MOVE.W  #430,MAPOINTY
            
            RTS


; ---------------------------------------------------------------------------------------------
MAUPD
; UPDATE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVE.W  D0,-(A7)

            ; UPDATE COORDINATE X
            MOVE.W  (MAPOINTX),D0

            BTST.B  #0,(KBDVAL)
            BEQ     .CHKRGHT                         ; PULSADO 'A' SALTAR
            SUB.W   #MASPEED,D0
.CHKRGHT    BTST.B  #1,(KBDVAL)
            BEQ     .CONT                           ; PULSADO 'DOWN' SALTAR
            ADD.W   #MASPEED,D0
.CONT
            MOVE.W  D0,(MAPOINTX)

            MOVE.W (A7)+,D0
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
MAPLOT
; PLOT THE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------

            MOVEM.L D0-D4,-(A7)
            ; Draw a rectangle (DEBUG)
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$0000FF00,D1
            TRAP    #15

            MOVE.B  #87,D0
            MOVE.W  MAPOINTX,D1
            MOVE.W  MAPOINTY,D2
            MOVE.W  MAPOINTX,D3
            MOVE.W  MAPOINTY,D4

            SUB.W   #MAWIDHT,D1
            SUB.W   #MAHEIGHT,D2
            ADD.W   #MAWIDHT,D3
            ADD.W   #MAHEIGHT,D4

            TRAP    #15

            MOVEM.L (A7)+,D0-D4
            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
