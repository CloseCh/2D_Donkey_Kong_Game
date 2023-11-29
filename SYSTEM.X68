; =============================================================================================
; SYSTEM 
; =============================================================================================

; ---------------------------------------------------------------------------------------------
SYSINIT
; INITIALIZE SYSTEM.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            JSR SCRINIT

            ; INSTALL SCREEN PLOT TRAP
            MOVE.L  #SCRPLOT,($80+TRNDBUFF*4)
            
            ; PASAR A MODO USUARIO
            MOVE.W  SR,-(A7)
            ANDI.W  #$DFFF,(A7)
            RTE

; ---------------------------------------------------------------------------------------------
SCRINIT
; INIT SCREEN. SET SCREEN RESOLUTION, SET WINDOWED MODE, CREAR SCREEN.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            MOVEM.L D0-D1,-(A7)

            ; SET SCREEN RESOLUTION (SIMULATOR ENVIROMENT 33)
            MOVE.B  #33,D0
            MOVE.L  #SCRWIDTH<<16+SCRHEIGH,D1
            TRAP    #15
            
            ; SET WINDOWED MODE (SIMULATOR ENVIROMENT 33)
            MOVE.L  #1,D1
            TRAP    #15
            
            ; CLEAR SCREEN (TEXT I/O 11)
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15

            ; ENABLE DOUBLE BUFFER
            MOVE.B  #92,D0
            MOVE.W  #17,D1
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1
                        
            RTS

; ---------------------------------------------------------------------------------------------
SCRPLOT
; UPDATES DOUBLE BUFFER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            MOVEM.L D0-D1,-(A7)
            
            ; SWITCH BUFFERS
            MOVE.B  #94,D0
            TRAP    #15
            
            ; CLEAR HIDDEN BUFFER
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1

            RTE

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
