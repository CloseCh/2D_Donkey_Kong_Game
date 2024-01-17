; =============================================================================================
; PEACH MANAGEMENT
; =============================================================================================

; ---------------------------------------------------------------------------------------------
PCHINIT
; INITIALIZE PEACH.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVE.W #-3,PCHPOSY
            MOVE.L #PHELP,PCHIMAGE
            RTS


; ---------------------------------------------------------------------------------------------
PCHUPD
; UPDATE PEACH.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            
            CMP.W   #CONT/2,(PCHCONT) ;SI ES MENOR PEACH SUBE
            BGT     .NEXTSTEP
            ADDQ.B  #1,(PCHCONT)
            SUBQ.W  #4,(PCHPOSY)
            BRA     .FIN

.NEXTSTEP   ADDQ.B  #1,(PCHCONT) ; PEACH BAJA
            ADDQ.W  #4,(PCHPOSY)
            CMP.W   #CONT,(PCHCONT)
            BLE     .FIN
            CLR.W   (PCHCONT)

.FIN
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
PCHPLOT
; PLOT THE PEACH.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0,-(A7) 

            MOVE.W #PCHWIDTH,D0
            MOVE.W #PCHHEIGH,D1
            MOVE.W #PCHPOSX,D2
            MOVE.W (PCHPOSY),D3
            MOVE.L PCHIMAGE,A0
            TRAP #TRAPPLOT
            
            MOVEM.L (A7)+,D0-D3/A0

            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
