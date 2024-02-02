; =============================================================================================
; FPS PLOT FILE
; =============================================================================================
			
; ---------------------------------------------------------------------------------------------
FPSPLOT
; PLOT FPS
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D1/A1,-(A7)
            
            ; TEXTO DE LOS BOTONES
            MOVE.B  #21,D0
            MOVE.L  #$00FFFFFF,D1
            MOVE.L  #$03090000,D2
            TRAP    #15  

            ; SET BACKGROUND COLOR
            MOVE.B  #81,D0
            MOVE.L  #FPSCOL,D1
            TRAP    #15

            ; SET FIRT PART POSITION
            MOVE.B  #11,D0
            MOVE.W  #$4D01,D1
            TRAP    #15
            
            ; PRINT FIRST PART
            LEA     .TXT1,A1
            CLR.L   D1
            MOVE.W  #SCRFPS,D1
            MOVE.B  #17,D0
            TRAP    #15

            ; SET SECOND PART POSITION
            MOVE.B  #11,D0
            MOVE.W  #$4D02,D1
            TRAP    #15

            ; PRINT SECOND PART
            LEA     .TXT2,A1
            CLR.L   D1
            MOVE.W  (FPS),D1
            MOVE.B  #17,D0
            TRAP    #15

            ; SET THIRD PART POSITION
            MOVE.B  #11,D0
            MOVE.W  #$5701,D1
            TRAP    #15

            ; PRINT THIRD PART
            LEA     .TXT3,A1
            MOVE.B  #14,D0
            TRAP    #15

            ; SET FOURTH PART POSITION
            MOVE.B  #11,D0
            MOVE.W  #$5702,D1
            TRAP    #15

            ; PRINT FOURTH PART
            LEA     .TXT3,A1
            MOVE.B  #14,D0
            TRAP    #15

            MOVEM.L (A7)+,D0-D1/A1
            RTS

.TXT1       DC.B    'GOAL  :',0
.TXT2       DC.B    'ACTUAL:',0
.TXT3       DC.B    'FPS',0

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
