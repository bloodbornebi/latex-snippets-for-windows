#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe atom.exe
  #Hotstring * ; things that trigger no matter the whitespace (a.k.a. autoreplaces)
  ::mk::
    inline_math() {
      Send $
      Input, Display, L1
      If (Display = ":"){
        Send \displaystyle{space}
      } Else {
        Send % Display
      }
      Send ${left}
      Input, Expression, V, {Tab}
      Send {backspace}{end}
      Input, Ending, L1
      If (RegExMatch(Ending, "[,.?\-\s]") = 0){
        Send {space}
      }
      Send %Ending%
    }
  ::dm::
    display_math() {
      Send \[
      Input, Expression, V, {Tab}.{Enter}
      Send {backspace}
      If ("." != SubStr(Expression, 0)){
        Send .
      }
      Send \]{space}
    }
    ::==::&={space}
  ::xnn::x_n
  ::ynn::y_n
  ::xii::x_i
  ::yii::y_i
  ::xp1::x_{{}}n {+} 1{}}
  ::dint::
    int() {
      Send \int_{{}{}}{^}{{}{}}{left 4}
      Input, Text, V, {tab}
      Send {backspace}{right 3}
      Input, Text, V, {tab}
      Send {backspace}{end}
    }
	::cc::\subset ; n.b. annoying because i can't get it to automatically do equality

	#Hotstring ? ; some common math things that might start off a segment
	::]sq::
    sq() {
      Send {^}2
    }
  ::]cb::
    cb() {
      Send {^}3
    }
  ::]td::
    td() {
      Send {^}{{}{}}{left}
      Input, Text, V, {tab}
      Send {backspace}{right}
    }
  ::_::
    sub() {
      Send _{{}{}}{left}
      Input, Text, V, {tab}
      Send {backspace}{right}
    }
	::]not::\not
	::]in::\in
	::]set::
		set() {
			Send \bqty{{}{}}{left}
			Input, Text, V, :
			Send {backspace}{right}
		}
	::]lim::
    lim() {
      Send \lim_{{} to {}}{left 5}
      Input, Text, V, {space}
      Send {backspace}{right 4}
      Input, Text, V, {Tab}
      Send {backspace}{right}
    }
  ::]sr::
    sr() {
      Send \sq{{}{}}{left}
      Input, Text, V, {tab}
      Send {backspace}{right}
    }
	::]sum::
    sum() {
      Send \sum_{{}{}}{^}{{}{}}{left 4}
      Input, Text, V, {Tab}
      Send {backspace 2}{right 3}
      Input, Text, V, {Tab}
      Send {backspace 2}{right}
    }

	#Hotstring ?0
  #Hotstring *0 ; things that should NOT trigger without whitespace (because they end in a command, etc)
  ::...::\dots
  ::=>::\implies
  ::=<::\impliedby
  ::iff::\iff
  ::!=::\neq
  ::ooo::\infty
  ::<=::\le
  ::>=::\ge
  ::xx::\times
  ::**::\cdot
  ::->::\to
  ::<->::\leftrightarrow
  ::~~::\sim
	::||::\mid
	::NN::\cap
	::UU::\cup
