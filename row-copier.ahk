#Singleinstance, Force

; --------------- Gui Setup ---------------
; general gui settings
Gui, Font, s15 cwhite ; Requires 'c' prefix
Gui, Color, black     ; Accepts hex
Gui, Color,, black    ; Second comma somehow ties this to the Edit control

; Labels
Gui, Add, Text,, Pause Duration:
Gui, Add, Text,, Iterations:                              ; The + adds to the previous occurence of the variable

; Text boxes
Gui, Add, Edit, Number vPauseDuration ym
Gui, Add, Edit, Number vIterations               ; Prefix 'v' = "variable" to store the value into

; Run button
Gui, Add, Button, x340 y+10 gCommitvalues gStart, Run         ; Prefix 'g' = "Go to label: x"

; Launch the gui
;Gui, Show, w480 h230, Row Copier
Gui, Show, AutoSize Center, Row Copier
return                                                        ; This return prevents code below from being run without explicit invocation

; --------------- Labels ---------------
GuiClose: ; Automatically associated with the close button
    ExitApp

CommitValues:
    Gui, Submit, NoHide

Start:
    WinActivate, Untitled - Notepad ;10.11.51.52 - Remote Desktop Connection
    test := vIterations
    msgbox %test%
    Loop vIterations
    {
        Send, Test text ; {F2}
        Send, Test text2
        Send, {Down}
        Send, {Left}
        ; Sleep, %vPauseDuration%
    }
    return

^j::ExitApp

