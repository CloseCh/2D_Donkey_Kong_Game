; =============================================================================================
; PANTALLA INICIAL
; =============================================================================================

; ---------------------------------------------------------------------------------------------
PINIT
; INICIAR PANTALLA INICIAL
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------




            RTS



; ---------------------------------------------------------------------------------------------
PUPD
; UPDATE INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            
            
            
            RTS



; ---------------------------------------------------------------------------------------------
PPLOT
; POLOT INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3,-(A7)
            MOVE.B  #80,D0
            MOVE.L  #$000000AA,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$000000FF,D1
            TRAP    #15

            MOVE.B  #87,D0
            MOVE.W  #SCRWIDTH/2-100,D1
            MOVE.W  #SCRHEIGH/2+70,D2
            MOVE.W  D2,D4
            ADD.W   #100,D4
            MOVE.W  D1,D3
            ADD.W   #200,D3
            TRAP    #15



            ; SET BACKGROUND COLOR
            MOVE.B  #81,D0
            MOVE.L  #$00FFFFFF,D1
            TRAP    #15
            
            ; SET FIRST LINE POSITION
            MOVE.B  #11,D0
            MOVE.w  #$7F46,D1
            TRAP    #15

            ; PRINT FIRST LINE
            MOVE.B  #14,D0
            LEA     TEXT,A1
            TRAP    #15


TEXT       DC.B    'START',0

            MOVEM.L (A7)+,D0-D3
            RTS












*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
