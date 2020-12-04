#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe atom.exe
!p::
  SetWorkingDir, C:\Users\canto\OneDrive\Documents\notes\figures ; custimize as necessary
  Input, Name, , {Tab}{Enter}
  If FileExist(Name) {
  } Else {
    FileCopy, template.svg, %Name%.svg
    Send,
    ( LTrim Join`r`n
      \begin{{}figure{}}
        \centerfloat
        \incfig{{}%Name%{}}
        \caption{{}%Name%{}}
        \label{{}fig:%Name%{}}
      \end{{}figure{}}
    )
    ;Run, inkscape.exe, C:\Program Files\Inkscape\bin
    FullName := A_WorkingDir . "\" .  Name . ".svg"
    ShortName := Name . ".svg"
    Run, open "%FullName%"
  }
return

#IfWinActive ahk_exe inkscape.exe
!s::
  Send ^s
  RunWait, Powershell ".\inkscape --export-overwrite --export-type=pdf --export-latex %FullName%", C:\Program Files\Inkscape\bin
  WinClose
  WinActivate, ahk_exe atom.exe
  Send ^s
return
