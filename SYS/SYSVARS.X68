; =============================================================================================
; SYSTEM VARIABLES
; =============================================================================================

; --- KEYBOARD RELATED VARIABLES --------------------------------------------------------------
KBDVAL      DS.B    1                           ; KEY STATE (TECLA DE PULSO CONTINUO)
KBDEDGE     DS.B    1                           ; KEY EDGE (TECLA DE UNICO PULSO)


; --- TIMED INTERRUPT RELATED VARIABLES -------------------------------------------------------
SCRINTCT    DS.B    1                           ; INTERRUPT COUNTER
            DS.W    0

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
