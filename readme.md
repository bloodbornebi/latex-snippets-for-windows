# Initial Post from Gilles Castel
*[How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)*

# Configuration
## Requirements
AutoHotkey and a text editor installed. (This is set up for atom.)

## If you already use AutoHotkey

Download `latexshortcuts.ahk` to your desktop. If you don't use atom as a text editor, you'll want to change `atom.exe` to your preferred text editor.

## If you don't use AutoHotkey

Download AutoHotkey, and `latexshortcuts.ahk` to your desktop. Right click it and click run script.

If you use atom as a text editor, you're good to go. If not, then open your preferred text editor. There should be a green H icon in your task bar/palette/whatever windows is calling that, if you right click it, you'll see an option "Window Spy". This will open up a panel that just tells you the names for everything in AHK.

If you click into your text editor, Window Spy will tell you something like `appname.exe`, and you'll want to replace `atom.exe` in the source code. (The name is *probably* the same as the app name, but it's good to make sure.) Save, then right click the icon again and click reload script. If you did everything right, it won't say anthing.

# Differences from the original
## Major changes
The single biggest change is that there are no specific environments. So the script isn't smart enough to know if you're in math mode or not. You have to be smart enough to not call a subscript command when you're in text mode, etc. Furthermore, it doesn't know whether or not you're in a LaTeX file. If that's causing you problems, just end the script when you're not writing in LaTeX. It *probably* won't, because most of the shortcuts are designed to be natural when you're writing math, and I've made tweaks to the ones that might come up in different situations, but you never know.

Secondly, AutoHotkey basically replaces strings automatically, no tab/enter required. So the commands are slightly modified to make sure they only trigger when you want them to. If you don't know how to read an AHK file, you basically want to look at the phrase after the first two colons (`::what_you_type_here::what_it_is_replaced_by`). If you can't tell what the function call does, just try it out and see.

## Changed replacements
A lot of the snippets (set, lim, etc.) that come up in every day text need to start with an ending square bracket (e.g., `]set`) to trigger. In particular, to end `]set`, you need to type `:`, not tab. (Tab causes issues when you're inside `mk`, and it's unlikely you're calling it outside of `mk`.)

Also, related to `]set`, some snippets don't look complete until you tab your way through them. Again, this is a mathmode thing.

`]sq` produces a square, not a square root, and `]sr` produces a square root (there's not a particular reason for this change; I always forget the LaTeX command for square root because I think "sr" for this. It's pretty easy to swap them back if that's what you want).

To navigate `]lim`, use space after the first argument (e.g., `x \to \infty`). Again, necessary work arounds regarding how AHK processes snippets.

## Removed replacements
There is no document set up shortcut or beginning/ending shortcut because those are easy to make in a typical snippets set up, and pretty common in a text editor anyway, so I did't want there to be a conflict.

Also, pretty much every replacement that uses regex has been signficantly modified or removed. Most notably are automatic sub- and superscripts. The `_` and `]td` replacements still trigger, but not the `a1 -> a_1` style replacements.

# Issues
It's been fairly bugfree in my testing, but the backspaces and lefts (`{backspace n}` and `{left n}` where `n` is an integer or ommitted) might need tweaking depending on how your tabs, etc., are set up. There are also probably some word-boundary edge cases.
