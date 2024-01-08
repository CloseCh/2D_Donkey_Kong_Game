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
            MOVE.W  #400,MAPOINTY

            ; MARIO INITIAL LOOKS TO THE RIGHT
            MOVE.L  #MPR,MAIMAGE
            RTS


; ---------------------------------------------------------------------------------------------
MAUPD
; UPDATE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L  D0-D1,-(A7)

            ; OBTENER POSICION DE MARIO EN EL MAPA, INTRODUCIR EN D0
            LEA     MAPDATA1,A0      ; OBTENER DIRECCION DEL MAPA
            CLR.L   D0              ; LIMPIAR REGISTRO D0
                ; OBTENER COORDENADA Y EN D0 Y COORDENADA X EN D1
            MOVE.W  (MAPOINTY),D0
            MOVE.W  (MAPOINTX),D1

                ; DIVISION POR 32
            LSR.W   #5,D0
            LSR.W   #5,D1
                ; MULTIPLICAR Y SUMAR
            LSL.W   #2,D0
            ADD.W   D0,D1
            LSL.W   #2,D0
            ADD.W   D1,D0

            ; MIRAMOS COLISION
            
            
            
            ; UPDATE COORDINATE X
            MOVE.W  (MAPOINTX),D0
            BTST.B  #0,(KBDVAL)         ; SE HA PULSADO LA TECLA A?
            BEQ     .CHKRGHT            ; NO SE HA PULSADO TECLA A SALTA
            SUB.W   #MASPEED,D0

            CMP.W  #MACONTN/2,(MACONT)
            BGT    .LEFT
            ADDQ.B #1,(MACONT)
            MOVE.L #MRL,MAIMAGE         ; INTRODUCE IMAGEN MARIO IZQUIERDA
            BRA    .FIN

.LEFT       ADDQ.B #1,(MACONT)
            MOVE.L #MRL2,MAIMAGE
            CMP.W  #MACONTN,(MACONT)
            BLE    .FIN
            CLR.W  (MACONT)
            BRA    .FIN

.CHKRGHT    BTST.B  #1,(KBDVAL)         ; SE HA PULSADO LA TECLA D?
            BEQ     .CONT               ; NO SE HA PULSADO TECLA D SALTA
            ADD.W   #MASPEED,D0

            CMP.W  #MACONTN/2,(MACONT)
            BGT    .RIGHT
            ADDQ.B #1,(MACONT)
            MOVE.L #MRR,MAIMAGE         ; INTRODUCE IMAGEN MARIO DERECHA
            BRA    .FIN

.RIGHT      ADDQ.B #1,(MACONT)
            MOVE.L #MRR2,MAIMAGE
            CMP.W  #MACONTN,(MACONT)
            BLE    .FIN
            CLR.W  (MACONT)
            BRA    .FIN
            
            

.CONT       ; NO SE HA PULSADO NINGUNA TECLA
            CMP.L  #MRL,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA IZQUIERDA?
            BNE    .IMGRGHT
            MOVE.L #MPL,MAIMAGE
            BRA    .FIN

.IMGRGHT    CMP.L  #MRR,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA DERECHA?
            BNE    .IMGRGHT2
            MOVE.L #MPR,MAIMAGE
            BRA    .FIN

.IMGRGHT2   CMP.L  #MRR2,(MAIMAGE)            
            BNE    .IMGLEFT2
            MOVE.L #MPR,MAIMAGE
            BRA    .FIN

.IMGLEFT2   CMP.L  #MRL2,(MAIMAGE)
            BNE    .FIN

            MOVE.L #MPL,MAIMAGE
            
.FIN        MOVE.W  D0,(MAPOINTX)

            MOVEM.L (A7)+,D0-D1
            RTS
            
            
            
; ---------------------------------------------------------------------------------------------
MAPLOT
; PLOT THE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0,-(A7) 

            MOVE.W  #MAWIDHT,D0
            MOVE.W  #MAHEIGHT,D1
            MOVE.W  (MAPOINTX),D2
            MOVE.W  (MAPOINTY),D3
            MOVE.L  MAIMAGE,A0
            TRAP    #TRAPPLOT
            
            MOVEM.L (A7)+,D0-D3/A0
           
            RTS



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
