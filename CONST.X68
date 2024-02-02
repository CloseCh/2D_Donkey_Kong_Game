; =============================================================================================
; GAME CONSTANTS
; =============================================================================================
; --- MAIN BUTTON -----------------------------------------------------------------------------
BUTWITH     EQU     150                       ; BUTTON WIDTH 
BUTHEIG     EQU     50                        ; BUTTON HEIGHT
BUTCOLB     EQU     $00CCCC00                  ; BUTTON BACKEND COLOR
BUTCOLF     EQU     $00FFFF00                 ; BUTTON FROMTEND COLOR
BUTPX       EQU     360                       ; COORDINATE X FOR THE BUTTONS

    ; --- START BUTTON ------------------------------------------------------------------------
SBUTPY      EQU     150                       ; COORDINATE Y FROM START BUTTON
    ; --- FPS BUTTON --------------------------------------------------------------------------
FBUTPY      EQU     250                       ; COORDINATE Y FROM START BUTTON

; --- MAP CONTANTS ----------------------------------------------------------------------------
BLCWIDTH    EQU     32                       ; BLOCK WIDTH
BLCHEIGH    EQU     32                       ; BLOCK HEIGH
MAPA        EQU     $20000

; --- BLOCK 1 ---------------------------------------------------------------------------------
B1SIZEH     EQU     18                       ;HEIGHT
B1SIZEW     EQU     32                       ;WIDTH

; --- MARIO RELATED CONSTANTS -----------------------------------------------------------------

MASPEED     EQU     8                      ; VELOCIDAD DE MARIO
MAWIDTH     EQU     30                     ; MARIO WIDTH
MAJUMPT     EQU     4                      ; CUANDO MARIO SALTA, X TIEMPO PARA SUBIR 
MAHEIGHT    EQU     40                     ; MARIO HEIGHT

; --- MARIO COLISION CONSTANTS ----------------------------------------------------------------
MACOLW      EQU     24                      ; MARIO COLISION WIDHT

; --- DONKEY_KONG RELATED CONSTANTS -----------------------------------------------------------
DKWIDTH     EQU     90                       ; DONKEY_KONG WIDTH
DKHEIGHT    EQU     70                       ; DONKEY_KONG HEIGHT
DKPOSX      EQU     85                       ; DONKEY_KONG X POSITION
DKPOSY      EQU     -5                       ; DONKEY_KONG Y POSITION
DKCONTTN    EQU     18000                   ; COUNTER FOR THROWING IMAGE

; --- PEACH RELATED CONSTANTS -----------------------------------------------------------------
PCHWIDTH    EQU     90                       ; PEACH WIDTH
PCHHEIGH    EQU     70                       ; PEACH HEIGHT
PCHPOSX     EQU     380                      ; POSICIÓN X DE PEACH


; --- BARREL RELATED CONSTANTS ----------------------------------------------------------------
BRLRAD      EQU     9                      ; RADIO DEL BARRIL
BRLSPEED    EQU     5                       ; VELOCIDAD DEL BARRIL
BRLPCOL     EQU     $00003266              ; COLOR DE RELLENO DEL BARRIL 
BRLFCOL     EQU     $00013278               ; COLOR DE BORDE DEL BARRIL
BRLCONTN    EQU     115                    ; CONTADOR DE BARRIL


CONT        EQU     2000          
      

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
