; =============================================================================================
; SYSTEM CONSTANTS
; =============================================================================================

; --- SCREEN RELATED CONSTANTS ----------------------------------------------------------------

SCRWIDTH    EQU     640                 ; SCREEN WIDTH
SCRHEIGH    EQU     480                 ; SCREEN HEIGHT
SCRFPS      EQU     100                  ; SCREEN FRAMES PER SECOND

; --- TRAP RELATED CONSTANTS ------------------------------------------------------------------
TRAPSCR    EQU     1                   ; DOUBLE BUFFER TRAP NUMBER
TRAPKEY    EQU     2                   
TRAPPLOT   EQU     3                    

; --- INTERRUPT NUMBERS -----------------------------------------------------------------------
SCRINTN     EQU     1                   ; SCREEN TIMED INTERRUPT NUMBER

; --- KEYCODES --------------------------------------------------------------------------------

KBDLEFT     EQU     'A'                 ; MOVE LEFT KEY
KBDRIGHT    EQU     'D'                 ; MOVE RIGHT KEY
KBDUP       EQU     'W'                 ; MOVE UP KEY
KBDDOWN     EQU     'S'                 ; MOVE DOWN KEY
KBDSPACE    EQU     $20                 ; SPACE KEY
KBDPAUSE    EQU     'P'                 ; PAUSE KEY
KBDFIRE1    EQU     'M'                 ; WAIT ASIGNATION
KBDFIRE2    EQU     'N'                 ; WAIT ASIGNATION



*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
