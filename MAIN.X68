; =============================================================================================
; TITLE       : DONKEY-KONG CLASSIC 2D GAME
; DESCRIPTION : JUEGO DEL DONKEY-KONG
; AUTHOR      : JAUME, WEIYU
; HISTORY     : VERSION 1
; =============================================================================================
			
			INCLUDE "CONST.X68"
			INCLUDE "SYSCONST.X68"
			INCLUDE "SYSTEM.X68"
			INCLUDE "MARIO.X68"
			INCLUDE "MAP.X68"
			INCLUDE "DONKEY_KONG.X68"
			INCLUDE "FIRE_BALL.X68"
			
START		

; --- INITIALIZATION --------------------------------------------------------------------------
            JSR SYSINIT
			JSR PEAINIT
            JSR MAINIT
            JSR KONGINIT
            JSR FBALINIT
            
.LOOP

; --- UPDATE ----------------------------------------------------------------------------------

; READ INPUT DEVICES --- PARTE LENTA UPDATE IN MEMORY


; UPDATE GAME LOGIC --- PARTE DE CALCULOS LOGICOS MODIFICANDO LOS DATOS EN MEMORIA

			JSR MAPUPD
			JSR PEAUPD
            JSR MAUPD
            JSR KONGUPD
			JSR FBALUPD

; --- SYNC (FASE DE SINCRONIZACIÓN DE LA VELOCIDAD DE EJECUCIÓN CONSTANTE) --------------------

; --- PLOT (DIBUJAR) --------------------------------------------------------------------------
; ES BENEFICIOSO EN EL TRANSPORTE DE CODIGO
; CAMBIO DE ASPECTO GRAFICO
; COMODIDAD

			JSR MAPPLOT
			JSR PEAPLOT
            JSR MAPLOT
            JSR KONGPLOT
            JSR FBALPLOT


			SIMHALT
			
			INCLUDE "VARS.X68"
			INCLUDE "SYSVARS.X68"
			END    START

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
