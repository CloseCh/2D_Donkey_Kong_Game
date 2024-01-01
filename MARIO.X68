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
            MOVE.W  #410,MAPOINTY
            MOVE.L  #MPR,MAIMAGE
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

            BTST.B  #0,(KBDVAL) ;SE HA PULSADO LA TECLA A?
            BEQ     .CHKRGHT                         
            SUB.W   #MASPEED,D0
            CMP.L   #MRL,(MAIMAGE)
            BEQ     .LEFT2
            MOVE.L  #MRL,MAIMAGE
            BRA     .FIN
.LEFT2      MOVE.L  #MRL2,MAIMAGE      
            BRA     .FIN
.CHKRGHT    BTST.B  #1,(KBDVAL) ;SE HA PULSADO LA TECLA D?
            BEQ     .CONT                           
            ADD.W   #MASPEED,D0


            MOVE.L  #MRR,MAIMAGE
            BRA     .FIN

.CONT       ; NO SE HA PULSADO NINGUNA TECLA
            CMP.L  #MRL,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA IZQUIERDA?
            BNE    .IMGRGHT
            MOVE.L #MPL,MAIMAGE
            BRA    .FIN
.IMGRGHT    CMP.L  #MRR,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA DERECHA?
            BNE    .FIN
            MOVE.L #MPR,MAIMAGE 
.FIN        MOVE.W  D0,(MAPOINTX)

            MOVE.W (A7)+,D0
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
MAPLOT
; PLOT THE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7) 

            MOVE.W #MAWIDHT,D0
            MOVE.W #MAHEIGHT,D1
            TRAP #TRAPPLOT
            
            MOVEM.L (A7)+,D0-D1
           
            RTS



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
