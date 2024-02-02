; =============================================================================================
; TITLE       : DONKEY-KONG CLASSIC 2D GAME
; DESCRIPTION : JUEGO DEL DONKEY-KONG
; AUTHOR      : JAUME, WEIYU
; HISTORY     : VERSION 1
; =============================================================================================
			ORG 	$1000
			INCLUDE "MAPL/MAP.X68"
			INCLUDE "IMAGES/IMAGES.X68"
			INCLUDE "LIB/DMMCODE.X68"
			INCLUDE "LIB/DMMCONST.X68"
			INCLUDE "CONST.X68"
			INCLUDE "SYS/SYSCONST.X68"
			INCLUDE "LIB/AGLCODE.X68"
			INCLUDE "LIB/UTLCODE.X68"
			INCLUDE "SYS/DRAW.X68"
			INCLUDE "SYS/SYSTEM.X68"
			INCLUDE "CHARACTERS/MARIO.X68"
		  	INCLUDE "CHARACTERS/DONKEY_KONG.X68"
			INCLUDE "CHARACTERS/PEACH.X68"
			INCLUDE "ITEMS/BARREL.X68"
			INCLUDE "PINI.X68"
START

; --- INITIALIZATION --------------------------------------------------------------------------
            
			ORI.W   #$0700,SR       ; DESABILITAR INTERRUPTION
            JSR 	SYSINIT	
			JSR     UTLINIT
			JSR     MAPINIT
	   		JSR 	PCHINIT
      		JSR 	MAINIT
      		JSR 	DKINIT

			

; --- PANTALLA INICIAL ------------------------------------------------------------------------
.INILOOP    TRAP    #TRNMREAD
			BTST.L  #0,D0
			BNE 	.START
			JSR     PUPD
			JSR 	PPLOT
			TRAP	#TRAPSCR
            BRA     .INILOOP
.START		CLR.L	D0
             MOVE.B #SNDMUSIC,D7
			TRAP   #TRAPSND
.LOOP		
			ADDQ.W #1,CONTMUS
			CMP.W  #CONT/20,CONTMUS
			BLT    .CONTINUA
			MOVE.B #SNDMUSIC,D7
			TRAP   #TRAPSND
			CLR.W  CONTMUS
.CONTINUA
; --- UPDATE ----------------------------------------------------------------------------------

; READ INPUT DEVICES --- PARTE LENTA UPDATE IN MEMORY

			TRAP    #TRAPKEY
    
; UPDATE GAME LOGIC --- PARTE DE CALCULOS LOGICOS MODIFICANDO LOS DATOS EN MEMORIA
		    
            JSR 	PCHUPD
            JSR 	MAUPD
            JSR 	DKUPD
			JSR     AGLUPD

; --- SYNC (FASE DE SINCRONIZACION DE LA VELOCIDAD DE EJECUCION CONSTANTE) --------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)


; --- PLOT (DIBUJAR) --------------------------------------------------------------------------
			JSR 	MAPPLOT
			JSR 	PCHPLOT
            JSR 	MAPLOT
            JSR 	DKPLOT
			JSR     AGLPLOT

			
			TRAP	#TRAPSCR
			
			BRA     .LOOP
			
			SIMHALT
			
			INCLUDE "VARS.X68"
			INCLUDE "SYS/SYSVARS.X68"
			INCLUDE "LIB/DMMVARS.X68"
			INCLUDE "LIB/UTLVARS.X68"

			END    START















*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
