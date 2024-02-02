; =============================================================================================
; GAME VARIABLES
; =============================================================================================
; --- Mario variables -------------------------------------------------------------------------

MAPOINTX     DS.W    1           ; COORDENADA X MARIO
MAPOINTY     DS.W    1           ; COORDENADA Y MARIO
MAIMAGE      DS.L    1           ; IMAGEN ACTUAL MARIO
MACONT       DS.W    1           ; CONTADOR PARA EL CAMBIO DE IMAGENES CUANDO CAMINA
MACONTS      DS.W    1           ; CONTADOR PARA EL CAMBIO DE IMAGENES CUANDO SUBE ESCALERAS
MACONTJP     DS.W    1           ; CONTADOR PARA EL SALTO  DE MARIO
    ; BIT 0, SI 1 ESTA FLOTANDO
    ; BIT 1, SI 1 ESTA SALTANDO.
    ; BIT 2, SI 1 DEBE SUBIR SI 0 DEBE BAJAR DEL SALTO
    ; BIT 3, SI 1 EN LA ESCALERA
MACONTRO     DS.W    1           ; CONTROLES DE MARIO
             DS.W    0

;--- Donkey kong variables --------------------------------------------------------------------
DKIMAGE      DS.L    1           ; IMAGEN ACTUAL DE DONKEY KONG
DKCONTT      DS.W    1           ; CONTADOR PARA LANZAR BARRILES
DKCONT       DS.W    1           ; CONTADOR PARA EL CAMBIO DE IMAGEN 

;--- Peach variables --------------------------------------------------------------------------
PCHCONT      DS.W    1           ; COUNTER 
PCHPOSY      DS.W    1           ; PEACH Y COORDINATE
         


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
