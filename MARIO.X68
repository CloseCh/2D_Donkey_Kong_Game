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
            JSR PLOT

            MOVEM.L (A7)+,D0-D4
            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
