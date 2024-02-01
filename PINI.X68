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
            BTST.B  #0,(MOUSCLIC)
            BEQ     .END
            MOVE.W  #1,D0
.END        
            RTS



; ---------------------------------------------------------------------------------------------
PPLOT
; POLOT INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0-A1,-(A7)

            MOVE.B  #21,D0
            MOVE.L  #$00FFFFFF,D1
            MOVE.L  #$06090002,D2
            TRAP    #15    

            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #$000000FF,D1
            TRAP    #15

            ; SET BACKGROUND COLOR
            MOVE.B  #81,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            ; SET FIRST LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #$060B,D1
            TRAP    #15

            ; PRINT FIRST LINE
            LEA     .TXT1,A1
            MOVE.B  #14,D0
            TRAP    #15

            ; SET SECOND LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #$060C,D1
            TRAP    #15

            ; PRINT SECOND LINE
            LEA     .TXT2,A1
            MOVE.B  #14,D0
            TRAP    #15

            ;PRINT DONKEY KONG
            MOVE.W #DKWIDTH,D0
            MOVE.W #DKHEIGHT,D1
            MOVE.W #380,D2
            MOVE.W #-40,D3
            LEA    DKDW,A0
            TRAP   #TRAPPLOT

            MOVE.W #PCHWIDTH,D0
            MOVE.W #PCHHEIGH,D1
            MOVE.W #80,D2
            MOVE.W #280,D3
            LEA    PWMR,A0
            TRAP   #TRAPPLOT
            MOVEM.L (A7)+,D0-D3/A0-A1
            RTS

.TXT1       DC.B   'CLICK IZQUIERDO ',0
.TXT2       DC.B    'PARA INICIAR PARTIDA',0


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
