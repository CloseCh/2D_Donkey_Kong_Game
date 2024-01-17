; =============================================================================================
; TITLE       : DONKEY-KONG CLASSIC 2D GAME
; DESCRIPTION : JUEGO DEL DONKEY-KONG
; AUTHOR      : JAUME, WEIYU
; HISTORY     : VERSION 1
; =============================================================================================
			ORG 	$1000
			
			INCLUDE "IMAGES.X68"
			INCLUDE "CONST.X68"
			INCLUDE "SYS/SYSCONST.X68"
			INCLUDE "SYS/DRAW.X68"
			INCLUDE "SYS/SYSTEM.X68"
			INCLUDE "MAPL/MAPDATA.X68"
			INCLUDE "MAPL/MAP.X68"
			INCLUDE "CHARACTERS/MARIO.X68"
		  	INCLUDE "CHARACTERS/DONKEY_KONG.X68"
			INCLUDE "CHARACTERS/PEACH.X68"
			INCLUDE "ITEM/BARREL.X68"
			INCLUDE "ITEM/HAMMER.X68"
			
START

; --- INITIALIZATION --------------------------------------------------------------------------
            
			ORI.W   #$0700,SR       ; DESABILITAR INTERRUPTION
			JSR 	SYSINIT
	   		JSR 	PCHINIT
      		JSR 	MAINIT
      		JSR 	DKINIT
      		JSR 	BRLINIT
	    	JSR 	HMRINIT

			

; --- PANTALLA INICIAL ------------------------------------------------------------------------
; .INILOOP    


            ; BRA     .INILOOP

.LOOP

; --- UPDATE ----------------------------------------------------------------------------------

; READ INPUT DEVICES --- PARTE LENTA UPDATE IN MEMORY

			TRAP    #TRAPKEY
    
; UPDATE GAME LOGIC --- PARTE DE CALCULOS LOGICOS MODIFICANDO LOS DATOS EN MEMORIA
		    MOVE.B #SNDMUSIC,D7
		    TRAP #TRAPSND
		    
            JSR 	PCHUPD
            JSR 	MAUPD
            JSR 	DKUPD
			JSR 	BRLUPD
			JSR 	HMRUPD

; --- SYNC (FASE DE SINCRONIZACION DE LA VELOCIDAD DE EJECUCION CONSTANTE) --------------------

.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)


; --- PLOT (DIBUJAR) --------------------------------------------------------------------------
			JSR 	MAPPLOT
			JSR 	PCHPLOT
            JSR 	MAPLOT
            JSR 	DKPLOT
            JSR 	BRLPLOT
			JSR 	HMRPLOT

			
			TRAP	#TRAPSCR
			
			BRA     .LOOP
			
			SIMHALT
			
			INCLUDE "VARS.X68"
			INCLUDE "SYS/SYSVARS.X68"

			END    START










*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
