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
            MOVE.W  #300,MAPOINTY
            MOVE.W  #0,MACONTRO
            MOVE.W  #0,MACONTJP
            ; MARIO INITIAL LOOKS TO THE RIGHT
            MOVE.L  #MPR,MAIMAGE
            RTS


; ---------------------------------------------------------------------------------------------
MAUPD
; UPDATE MARIO. COLISIONES, SALTOS, CAMINAR.
; MOVIMIENTOS : SUBIR/BAJAR ESCALERAS, MOVIMIENTOS LATERALES.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D6/A0,-(A7)
            MOVE.W  (MACONTRO),D6       ; INTRODUCIR DATOS DE CONTROL DE MARIO A D6

            JSR     MAJMP
            BTST.L  #2,D6
            BNE     .NCOLINF            ; SUBIENDO COORDENADAS NO VER COLISION INFERIOR.
            JSR     MACOLINF
            

            ; UPDATE COORDINATE X
.NCOLINF    MOVE.W  (MAPOINTX),D0
            BTST.B  #0,(KBDVAL)         ; SE HA PULSADO LA TECLA A?
            BEQ     .CHKRGHT            ; NO SE HA PULSADO TECLA A SALTA
            SUB.W   #MASPEED,D0

            CMP.W   #CONT/2,(MACONT)
            BGT     .LEFT
            ADDQ.B  #1,(MACONT)
            MOVE.L  #MRL,MAIMAGE         ; INTRODUCE IMAGEN MARIO IZQUIERDA
            BRA     .FIN

.LEFT       ADDQ.B  #1,(MACONT)
            MOVE.L  #MRL2,MAIMAGE
            CMP.W   #CONT,(MACONT)
            BLE     .FIN
            CLR.W   (MACONT)
            BRA     .FIN

.CHKRGHT    BTST.B  #1,(KBDVAL)         ; SE HA PULSADO LA TECLA D?
            BEQ     .CONT               ; NO SE HA PULSADO TECLA D SALTA
            ADD.W   #MASPEED,D0

            CMP.W   #CONT/2,(MACONT)
            BGT     .RIGHT
            ADDQ.B  #1,(MACONT)
            MOVE.L  #MRR,MAIMAGE         ; INTRODUCE IMAGEN MARIO DERECHA
            BRA     .FIN

.RIGHT      ADDQ.B  #1,(MACONT)
            MOVE.L  #MRR2,MAIMAGE
            CMP.W   #CONT,(MACONT)
            BLE     .FIN
            CLR.W   (MACONT)
            BRA     .FIN
            
            

.CONT       ; NO SE HA PULSADO NINGUNA TECLA
            CMP.L   #MRL,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA IZQUIERDA?
            BNE     .IMGRGHT
            MOVE.L  #MPL,MAIMAGE
            BRA     .FIN

.IMGRGHT    CMP.L   #MRR,(MAIMAGE) ;LA ULTIMA TECLA HA SIDO A LA DERECHA?
            BNE     .IMGRGHT2
            MOVE.L  #MPR,MAIMAGE
            BRA     .FIN

.IMGRGHT2   CMP.L   #MRR2,(MAIMAGE)
            BNE     .IMGLEFT2
            MOVE.L  #MPR,MAIMAGE
            BRA     .FIN

.IMGLEFT2   CMP.L   #MRL2,(MAIMAGE)
            BNE     .FIN

            MOVE.L  #MPL,MAIMAGE
            
.FIN        MOVE.W  D0,(MAPOINTX)

            MOVEM.L (A7)+,D0-D6/A0
            RTS

; ---------------------------------------------------------------------------------------------
MAJMPINI
; INICIAR SALTO DE MARIO
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            ; SE HA PULSADO EL ESPACIO?
            BTST.B  #4,(KBDVAL)
            BEQ     .END        ; NO SE PUEDE SALTAR
            MOVE.W  #MAJUMPT,(MACONTJP)
            ADDQ.W  #6,(MACONTRO)
.END
            RTS

; ---------------------------------------------------------------------------------------------
MAJMP
; INICIAR SALTO DE MARIO
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVE.L  D0,-(A7)
             
            MOVE.W  (MACONTRO),D0
            BTST.L  #1,D0
            BEQ     .END    ; FINALIZAR SI NO ESTA SALTANDO.
            SUBQ.W  #MASPEED-3,(MAPOINTY)
            SUBQ.W  #1,(MACONTJP)
            BNE     .END
            MOVE.W  #1,(MACONTRO)

            
.END        MOVE.L  (A7)+,D0
            RTS

; ---------------------------------------------------------------------------------------------
MASTAIRS
; SUBIR ESCALERAS
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------

            RTS

; ---------------------------------------------------------------------------------------------
MACOLINF
; COLISION INFERIOR DE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0,-(A7)

            ; OBTENER POSICION DE MARIO EN EL MAPA, INTRODUCIR EN D0
            LEA     MAPDATA2,A0      ; OBTENER DIRECCION DEL MAPA
            CLR.L   D0
            CLR.L   D1
            CLR.L   D2
            CLR.L   D3
                ; OBTENER COORDENADA Y EN D0 Y COORDENADA X EN D1
            MOVE.W  (MAPOINTY),D0
            MOVE.W  (MAPOINTX),D1
                ; DIVISION POR 32
            LSR.W   #5,D0
            LSR.W   #5,D1
                ; SALVAR DATOS
            MOVE.W  D0,D2
            MOVE.W  D1,D3
                ; MULTIPLICAR Y SUMAR
            LSL.W   #2,D0
            ADD.W   D0,D1
            LSL.W   #2,D0
            ADD.W   D1,D0

            ; PARA CAMINAR
            ; MIRAMOS COLISION CON (A0,D0) 
            MOVE.B  (A0,D0),D7
            BTST.L  #1,D7
            BNE     .END2           ; VER SI YA ESTA PISANDO BLOQUE
            ; VER SI DEBAJO HAY BLOQUE
            MOVE.W  D2,D0
            MOVE.W  D3,D1
            LSL.W   #2,D0
            ADD.W   D0,D1
            LSL.W   #2,D0
            ADD.W   D1,D0

            MOVE.B  (A0,D0),D7
            BEQ     .SUBEXE         ; SI NO SALTAR
            ; SI ES UNA EXCALERA SALTAR
            BTST.L  #1,D7
            BNE     .SUBEXE

            ; REALIZACIÓN DE CALCULOS DE COLISION EN EJE Y
            ADDQ.W  #1,D2
            LSL.W   #5,D2
            MOVE.W  (MAPOINTY),D0

                ; SI ES MENOR O IGUAL COLISIÓN.
            SUB.W   D2,D0
            BLS     .END1
                ; DECREMENTAR PUNTO DE MARIO EN MASPEED
.SUBEXE     ADDQ.W  #MASPEED,(MAPOINTY)
            BRA     .END2

.END1       JSR     MAJMPINI

.END2       MOVEM.L (A7)+,D0-D3/A0

            RTS

; ---------------------------------------------------------------------------------------------
MAPLOT
; PLOT THE MARIO.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D3/A0,-(A7) 

            MOVE.W  #MAWIDTH,D0
            MOVE.W  #MAHEIGHT,D1
            MOVE.W  (MAPOINTX),D2
            MOVE.W  (MAPOINTY),D3
            SUB.W   #40,D3 ; 
            MOVE.L  MAIMAGE,A0
            TRAP    #TRAPPLOT
            
            MOVEM.L (A7)+,D0-D3/A0
           
            RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
