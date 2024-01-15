; =============================================================================================
; BARREL MANAGEMENT
; =============================================================================================

; ---------------------------------------------------------------------------------------------
BRLINIT
; INITIALIZE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVE.W  #190,BRLPOSX
            MOVE.W  #50,BRLPOSY
            RTS


; ---------------------------------------------------------------------------------------------
BRLUPD
; UPDATE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
BRLPLOT
; PLOT THE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)

            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #BRLPCOL,D1
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #BRLFCOL,D1
            TRAP    #15
            
            ; DEFINE COORDINATES
            MOVE.W  (BRLPOSX),D1
            SUB.W   #BRLRAD,D1
            MOVE.W  (BRLPOSY),D2
            SUB.W   #BRLRAD,D2
            MOVE.W  D1,D3
            ADD.W   #2*BRLRAD,D3
            MOVE.W  D2,D4
            ADD.W   #2*BRLRAD,D4
            
            ; DRAW CIRCLE
            MOVE.B  #88,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
