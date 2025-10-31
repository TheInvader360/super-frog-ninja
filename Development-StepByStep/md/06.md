#### Super Frog Ninja

## 06 - Sound effects, scoring, debug messages, and GUI

### Sound effects

Drag and drop (using windows explorer) the provided sfxChomp.mp3, sfxDead.mp3, and sfxGoal.mp3 files (in the Assets folder) into the asset browser sounds folder

Double-click objPlayer in the asset browser objects folder

Double-click the existing objCollectible collision event

Add a line of code to play the relevant sound effect

###### objPlayer:Collision-objCollectible
```javascript
instance_destroy(other);
audio_play_sound(sfxChomp, 1, false);
```

Press F5 to test the sound effect (collect some collectibles), press escape when done testing

Double-click objPlayer in the asset browser objects folder

Double-click the existing objGoal collision event

Add a line of code to play the relevant sound effect

###### objPlayer:Collision-objGoal
```javascript
room_goto(rmGameComplete);
audio_play_sound(sfxGoal, 1, false);
```

Press F5 to test the sound effect (touch the goal), press escape when done testing

Double-click objPlayer in the asset browser objects folder

Double-click the existing Step event

Add a line of code to play the relevant sound effect (within the objFatal collision check block)

###### objPlayer:Step
```javascript
// ...code omitted from example listing

if (place_meeting(x, y, objFatal)) {
  audio_play_sound(sfxDead, 1, false);
  room_goto(rmGameOver);
}
```

Press F5 to test the sound effect (fall into a spike pit trap), press escape when done testing

### Collectibles score

Right-click the asset browser objects folder, create > object, name: objGlobals

Click the add event button, select create

###### objGobals:Create
```javascript
//window_set_fullscreen(true);
global.totalCollectibles = 30;
global.collectedCollectibles = 0;
```

Double-click rmIntro in the asset browser rooms folder

Select the Instances layer, drag and drop objGlobals from the asset browser objects folder just above the visible room area

Double-click objPlayer in the asset browser objects folder

Double-click the existing objCollectible collision event

Add a line of code to increment the collected collectibles counter

Add a line of code to print some debug info to the developer console

###### objPlayer:Collision-objCollectible
```javascript
instance_destroy(other);
audio_play_sound(sfxChomp, 1, false);
global.collectedCollectibles++;
show_debug_message("Collected: " + string(global.collectedCollectibles));
```

Press F5 to test (collect some collectibles and monitor the output tab for debug messages), press escape when done testing

### GUI

Drag and drop (using windows explorer) the provided visitor1.ttf file (in the Assets folder) into the asset browser fonts folder (yes to the included files prompt, then close the included files dialog)

Install the font locally (using windows explorer, double-click visitor1.ttf, install)

Exit then restart game maker studio (save any unsaved changes if prompted)

Right-click the asset browser fonts folder, create > font, name: fntVisitor1, select font: Visitor TT1 BRK, group: Default, tick the enable sdf checkbox, size: 18, anti-aliasing: Off, then click the regenerate button

Double-click objRmIntroController in the asset browser objects folder

Click the add event button, select create

###### objRmIntroController:Create
```javascript
font_enable_effects(fntVisitor1, true, {
  outlineEnable: true,
  outlineDistance: 2,
  outlineColour: c_black
});
```

Double-click objRmLevelController in the asset browser objects folder

Click the add event button, select draw > draw gui

###### objRmLevelController:DrawGUI
```javascript
draw_set_font(fntVisitor1);
draw_set_colour(c_yellow);
draw_text(4, 21, "Cherries " + string(global.collectedCollectibles) + "/" + string(global.totalCollectibles));
```

Press F5 to test (collect some collectibles and monitor the gui values), press escape when done testing

-----
