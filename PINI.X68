; =============================================================================================
; PANTALLA INICIAL
; =============================================================================================
; ---------------------------------------------------------------------------------------------
PUPD
; UPDATE INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D1-D2,-(A7)
            

            BTST.B  #0,(MOUSCLIC)
            BEQ     .END
            CLR.W   D2  ; CONTENDRÁ EL BIT PARA VER SI SALTA O NO A FINAL
            JSR     SBUTCL
            BTST.L  #0,D2
            BEQ     .END

            MOVE.W  #1,D0
.END        MOVEM.L (A7)+,D1-D2
            RTS

; ---------------------------------------------------------------------------------------------
SBUTCL
; CHECK START BUTTON
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
                ; PUNTO DERECHO
            MOVE.W  #BUTPX,D1
            CMP.W   (MOUPOSX),D1
            BGT     .END

                ; PUNTO IZQUIERDO
            ADD.W   #BUTWITH,D1
            CMP.W   (MOUPOSX),D1
            BLT     .END

                ; PUNTO SUPERIOR
            MOVE.W  #SBUTPY,D1
            CMP.W   (MOUPOSY),D1
            BGT     .END

                ; PUNTO INFERIOR
            ADD.W   #BUTHEIG,D1
            CMP.W   (MOUPOSY),D1
            BLT     .END

            MOVE.W  #1,D2

.END        MOVEM.L (A7)+,D0-D1
            RTS

; ---------------------------------------------------------------------------------------------
PPLOT
; POLOT INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0-A1,-(A7)

            ; PRINT BUTTONS
            JSR     BUT1PLOT
            JSR     BUT2PLOT

            ; TEXTO DE LOS BOTONES
            MOVE.B  #21,D0
            MOVE.L  #$00000000,D1
            MOVE.L  #$03160000,D2
            TRAP    #15    

            ; SET FIRST LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #$1705,D1
            TRAP    #15

            ; PRINT FIRST LINE
            LEA     .TXT1,A1
            MOVE.B  #14,D0
            TRAP    #15

            ; SET SECOND LINE POSITION
            MOVE.B  #11,D0
            MOVE.W  #$1608,D1
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

.TXT1       DC.B   'START',0
.TXT2       DC.B   'FPS: 50',0

; ---------------------------------------------------------------------------------------------
BUT1PLOT
; POLOT INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            ; PRINT BUTTONS
                ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #BUTCOLB,D1
            TRAP    #15

                ; DEFINIR COORDENADAS E IMPRIMIR START BUTTON INICIAL.
            MOVE.W  #BUTPX,D1
            MOVE.W  #SBUTPY,D2

            MOVE.W  D1,D3
            ADD.W   #BUTWITH,D3

            MOVE.W  D2,D4
            ADD.W   #BUTHEIG,D4

            MOVE.B  #87,D0
            TRAP    #15

                ; DEFINIR COORDENADAS E IMPRIMIR FPS BUTTON.
            MOVE.B  #81,D0
            MOVE.L  #BUTCOLF,D1
            TRAP    #15

            MOVE.W  #BUTPX,D1

            MOVE.W  #FBUTPY,D2

            MOVE.W  D2,D4
            ADD.W   #BUTHEIG,D4

            MOVE.B  #87,D0
            TRAP    #15

            RTS
; ---------------------------------------------------------------------------------------------
BUT2PLOT
; POLOT INITIAL SCREEN
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            ; PRINT BUTTONS
                ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #BUTCOLF,D1
            TRAP    #15

                ; DEFINIR COORDENADAS E IMPRIMIR START BUTTON INICIAL.
            MOVE.W  #BUTPX+5,D1
            MOVE.W  #SBUTPY+5,D2

            MOVE.W  D1,D3
            ADD.W   #BUTWITH-10,D3

            MOVE.W  D2,D4
            ADD.W   #BUTHEIG-10,D4

            MOVE.B  #87,D0
            TRAP    #15

            RTS


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
