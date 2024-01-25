; =============================================================================================
; BARREL MANAGEMENT
; =============================================================================================

; ---------------------------------------------------------------------------------------------
BRLINIT
; INITIALIZE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
          
            MOVE.W  #210,(BRLPOSX)
            MOVE.W  #50,(BRLPOSY)
            RTS
; ---------------------------------------------------------------------------------------------
BRLUPD
; UPDATE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D1/A1,-(A7)
            ADDQ.W #1,(BRLCONT)
            CMP.W  #BRLCONTN/8,(BRLCONT)
            BGE    .NOCAIDA
            MOVE.W  #0,(BRLVELX)
            MOVE.W #BRLSPEED,(BRLVELY)
            BRA .FIN

.NOCAIDA    CMP.W #BRLCONTN/8,(BRLCONT)
            BNE   .CONTINUA
            JSR UTLRAND
            AND.L #$00000004,D0
            LEA   .VELVEC,A1
            MOVE.L (A1,D0),(BRLVELX)
.CONTINUA   
            CMP.W #BRLCONTN,(BRLCONT)
            BLE   .FIN
            CLR.W (BRLCONT)
.FIN
            MOVE.W (BRLPOSY),D0
            MOVE.W (BRLPOSX),D1
            ADD.W  (BRLVELY),D0
            ADD.W  (BRLVELX),D1
            MOVE.W D0,(BRLPOSY)
            MOVE.W D1,(BRLPOSX)
            MOVEM.L (A7)+,D0-D1/A1
            RTS
            
.VELVEC     DC.W  -BRLSPEED,0  ;0,2
            DC.W   BRLSPEED,0  ;4,6            
            
; ---------------------------------------------------------------------------------------------
BRLPLOT
; PLOT THE BARREL.
; INPUT     :
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D4,-(A7)

            ; SET PEN COLOR
            MOVE.B  #80,D0
            MOVE.L  #BRLPCOL,D1
            TRAP    #15
            
            ; SET FILL COLOR
            MOVE.B  #81,D0
            MOVE.L  #BRLFCOL,D1
            TRAP    #15
            
            ; DEFINE COORDINATES
            MOVE.W  (BRLPOSX),D1
            SUB.W   #BRLRAD,D1
            MOVE.W  (BRLPOSY),D2
            SUB.W   #BRLRAD,D2
            MOVE.W  D1,D3
            ADD.W   #2*BRLRAD,D3
            MOVE.W  D2,D4
            ADD.W   #2*BRLRAD,D4
            
            ; DRAW CIRCLE
            MOVE.B  #88,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D4

            RTS




*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
