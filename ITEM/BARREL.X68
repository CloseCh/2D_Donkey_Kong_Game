; =============================================================================================
; BARREL MANAGEMENT (AGENT)
; BRLPOSX (W)  (A0)
; BRLPOSY (W) 2(A0)
; BRLVELX (W) 4(A0)
; BRLVELY (W) 6(A0)
; BRLCONT (W) 8(A0)
; =============================================================================================

; ---------------------------------------------------------------------------------------------
BRLINIT
; INITIALIZE BARREL.
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
          
            MOVE.W  #210,(A0)
            MOVE.W  #50,2(A0)
            RTS
; ---------------------------------------------------------------------------------------------
BRLUPD
; UPDATE BARREL.
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
; OUTPUT    :
; MODIFIES  :
; ---------------------------------------------------------------------------------------------
            MOVEM.L D0-D1/A1,-(A7)
            ADDQ.W #1,8(A0)
            CMP.W  #BRLCONTN/8,8(A0)
            BGE    .NOCAIDA
            MOVE.W  #0,4(A0)
            MOVE.W #BRLSPEED,6(A0)
            BRA .FIN

.NOCAIDA    CMP.W #BRLCONTN/8,8(A0)
            BNE   .CONTINUA
            JSR UTLRAND
            AND.L #$00000004,D0
            LEA   .VELVEC,A1
            MOVE.L (A1,D0),4(A0)
.CONTINUA   
            CMP.W #BRLCONTN,8(A0)
            BLE   .FIN
            CLR.W 8(A0)
.FIN
            MOVE.W  (A0),D0
            MOVE.W 2(A0),D1
            ADD.W  4(A0),D0
            ADD.W  6(A0),D1

            ; CHECK HORIZONTAL COLLISIONS
            CMP.W   #SCRWIDTH-BRLRAD-2*BLCWIDTH,D0
            BGT     .COLRGT
            CMP.W   #BRLRAD+2*BLCWIDTH,D0
            BLT     .COLLFT
            BRA     .DONE

            ; RIGHT SIDE COLLISION
.COLRGT     NEG.W   4(A0)
            MOVE.W  #SCRWIDTH-BRLRAD-2*BLCWIDTH,D0
            BRA     .DONE
            
            ; LEFT SIDE COLLISION
.COLLFT     NEG.W   4(A0)
            MOVE.W  #BRLRAD+2*BLCWIDTH,D0
            BRA     .DONE


.DONE       MOVE.W D0,(A0)
            MOVE.W D1,2(A0)
            MOVEM.L (A7)+,D0-D1/A1
            RTS
            
.VELVEC     DC.W  -BRLSPEED,0  ;0,2
            DC.W   BRLSPEED,0  ;4,6            
            
; ---------------------------------------------------------------------------------------------
BRLPLOT
; PLOT THE BARREL.
; INPUT     : A0 POINTER TO THE INSTANCE VARIABLES
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
            MOVE.W  (A0),D1
            SUB.W   #BRLRAD,D1
            MOVE.W  2(A0),D2
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
