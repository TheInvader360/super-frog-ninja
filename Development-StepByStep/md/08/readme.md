#### Super Frog Ninja

## 08 - Goal and death sequences, hide cursor, disable developer shortcuts, disable debug output, run fullscreen

### Goal sequence

Double-click objPlayer in the asset browser objects folder

Double-click the existing objGoal collision event

Remove the line of code that immediately transitions to rmGameComplete

Add two lines of code to replace the current objPlayer instance with an objPlayerGoal instance

###### objPlayer:Collision-objGoal
```javascript
audio_play_sound(sfxGoal, 1, false);
show_debug_message("Timer: " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
instance_create_layer(x, y, layer, objPlayerGoal); // create an instance of objPlayerGoal at the player's position
instance_destroy(); // destroy the original player instance
```

Right-click objPlayer in the asset browser objects folder, duplicate, name: objPlayerGoal

Double-click objPlayerGoal in the asset browser objects folder, delete all events

Click the add event button, select create

###### objPlayerGoal:Create
```javascript
alarm[0] = 90; // set alarm 0 - this will transition to the game complete screen after a short delay
```

Click the add event button, select alarm > alarm 0

###### objPlayerGoal:Alarm0
```javascript
room_goto(rmGameComplete);
```

Press F5 to test and discover a bug (collide with goal - null reference error), click the abort button when finished reviewing the error trace

Double-click objRmLevelController in the asset browser objects folder

Double-click the existing Step event

Wrap all the existing code in an if statement to guard against a null objPlayer reference

###### objRmLevelController:Step
```javascript
if (instance_exists(objPlayer)) {

// ...code omitted from example listing

}
```

Press F5 to test goal sequence (null reference bug fixed, timer stops, player can't be controlled, transition to game complete after delay), press escape when done testing

### Death sequence

Double-click objPlayer in the asset browser objects folder

Double-click the existing Step event

Remove the line of code that immediately transitions to rmGameOver in the objFatal collision block

Add two lines of code to replace the current objPlayer instance with an objPlayerDead instance

###### objPlayer:Step
```javascript
// ...code omitted from example listing

if (place_meeting(x, y, objFatal)) {
  audio_play_sound(sfxDead, 1, false);
  instance_create_layer(x, y, layer, objPlayerDead); // create an instance of objPlayerDead at the player's position
  instance_destroy(); // destroy the original player instance
}
```

Right-click objPlayerGoal in the asset browser objects folder, duplicate, name: objPlayerDead

Double-click objPlayerDead in the asset browser objects folder

Double-click the existing Alarm 0 event

###### objPlayerDead:Alarm0
```javascript
room_goto(rmGameOver);
```

Double-click the existing Create event

###### objPlayerDead:Create
```javascript
alarm[0] = 120; // set alarm 0 - this will transition to the game over screen after a short delay
ySpd = -15;
image_yscale = -1;
```

Click the add event button, select step > step

###### objPlayerDead:Step
```javascript
ySpd += 0.5; // pulled down by gravity
y += ySpd;
```

Press F5 to test death sequence (timer stops, player can't be controlled, vertically flipped player shoots up the screen then falls away, transition to game over after delay), press escape when done testing

### Hide cursor

Double-click game options > windows in the asset browser quick access folder

Uncheck display cursor under graphics, click the apply button, then ok

Press F5 to test hidden cursor (move mouse pointer over game area), press escape when done testing

### Remove developer shortcuts

Double-click objRmLevelController in the asset browser objects folder

Delete the Key Press - C and Key Press - O events

Press F5 to test (confirm c and o keys have no effect), press escape when done testing

### Disable debug output

Double-click objPlayer in the asset browser objects folder

Double-click the existing objCollectible collision event

Comment out the debug message line

###### objPlayer:Collision-objCollectible
```javascript
// ...code omitted from example listing

//show_debug_message("Collected: " + string(global.collectedCollectibles));
```

Double-click the existing objGoal collision event

Comment out the debug message line

###### objPlayer:Collision-objGoal
```javascript
// ...code omitted from example listing

//show_debug_message("Timer: " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
```

Press F5 to test (confirm no collectible/timer related debug messages in the output tab), press escape when done testing

### Fullscreen

Double-click objGlobals in the asset browser objects folder

Double-click the existing Create event

Uncomment the fullscreen line

###### objGlobals:Create
```javascript
// ...code omitted from example listing

window_set_fullscreen(true);
```

Press F5 to test (confirm fullscreen), press escape when done testing

-----
