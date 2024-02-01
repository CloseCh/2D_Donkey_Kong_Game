; =============================================================================================
; SYSTEM VARIABLES
; =============================================================================================

; --- MOUSE RELATED VARIABLES -----------------------------------------------------------------
MOUPOSY     DS.W    1                       ; MOUSE Y COORDINATE
MOUPOSX     DS.W    1                       ; MOUSE X COORDINATE
MOUBUT      DS.B    1                       ; MOUSE BUTTONS STATE
MOUEDGE     DS.B    1                       ; MOUSE BUTTONS EDGE
            DS.W    0

; --- KEYBOARD RELATED VARIABLES --------------------------------------------------------------
KBDVAL      DS.B    1                           ; KEY STATE (TECLA DE PULSO CONTINUO)
KBDEDGE     DS.B    1                           ; KEY EDGE (TECLA DE UNICO PULSO)
            DS.W    0


; --- TIMED INTERRUPT RELATED VARIABLES -------------------------------------------------------
SCRINTCT    DS.B    1                           ; INTERRUPT COUNTER
            DS.W    0

CONTMUS     DS.W    1
CONTJUMP    DS.W    1
*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
