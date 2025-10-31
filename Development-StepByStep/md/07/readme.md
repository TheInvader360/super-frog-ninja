#### Super Frog Ninja

## 07 - Game timer and finished auxiliary screens (intro, game over, game complete)

### Timer

Double-click objGlobals in the asset browser objects folder

Double-click the existing Create event

Add a line of code at the end to define the level timer

###### objGlobals:Create
```javascript
// ...code omitted from example listing

global.levelTimerTicks = 0;
```

Double-click objRmLevelController in the asset browser objects folder

Double-click the existing Draw GUI event

Add a line of code to draw the timer

###### objRmLevelController:DrawGUI
```javascript
draw_set_font(fntVisitor1);
draw_set_colour(c_yellow);
draw_text(4, 1, "Timer " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
draw_text(4, 21, "Cherries " + string(global.collectedCollectibles) + "/" + string(global.totalCollectibles));
```

Double-click the existing Room Start event

Add a line of code at the end to reset the timer

###### objRmLevelController:RoomStart
```javascript
// ...code omitted from example listing

global.levelTimerTicks = 0;
```

Double-click the existing Step event

Add a line of code at the end to increment the timer each tick

###### objRmLevelController:Step
```javascript
// ...code omitted from example listing

global.levelTimerTicks++;
```

Double-click objPlayer in the asset browser objects folder

Double-click the existing objGoal collision event

Add a line of code at the end to print some debug info to the developer console

###### objPlayer:Collision-objGoal
```javascript
// ...code omitted from example listing

show_debug_message("Timer: " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
```

Press F5 to test the timer (confirm it starts from zero on starting/restarting the level, counts up each second, and check the debug message on reaching the goal), press escape when done testing

### Intro screen implementation

Drag and drop (using windows explorer) the provided sprBaseIntro.png file (in the Assets folder) into the asset browser sprites folder, origin: top left

Double-click rmIntro in the asset browser rooms folder

Select the Background layer, click on the "No Sprite" value, select Sprites, then sprBaseIntro

Create a new asset layer in the layers section of the inspector tab, set the name value to Text, in grid options (main workspace area toolbar option) disable Snap

Re-order the layers if required (drag and drop - Text at the top, Instances in the middle, and Background at the bottom)

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textDescription, position x: 50.5, position y: 95.6, scale x: 1, scale y: 1, colour: cyan (rgb:0,255,255), alignment h: centre, alignment v: centre, text:

> Demo with companion game maker tutorials

> github.com/TheInvader360/super-frog-ninja

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textAims, position x: 60.5, position y: 95.6, scale x: 1, scale y: 1, colour: magenta (rgb:255,0,255), alignment h: centre, alignment v: centre, text:

> Get to the goal as quickly as possible!

> Collect as many cherries as you can!

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textInstructionsIntro, position x: 51.0, position y: 95.6, scale x: 1, scale y: 1, colour: yellow (rgb:255,255,0), alignment h: centre, alignment v: centre, text:

> < and > keys to run + space key to jump

> Press space key to start...

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textCredits1, position x: 6.0, position y: 328.0, scale x: 0.65, scale y: 0.65, colour: green (rgb:0,255,0), alignment h: left, alignment v: centre, text:

> Game by TheInvader360

> github.com/TheInvader360

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textCredits2, position x: 436.0, position y: 328.0, scale x: 0.65, scale y: 0.65, colour: green (rgb:0,255,0), alignment h: right, alignment v: centre, text:

> Pixel art by Pixel Frog

> pixelfrog-assets.itch.io

Double-click objRmIntroController in the asset browser objects folder

Double-click the existing Create event

Add a line of code at the end to define the flashing text timer

###### objRmIntroController:Create
```javascript
// ...code omitted from example listing

flashingTextTickCounter = 0;
```

Click the add event button, select other > room start

###### objRmIntroController:RoomStart
```javascript
flashingTextTickCounter = 0;
```

Click the add event button, select step > step

###### objRmIntroController:Step
```javascript
flashingTextTickCounter++;
if (flashingTextTickCounter > 1200) flashingTextTickCounter = 0;

var textDescriptionId = layer_text_get_id("Text", "textDescription");
var textAimsId = layer_text_get_id("Text", "textAims");
var textInstructionsIntroId = layer_text_get_id("Text", "textInstructionsIntro");

layer_text_alpha(textDescriptionId, 0);
layer_text_alpha(textAimsId, 0);
layer_text_alpha(textInstructionsIntroId, 0);

if (flashingTextTickCounter < 300) {
  layer_text_alpha(textDescriptionId, 1);
} else if (flashingTextTickCounter > 400 && flashingTextTickCounter < 700) {
  layer_text_alpha(textAimsId, 1);
} else if (flashingTextTickCounter > 800 && flashingTextTickCounter < 1100) {
  layer_text_alpha(textInstructionsIntroId, 1);
}
```

