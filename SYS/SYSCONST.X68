; =============================================================================================
; SYSTEM CONSTANTS
; =============================================================================================

; --- SCREEN RELATED CONSTANTS ----------------------------------------------------------------

SCRWIDTH    EQU     640                 ; SCREEN WIDTH
SCRHEIGH    EQU     480                 ; SCREEN HEIGHT
SCRFPS      EQU     10                  ; SCREEN FRAMES PER SECOND

; --- TRAP RELATED CONSTANTS ------------------------------------------------------------------
TRAPSCR     EQU     1                   ; DOUBLE BUFFER TRAP NUMBER
TRAPKEY     EQU     2                   
TRAPPLOT    EQU     3                    
TRNMREAD    EQU     4                   ; MOUSE READ TRAP NUMBER
TRAPSND     EQU     5

; --- INTERRUPT NUMBERS -----------------------------------------------------------------------
SCRINTN     EQU     1                   ; SCREEN TIMED INTERRUPT NUMBER
TINSEG      EQU     2                   ; TIMED INTERRUPT NUMBER FOR 1 SEG

; --- KEYCODES --------------------------------------------------------------------------------

KBDLEFT     EQU     'A'                 ; MOVE LEFT KEY
KBDRIGHT    EQU     'D'                 ; MOVE RIGHT KEY
KBDUP       EQU     'W'                 ; MOVE UP KEY
KBDDOWN     EQU     'S'                 ; MOVE DOWN KEY
KBDSPACE    EQU     ' '                 ; SPACE KEY
KBDPAUSE    EQU     'P'                 ; PAUSE KEY
KBDFIRE1    EQU     'M'                 ; WAIT ASIGNATION
KBDFIRE2    EQU     'N'                 ; WAIT ASIGNATION

; --- SOUND IDENTIFIERS -----------------------------------------------------------------------

SNDMUSIC     EQU     0
SNDRESTA     EQU     1
SNDJUMP      EQU     2
SNDVICTO     EQU     3

; --- MOUSE MODE ------------------------------------------------------------------------------

MOUSMODE     EQU     2

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
