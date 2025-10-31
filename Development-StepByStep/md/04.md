#### Super Frog Ninja

## 04 - Prototype application flow using minimal placeholder screens (intro, game over, game complete)

### Intro screen stub

Right-click the asset browser rooms folder, create > room, name: rmIntro

Click the re-order rooms icon (two stacked boxes alongside an up/down arrow)

Drag and drop the rooms so that rmIntro is listed first (this is the default room that loads when starting the game), then close the room manager dialog

Double-click rmIntro in the asset browser rooms folder

In the Inspector tab, under room settings, set width to 640 and height to 360

Under viewports and cameras, tick the enable viewports checkbox

Under viewport 0, tick the visible checkbox, then set width of 640 and height of 360 in both the camera properties and viewport properties sections

Select the Background layer, scroll down to the properties section, click on the colour panel, select cyan (rgb:0,255,255), ok

Select the Instances layer, in grid options (main workspace area toolbar option) set Grid X and Grid Y both to 16

Right-click the asset browser objects folder, create > object, name: objRmIntroController

Click the add event button, select key pressed > others > escape

###### objRmIntroController:KeyPress-Escape
```javascript
game_end();
```

Click the add event button, select key pressed > space

###### objRmIntroController:KeyPress-Space
```javascript
room_goto(rmLevel1);
```

Double-click rmIntro in the asset browser rooms folder

Select the Instances layer, drag and drop objRmIntroController from the asset browser objects folder just above the visible room area

Press F5 to test the intro screen (escape to exit / space to play), press escape when done testing

### Game over screen stub

Right-click rmIntro in the asset browser rooms folder, duplicate, name: rmGameOver

Double-click rmGameOver in the asset browser rooms folder

Select the Background layer, scroll down to the properties section, click on the colour panel, select red (rgb:255,0,0), ok

Select the Instances layer, delete the objRoomIntroController instance

Right-click objRmIntroController in the asset browser objects folder, duplicate, name: objRmGameOverController

Double-click objRmGameOverController in the asset browser objects folder

Double-click the existing Key Press - Space event

Edit the objRmGameOverController:KeyPress-Space code to transition back to the intro screen

###### objRmIntroController:KeyPress-Space
```javascript
room_goto(rmIntro);
```

Double-click rmGameOver in the asset browser rooms folder

Select the Instances layer, drag and drop objRmGameOverController from the asset browser objects folder just above the visible room area

Double-click objPlayer in the asset browser objects folder

Double-click the existing Step event

Make a small change to the objFatal collision code - transition to the game over screen instead of restarting

###### objPlayer:Step
```javascript
// ...code omitted from example listing

if (place_meeting(x, y, objFatal)) {
  room_goto(rmGameOver);
}
```

Press F5 to test the game over screen (space to play, fall in trap, space to return to intro or escape to exit), press escape when done testing

### Game complete screen stub

Right-click rmGameOver in the asset browser rooms folder, duplicate, name: rmGameComplete

Double-click rmGameComplete in the asset browser rooms folder

Select the Background layer, scroll down to the properties section, click on the colour panel, select green (rgb:0,255,0), ok

Select the Instances layer, delete the objRoomGameOverController instance

Right-click objRmGameOverController in the asset browser objects folder, duplicate, name: objRmGameCompleteController

Double-click rmGameComplete in the asset browser rooms folder

Select the Instances layer, drag and drop objRmGameCompleteController from the asset browser objects folder just above the visible room area

Double-click objPlayer in the asset browser objects folder

Double-click the existing objGoal collision event

Transition to the game complete screen instead of restarting

###### objPlayer:Collision-objGoal
```javascript
room_goto(rmGameComplete);
```

Press F5 to test the game complete screen (space to play, collide with the goal, space to return to intro or escape to exit), press escape when done testing

### Quick win/lose

Double-click objRmLevelController in the asset browser objects folder

Right-click the existing Key Press - Enter event, delete event, yes

Click the add event button, select key pressed > letters > c

###### objRmLevelController:KeyPress-C
```javascript
room_goto(rmGameComplete);
```

Click the add event button, select key pressed > letters > o

###### objRmLevelController:KeyPress-O
```javascript
room_goto(rmGameOver);
```

Press F5 to test the game complete/over developer shortcuts (space to play, c or o to quickly win/lose, space to return to intro or escape to exit), press escape when done testing

-----
