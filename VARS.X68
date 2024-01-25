; =============================================================================================
; GAME VARIABLES
; =============================================================================================
; --- Mario variables -------------------------------------------------------------------------

MAPOINTX     DS.W    1           ; MARIO X COORDINATE
MAPOINTY     DS.W    1           ; MARIO Y COORDINATE
MAIMAGE      DS.L    1           ; CURRENT IMAGE MARIO
MACONT       DS.W    1           ; COUNTER FOR CHANGES OF IMAGES
MACONTJP     DS.W    1           ; COUNTER FOR CHANGES OF IMAGES IN THE JUMP
    ; BIT 0, SI 1 ESTA FLOTANDO
    ; BIT 1, SI 1 ESTA SALTANDO.
    ; BIT 2, SI 1 DEBE SUBIR SI 0 DEBE BAJAR DEL SALTO
    ; BIT 3, SI 1 PUEDE SUBIR EN LA ESCALERA
    ; BIT 4, SI 1 PUEDE BAJAR EN LA ESCALERA
    ; BIT 5, SI 1 EN LA ESCALERA
MACONTRO     DS.W    1           ; CONTROLES DE MARIO
             DS.W    0
;--- Donkey kong variables --------------------------------------------------------------------
DKIMAGE      DS.L    1           ; CURRENT IMAGE DK
DKCONTT      DS.W    1           ; COUNTER FOR THROWING BARRELS
DKCONT       DS.W    1           ; COUNTER FOR CHANGES OF IMAGES

;--- Peach variables --------------------------------------------------------------------------
PCHIMAGE     DS.L    1           ; CURRENT IMAGE PEACH
PCHCONT      DS.W    1           ; COUNTER 
PCHPOSY      DS.W    1           ; PEACH Y COORDINATE

;--- barrel variables -------------------------------------------------------------------------
BRLPOSX     DS.W    1           ; BARREL X COORDINATE
BRLPOSY     DS.W    1           ; BARREL Y COORDINATE
BRLSPEED    DS.L    1           ; BARREL VELOCITY

;--- HAMMER VARIABLES -------------------------------------------------------------------------
HMRPOSX     DS.W    1           ; HAMMER X COORDINATE
HMRPOSY     DS.W    1           ; HAMMER Y COORDINATE
HMRCONT     DS.W    1           ; COUNTER FOR HAMMER             


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
