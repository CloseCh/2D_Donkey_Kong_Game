; =============================================================================================
; SYSTEM 
; =============================================================================================

; ---------------------------------------------------------------------------------------------
SYSINIT
; INITIALIZE SYSTEM.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            JSR SCRINIT

            MOVE.W  SR,-(A7)
            ANDI.W  #$D8FF,(A7)
            RTE

; ------------------------------------------------------------------------------
SCRINIT
; INIT SCREEN. SET SCREEN RESOLUTION, SET WINDOWED MODE, CLEAR SCREEN,
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)

            ; SET SCREEN RESOLUTION
            MOVE.B  #33,D0
            MOVE.L  #SCRWIDTH<<16|SCRHEIGH,D1
            TRAP    #15
            
            ; SET WINDOWED MODE
            MOVE.L  #1,D1
            TRAP    #15
            
            ; CLEAR SCREEN
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15

            ; ENABLE DOUBLE BUFFER
            MOVE.B  #92,D0
            MOVE.B  #17,D1
            TRAP    #15

            MOVEM.L (A7)+,D0-D1

            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
