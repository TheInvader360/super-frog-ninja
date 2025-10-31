#### Super Frog Ninja

## 02 - Camera controller and developer shortcuts

### Camera controller - follow player

Right-click the asset browser objects folder, create > object, name: objRmLevelController

Click the add event button, select create

###### objRmLevelController:Create
```javascript
wCam = 640;
hCam = 360;
```

Click the add event button, select step > step

###### objRmLevelController:Step
```javascript
camera_set_view_pos(view_camera[0], objPlayer.x - wCam / 2, objPlayer.y - hCam / 2);
```

Right-click Room1 in the asset browser rooms folder, rename rmLevel1

Double-click rmLevel1 in the asset browser rooms folder

Select the Instances layer, drag and drop objRmLevelController from the asset browser objects folder just above the visible room area

Press F5 to test the camera as it stands (centred on player), close the window when done testing

### Camera controller - limit to room bounds

Double-click objRmLevelController in the asset browser objects folder

Edit the objRmLevelController:step code to clamp the camera view to the room bounds

###### objRmLevelController:Step
```javascript
camera_set_view_pos(view_camera[0], clamp(objPlayer.x - wCam / 2, 0, room_width - wCam), clamp(objPlayer.y - hCam / 2, 0, room_height - hCam));
```

Press F5 to test the improved camera (centred on player and respecting room bounds), close the window when done testing

### Camera controller - smoother movement

Double-click objRmLevelController in the asset browser objects folder

Edit the objRmLevelController:step code to have the camera more smoothly follow the player (linear interpolation between current and target position reduces jitter)

###### objRmLevelController:Step
```javascript
var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);
// aim to focus on player while respecting room bounds, lerping to smooth out jitter
var newX = lerp(curX, clamp(objPlayer.x - wCam / 2, 0, room_width - wCam), 0.1);
var newY = lerp(curY, clamp(objPlayer.y - hCam / 2, 0, room_height - hCam), 0.1);
camera_set_view_pos(view_camera[0], newX, newY);
```

Press F5 to test the further improved camera (smoothly follows player and respects room bounds), close the window when done testing

### Quick restart/quit]

Double-click objRmLevelController in the asset browser objects folder

Click the add event button, select key pressed > others > escape

###### objRmLevelController:KeyPress-Escape
```javascript
game_end();
```

Click the add event button, select key pressed > enter

###### objRmLevelController:KeyPress-Enter
```javascript
game_restart();
```

Press F5 to test the shortcuts (move around, press enter to restart, repeat a few times, then press escape to exit)

### Camera controller - focus on start

Double-click rmLevel1 in the asset browser rooms folder

Move the objPlayer instance from an empty space towards the top left corner of the room to an empty space towards the bottom left corner of the room

Press F5 to see a problem with the camera (smoothly moves from the top left corner of the room to the player's start position - press enter to restart), press escape when done testing

Double-click objRmLevelController in the asset browser objects folder

Click the add event button, select other > room start

###### objRmLevelController:RoomStart
```javascript
// focus on player while respecting room bounds (immediately jump to position)
var camStartX = clamp(objPlayer.x - wCam / 2, 0, room_width - wCam);
var camStartY = clamp(objPlayer.y - hCam / 2, 0, room_height - hCam);
camera_set_view_pos(view_camera[0], camStartX, camStartY);
```

Press F5 to see the fixed camera (immediately focused on player while respecting room bounds on start - press enter to restart), press escape when done testing

-----
