# Simple AHK scripts for auto flasking in PoE 3.14.

## MAIN SCRIPT = PoEAutoFlaskPixel

## UTILITY SCRIPT = SearchColorAt

### PoEAutoFlaskPixel Settings

- F3 = Start script (Press it when you are ingame, just in case).
- ~q:: = Attack Skill (Hotkey can be changed, ex: RButton - to use the {default} right mouse button, more info: https://www.autohotkey.com/docs/KeyList.htm)
- ~w:: = Attack Skill
- In case you attack with just one skill or check for autoflask with a specific skill, comment one of those like this:
<details>
<summary>Example</summary>
/*
~w::
	if (Enabled) {
		Gosub, CycleAllFlasksWhenReady
	}
	KeyWait, w, D
	return
*/
</details>

### MANUAL MODIFICATION REQUIRED
```diff
+ FlaskInit[1] := new Flask(0, 0) ; I use Life Flask in here, 0,0 = disabled.

+ FlaskInit[2] := new Flask(360, 1074)

+ FlaskInit[3] := new Flask(405, 1074)

+ FlaskInit[4] := new Flask(450, 1074)

+ FlaskInit[5] := new Flask(495, 1074)
```
Each FlaskInit[index] store the pixel configuration value for each flask in a certain X, Y coordinate. 
If you already know the pixel assigned to check the color status, replace them with your own values. If not, you can use the utility script to obtain them.

### SearchColorAt Settings

- F3 = Start script (Press it when you are ingame, just in case).
- a = Get cursor coordinates and color at specificed pixel using the cursor.

![Cursor](https://user-images.githubusercontent.com/83203362/116040287-360ff580-a642-11eb-98b2-a55d379d4a9a.png)

Put the cursor at the start of the flask duration and press they keyboard key "a". Information about coordinates will be copied to clipboard, do it for each flask you want to autoflask.

Example: The image check for Flask 2 cursor coordinates, copy the coordinates in the main script at FlaskInit[2] := new Flask(X, Y).
