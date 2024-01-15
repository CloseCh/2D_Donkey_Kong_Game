; =============================================================================================
; GAME CONSTANTS
; =============================================================================================

; --- Map Constants ---------------------------------------------------------------------------
BLCWIDTH    EQU     32                       ; BLOCK WIDTH
BLCHEIGH    EQU     32                       ; BLOCK HEIGH

    ; --- BLOCK 1 -----------------------------------------------------------------------------
B1SIZEH     EQU     18
B1SIZEW     EQU     32

    ; --- BLOCK 2 -----------------------------------------------------------------------------

; --- MARIO RELATED CONSTANTS ----------------------------------------------------
MASPEED     EQU     2                      ; MARNITUDE OF THE X AND Y VEL
MAWIDHT     EQU     30                      ; MARIO WIDHT
MAHEIGHT    EQU     40                      ; MARIO HEIGHT
MACONTN     EQU     2000                    ; COUNTER MARIO

    ; --- MARIO COLISION CONSTANTS -----------------------------------------------
MACOLW      EQU     24                      ; MARIO COLISION WIDHT

; --- DONKEY_KONG RELATED CONSTANTS ----------------------------------------------------

DKWIDTH     EQU     90                       ; DONKEY_KONG WIDHT
DKHEIGHT    EQU     70                       ; DONKEY_KONG HEIGHT
DKPOSX      EQU     85                       ; DONKEY_KONG X POSITION
DKPOSY      EQU     -5                       ; DONKEY_KONG Y POSITION
DKCONTN     EQU     3000                     ; COUNTER FOR LEFT-RIGHT IMAGES
DKCONTTN    EQU     18000                   ; COUNTER FOR THROWING IMAGE

; --- PEACH RELATED CONSTANTS ----------------------------------------------------

PCHWIDHT    EQU     0                       ; PEACH WIDHT
PCHHEIGH    EQU     0                       ; PEACH HEIGHT
PCHPOSX     EQU     0                       ; PEACH X POSITION
PCHPOSY     EQU     0                       ; PEACH Y POSITION

; --- BARREL RELATED CONSTANTS ----------------------------------------------------

BRLRAD      EQU     11
BRLSPEED    EQU     0                       ; MAGNITUDE OF THE X AND Y VEL.
BRLPCOL     EQU     $00000080               ; BARREL COLOR 
BRLFCOL     EQU     $000000FF

;---HAMMER RELATED CONSTANTS ------------------------------------------------------

HMRWIDHT    EQU     0                      ; BARREL WIDHT
HMRHEIGH    EQU     0                      ; BARREL HEIGHT
      
*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