Press F5 to test the finished intro screen (confirm it looks good and the text cycles as intended), press escape when done testing

### Game over screen implementation

Drag and drop (using windows explorer) the provided sprBaseGameOver.png file (in the Assets folder) into the asset browser sprites folder, origin: top left

Double-click rmGameOver in the asset browser rooms folder

Select the Background layer, click on the "No Sprite" value, select Sprites, then sprBaseGameOver

Create a new asset layer in the layers section of the inspector tab, set the name value to Text, in grid options (main workspace area toolbar option) disable Snap

Re-order the layers if required (drag and drop - Text at the top, Instances in the middle, and Background at the bottom)

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textInstructionsGameOver, position x: 138.0, position y: 325.0, scale x: 1, scale y: 1, colour: cyan (rgb:0,255,255), alignment h: centre, alignment v: centre, text: Press space key to restart

Double-click objRmGameOverController in the asset browser objects folder

Delete the existing Key Press - Space event

Click the add event button, select create

###### objRmGameOverController:Create
```javascript
gameOverTickCounter = 0;
```

Click the add event button, select other > room start

###### objRmGameOverController:RoomStart
```javascript
gameOverTickCounter = 0;
```

Click the add event button, select step > step

###### objRmGameOverController:Step
```javascript
gameOverTickCounter++;

var textInstructionsGameOverId = layer_text_get_id("Text", "textInstructionsGameOver");
layer_text_alpha(textInstructionsGameOverId, 0);

if (gameOverTickCounter > 90) {
  if (gameOverTickCounter % 60 > 30) {
    layer_text_alpha(textInstructionsGameOverId, 1);
  }
  if (keyboard_check_pressed(vk_space)) {
    room_goto(rmIntro);
  }
}
```

Press F5 to test the finished game over screen (confirm it looks good, restart text flashes as intended, after a short delay pressing space transitions to the intro screen), press escape when done testing

### Game complete screen implementation

Drag and drop (using windows explorer) the provided sprBaseGameComplete.png file (in the Assets folder) into the asset browser sprites folder, origin: top left

Double-click rmGameComplete in the asset browser rooms folder

Select the Background layer, click on the "No Sprite" value, select Sprites, then sprBaseGameComplete

Create a new asset layer in the layers section of the inspector tab, set the name value to Text, in grid options (main workspace area toolbar option) disable Snap

Re-order the layers if required (drag and drop - Text at the top, Instances in the middle, and Background at the bottom)

Drag and drop (using windows explorer) the provided sprWinner.png file (in the Assets folder) into the asset browser sprites folder

Double-click rmGameComplete in the asset browser rooms folder

Drag and drop sprWinner from the asset browser sprites folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: graphicWinner, position x: 320.0, position y: 40.0, scale x: 1, scale y: 1

Drag and drop fntVisitor1 from the asset browser fonts folder into the room (place it anywhere in the room - make sure it's on the Text layer)

Tag: textInstructionsGameComplete, position x: 138.0, position y: 325.0, scale x: 1, scale y: 1, colour: cyan (rgb:0,255,255), alignment h: centre, alignment v: centre, text: Press space key to restart

Double-click objRmGameCompleteController in the asset browser objects folder

Delete the existing Key Press - Space event

Click the add event button, select create

###### objRmGameCompleteController:Create
```javascript
gameCompleteTickCounter = 0;
```

Click the add event button, select other > room start

###### objRmGameCompleteController:RoomStart
```javascript
gameCompleteTickCounter = 0;
```

Click the add event button, select step > step

###### objRmGameCompleteController:Step
```javascript
gameCompleteTickCounter++;

var textInstructionsGameCompleteId = layer_text_get_id("Text", "textInstructionsGameComplete");
layer_text_alpha(textInstructionsGameCompleteId, 0);

if (gameCompleteTickCounter > 120) {
  if (gameCompleteTickCounter % 60 < 30) {
    layer_text_alpha(textInstructionsGameCompleteId, 1);
  }
  if (keyboard_check_pressed(vk_space)) {
    room_goto(rmIntro);
  }
}
```

Click the add event button, select draw > draw gui

###### objRmGameCompleteController:DrawGUI
```javascript
draw_set_font(fntVisitor1);
draw_set_colour(c_yellow);
draw_set_halign(fa_center);
draw_text(320, 75, "Timer " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
draw_text(320, 95, "Cherries " + string(global.collectedCollectibles) + "/" + string(global.totalCollectibles));
draw_set_halign(fa_left); // restore default
```

Press F5 to test the finished game complete screen (confirm it looks good, score and timer shown, restart text flashes as intended, after a short delay pressing space transitions to the intro screen), press escape when done testing

-----
