; =============================================================================================
; DONKEY-KONG MANAGEMENT
; =============================================================================================

; ---------------------------------------------------------------------------------------------
DKINIT
; INITIALIZE DONKEY-KONG.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVE.L #DKDL,DKIMAGE
            RTS


; ---------------------------------------------------------------------------------------------
DKUPD
; UPDATE DONKEY-KONG.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
           
            CMP.W  #DKCONTN/2,(DKCONT)
            BGT    .DKRIGHT
            ADDQ.B #1,(DKCONT)
            MOVE.L #DKDL,DKIMAGE
            BRA    .FIN
.DKRIGHT    ADDQ.B #1,(DKCONT)
            MOVE.L #DKDR,DKIMAGE
            CMP.W  #DKCONTN,(DKCONT)
            BLE    .FIN
            CLR.W  (DKCONT)
            BRA    .FIN
.FIN
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
DKPLOT
; PLOT DONKEY-KONG.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0,-(A7) 

            MOVE.W #DKWIDTH,D0
            MOVE.W #DKHEIGHT,D1
            MOVE.W #DKPOSX,D2
            MOVE.W #DKPOSY,D3
            MOVE.L DKIMAGE,A0
            TRAP #TRAPPLOT
            
            MOVEM.L (A7)+,D0-D3/A0
            
            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
