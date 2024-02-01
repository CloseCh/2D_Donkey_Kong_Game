; =============================================================================================
; SYSTEM 
; =============================================================================================

; ---------------------------------------------------------------------------------------------
SYSINIT
; INITIALIZE SYSTEM.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            ; INSTALL SCREEN PLOT TRAP
            MOVE.L  #SCRPLOT,($80+TRAPSCR*4)
            ; INSTALL KEY TRAP
            MOVE.L  #KBDUPD,($80+TRAPKEY*4)
            ; INSTALL PLOT TRAP
            MOVE.L  #PLOT,($80+TRAPPLOT*4)
            ; INSTALL MOUSE TRAP
            MOVE.L  #MOUREAD,($80+TRNMREAD*4)
            ; INSTALL SOUND TRAP
            MOVE.L  #SNDPLAY,($80+TRAPSND*4)
            ; INSTALL INTERRUPTION FOR THE PLOT
            MOVE.L  #SCRTIM,($60+SCRINTN*4)

            JSR     SCRINIT
            JSR     KBDINIT
            JSR     MOUINIT
            JSR     SNDINIT
            JSR     DMMINIT
            ; SWITCH TO USER
            MOVE.W  SR,-(A7)
            ANDI.W  #$D8FF,(A7)
            RTE

; ------------------------------------------------------------------------------
SNDINIT
; SOUND SYSTEM INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1/A0-A1,-(A7)
            CLR.B   D1
            LEA     .SNDLIST,A0
.LOOP       MOVE.L  (A0)+,D0
            BEQ     .DONE
            MOVE.L  D0,A1
            MOVE.B  #74,D0
            TRAP    #15
            ADDQ.B  #1,D1
            BRA     .LOOP
.DONE       MOVEM.L (A7)+,D0-D1/A0-A1
            RTS
.SNDMUSIC   DC.B    'SND/music.wav',0
.SNDRESTA   DC.B    'SND/restart.wav',0
.SNDJUMP    DC.B    'SND/jump.wav',0
.SNDVICTO   DC.B    'SND/victory.wav',0
.SNDLIST    DC.L    .SNDMUSIC,.SNDRESTA,.SNDJUMP,.SNDVICTO,0           
; ------------------------------------------------------------------------------
SNDPLAY
; PLAY SOUND
; INPUT    : D7 SOUND ID
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.W D0-D1,-(A7)
            MOVE.B  #75,D0
            MOVE.B  D7,D1
            MOVE.L  #0,D2
            TRAP    #15
            MOVEM.W (A7)+,D0-D1
            RTE
; ---------------------------------------------------------------------------------------------
SCRINIT
; INIT SCREEN. SET SCREEN RESOLUTION, SET WINDOWED MODE, CREAR SCREEN.
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            MOVEM.L D0-D1,-(A7)

            ; SET SCREEN RESOLUTION (SIMULATOR ENVIROMENT 33)
            MOVE.B  #33,D0
            MOVE.L  #SCRWIDTH<<16+SCRHEIGH,D1
            TRAP    #15
            
            ; SET WINDOWED MODE (SIMULATOR ENVIROMENT 33)
            MOVE.L  #1,D1
            TRAP    #15
            
            ; CLEAR SCREEN (TEXT I/O 11)
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15

            ; ENABLE DOUBLE BUFFER
            MOVE.B  #92,D0
            MOVE.W  #17,D1
            TRAP    #15

            ; ENABLE TIMED INTERRUPT
            MOVE.B  #32,D0
            MOVE.B  #6,D1
            MOVE.B  #$80+SCRINTN,D2
            MOVE.L  #1000/SCRFPS,D3              ;50 FOTOGRAMA POR SEGUNDO 20ms
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1
                        
            RTS

; ---------------------------------------------------------------------------------------------
SCRPLOT
; UPDATES DOUBLE BUFFER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            MOVEM.L D0-D1,-(A7)
            
            ; SWITCH BUFFERS
            MOVE.B  #94,D0
            TRAP    #15
            
            ; CLEAR HIDDEN BUFFER
            MOVE.B  #11,D0
            MOVE.W  #$FF00,D1
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1

            RTE

; ---------------------------------------------------------------------------------------------
SCRTIM
; TIMED INTERRUPT SERVICE ROUTINE
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            ADDQ.B  #1,(SCRINTCT)
            
            RTE

; ---------------------------------------------------------------------------------------------
KBDINIT
; INIT KEYBOARD
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            CLR.B   (KBDVAL)
            CLR.B   (KBDEDGE)
            RTS
            
; ---------------------------------------------------------------------------------------------
KBDUPD
; UPDATE KEYBOARD INFO
; 7 ->  N       WAIT ASIGNATION
; 6 ->  M       WAIT ASIGNATION
; 5 ->  P       PAUSE
; 4 ->  SPACE   JUMP
; 3 ->  S       DOWM
; 2 ->  W       UP
; 1 ->  D       LEFT
; 0 ->  A       RIGHT
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ---------------------------------------------------------------------------------------------
            
            MOVEM.L D0-D3,-(A7)
            
            ; (TEXT I/O)
            ; READ FIRST PART
            MOVE.B  #19,D0
            MOVE.L  #KBDFIRE2<<24+KBDFIRE1<<16+KBDPAUSE<<8+KBDSPACE,D1
            TRAP    #15
            
            ; CONVERT TO DESIRED FORMAT
            JSR     .PACK
            
            ; READ SECOND PART
            MOVE.L  #KBDDOWN<<24+KBDUP<<16+KBDRIGHT<<8+KBDLEFT,D1
            TRAP    #15
            
            ; CONVERT TO DESIRED FORMAT
            JSR     .PACK
            
            ; COMPUTE KBDEDGE
            MOVE.B  (KBDVAL),D0
            NOT.B   D0
            AND.B   D2,D0
            MOVE.B  D0,(KBDEDGE)
            
            ; STORE KBDVAL
            MOVE.B  D2,(KBDVAL)
            
            MOVEM.L (A7)+,D0-D3
            
            RTE
            
.PACK       MOVE.W  #3,D3
.LOOP       LSL.L   #8,D1
            ROXL.B  #1,D2
            DBRA.W  D3,.LOOP

            RTS

; ------------------------------------------------------------------------------
MOUINIT
; INITS MOUSE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            CLR.L   (MOUPOSY)
            CLR.W   (MOUBUT)
            RTS

; ------------------------------------------------------------------------------
MOUREAD
; READS MOUSE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D1,-(A7)
            MOVE.B  #61,D0
            CLR.B   D1
            TRAP    #15
            MOVE.L  D1,(MOUPOSY)
            MOVE.B  (MOUBUT),D1
            MOVE.B  D0,(MOUBUT)
            NOT.B   D1
            AND.B   D1,D0
            MOVE.B  D0,(MOUEDGE)
            MOVEM.L (A7)+,D0-D1
            RTE

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
