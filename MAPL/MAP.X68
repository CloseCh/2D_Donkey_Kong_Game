; =============================================================================================
; MAP
; =============================================================================================
; ------------------------------------------------------------------------------
MAPINIT
; INIT. THE MAP
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
             MOVEM.L D0-D4/A1-A2,-(A7)
            ; CLOSE ALL FILES
            MOVE.B #50,D0
            TRAP   #15

            JSR    UTLRAND
            AND.L  #$00000003,D0
            MULU   #15,D0
            LEA    MAPVEC,A1
            ADD.L  D0,A1
            ; OPEN EXISTING FILE            
            ;LEA     MAPVEC,A1  ;NULL TERMINATED FILE NAME
            MOVE.B  #51,D0
            TRAP #15
            
            ;READ FILE
            LEA CONTENIDO,A1
            MOVE.L #MAPA,A2
            MOVE.W #327,D4 ;NUMERO DE BYTES TOTALES
.LOOP       MOVE.W #1,D2 ; NUMERO DE BYTES A LEER
            MOVE.B #53,D0
            TRAP #15
            
            ;SET POSITION
            MOVE.B #55,D0
            MOVE.W (CONTADOR),D2
            TRAP #15
            
            ;STORE BYTE
            MOVE.B (CONTENIDO),D3
            CMP.B  #$0A,D3 ;TRATAMIENTO DE LOS BITS DE FIN DE LINEA
            BEQ    .SIGUE
            AND.B  #00000011,D3
            CMP.B  #$09,D3 ;TRATAMIENTO DE LOS BITS DE FIN DE LINEA
            BEQ    .SIGUE
            MOVE.B  D3,(A2)
            ADDA.L #1,A2
.SIGUE
            ADDQ.W  #1,(CONTADOR)
            DBRA  D4,.LOOP
            MOVEM.L (A7)+,D0-D4/A1-A2
            RTS

CONTADOR  DC.W  1
MAPVEC    DC.B 'MAPL/MAPA1.txt',0 ;0
          DC.B 'MAPL/MAPA2.txt',0 ;1
          DC.B 'MAPL/MAPA3.txt',0 ;2
          DC.B 'MAPL/MAPA4.txt',0 ;3

CONTENIDO DC.B  1,0
           DC.W  0

; ------------------------------------------------------------------------------
MAPPLOT
; PLOTS THE MAP
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D7/A0,-(A7)

            MOVE.L  #MAPA,A0 ;LEER EL DIRECCION DEL MAPA
            CLR.W   D2

            MOVE.W  #(BLCHEIGH/2)+2,D4
            MOVE.W  #(SCRHEIGH/BLCHEIGH)-1,D6 ; VECES DE INTERACIÓN POR Y: REINICIAR PARA DIBUJAR LA FILA COMPLETA
            
.CLOOP      CLR.W   D1
            MOVE.W  #BLCWIDTH,D3
            MOVE.W  #(SCRWIDTH/BLCWIDTH)-1,D5 ; VECES DE INTERACIÓN POR X: REINICIAR PARA DIBUJAR LA FILA COMPLETA
            
.RLOOP      MOVE.B  (A0)+,D7 ; A0 APUNTA A LAS POSICIONES DEL MAPA MODIFICANDO EL FLAG Z 
            BTST.L  #1,D7
            BEQ     .BL1

            ADD.W   #(BLCWIDTH/2)+2,D4  ;PARA DIBUJAR CORRECTAMENTE EL RECUADRO
            JSR     BL2PLOT
            SUB.W   #(BLCWIDTH/2)+2,D4  ;PARA POSICIONAR CORRECTAMENTE LA COORDENADA

.BL1        BTST.L  #0,D7
            BEQ     .NEXT
            JSR     BL1PLOT
            

.NEXT       MOVE.W  D3,D1
            ADD.W   #BLCWIDTH,D3
            DBRA.W  D5,.RLOOP
            
            ; AQUI SE BAJA A LA SIGUIENTE FILA, VOLVIEDO AL INICIO DE X Y BAJAR Y
            ADD.W   #(B1SIZEH-4),D4  ;PARA POSICIONAR CORRECTAMENTE LA SIGUIENTE COORDENADA DEL RECUADRO
            MOVE.W  D4,D2
            ADD.W   #B1SIZEH,D4
            DBRA.W  D6,.CLOOP


            MOVEM.L (A7)+,D0-D7/A0

            RTS
; ------------------------------------------------------------------------------
BL1PLOT
; PLOTS A BLOCK 1 (PATH)
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1/D5,-(A7)
            MOVE.L  D1,D5
            ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$001D17D8,D1
            TRAP    #15

            MOVE.L  D5,D1
            MOVE.B  #87,D0
            TRAP    #15
            MOVEM.L (A7)+,D0-D1/D5
            RTS
; ------------------------------------------------------------------------------
BL2PLOT
; PLOTS A BLOCK 2 (LADDER)
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D5,-(A7)
            MOVE.L  D1,D5
            ; SE DEFINE COLORES
            MOVE.B  #80,D0
            MOVE.L  #$00000000,D1
            TRAP    #15

            MOVE.B  #81,D0
            MOVE.L  #$00FF0000,D1
            TRAP    #15


            ; PALO IZQUIERDO DE LA ESCALERA    
            MOVE.L  D5,D1
            SUB.W   #28,D3
            MOVE.B  #87,D0
            TRAP    #15

            ;PALO DERECHO DE LA ESCALERA
            ADD.W   #20,D1
            ADD.W   #20,D3
            TRAP    #15

            ;ESCALONES INTERMEDIOS
            SUB.W  #20,D1
            SUB.W  #10,D4
            ADD.W  #22,D2
            TRAP   #15

            SUB.W  #16,D2
            SUB.W  #16,D4
            TRAP   #15

            MOVEM.L (A7)+,D0-D5
            RTS




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
