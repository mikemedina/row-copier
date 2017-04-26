#Singleinstance, Force

; --------------- Gui Setup ---------------
; general gui settings
Gui, Font, s15 cwhite ; Requires 'c' prefix
Gui, Color, black     ; Accepts hex
Gui, Color,, black    ; Second comma somehow ties this to the Edit control

; Labels
Gui, Add, Text,, Pause Duration:
Gui, Add, Text,, Iterations:            ; The + adds to the previous occurence of the variable

; Text boxes
Gui, Add, Edit, Number vPauseDuration ym
Gui, add, Edit, Number vIterations      ; Prefix 'v' = "variable" to store the value into

; Run button
Gui, Add, Button, x340 y+10 gStart, Run ; Prefix 'g' = "Go to label: x"

; Launch the gui
;Gui, Show, w480 h230, Row Copier
Gui, Show, AutoSize Center, Row Copier
return                                  ; This return prevents code below from being run without explicit invocation

; --------------- Labels ---------------
GuiClose: ; Automatically associated with the close button
    ExitApp

Start:
    WinActivate, 10.11.51.52 - Remote Desktop Connection
    Gui, Submit, NoHide
    Loop %Iterations%
    {
        Send, {F2}
        Send, {DOWN}
        Send, {LEFT}
        Sleep, %PauseDuration%
    }
    return

^j::ExitApp

