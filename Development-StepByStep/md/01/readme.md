#### Super Frog Ninja

## 01 - Prototype the core game mechanic using minimal placeholder assets

### Create project

Launch game maker studio

New > game > blank game

SuperFrogNinja

H:\GameMaker

### Project preferences

File > preferences > general settings > input > force laptop mode: disable > apply

File > preferences > sprite editor > default sprite origin: middle centre & default sprite animation speed: 15 > apply > ok

### Minimal sprites

Right-click the asset browser sprites folder, create > sprite, name: sprBlue, origin: top left

Click resize button, size: 16x16px, apply

Click edit image button, fill with blue (rgb:0,0,255), right-click default layer > edit layer properties, blend mode: normal, opacity: 60, close layer properties dialog

Right-click sprBlue in the asset browser sprites folder, duplicate, name: sprGreen, double-click sprGreen in asset browser sprites folder, edit image, fill with green (rgb:0,255,0)

Right-click sprBlue in the asset browser sprites folder, duplicate, name: sprMagenta, double-click sprMagenta in asset browser sprites folder, edit image, fill with magenta (rgb:255,0,255)

Right-click sprBlue in the asset browser sprites folder, duplicate, name: sprRed, double-click sprRed in asset browser sprites folder, edit image, fill with red (rgb:255,0,0)

Right-click sprBlue in the asset browser sprites folder, duplicate, name: sprYellow, double-click sprYellow in asset browser sprites folder, edit image, fill with yellow (rgb:255,255,0)

### First room

Double-click Room1 in the asset browser rooms folder and select the Background layer

Scroll down to the properties section of the inspector tab, click on the colour panel, select grey (rgb:128,128,128), ok, enable horizontal tile and vertical tile

Click on the Room1 tab in the main workspace area

In the room settings section of the inspector tab - set a width value of 960 and a height value of 540

In the viewports and cameras section of the inspector tab - enable viewports, then in the viewport 0 section enable visible, set camera properties width and height to 640x360, and set viewport properties width and height to 1280x720

Press F5 to test the empty room, close the window when done testing

### Minimal layout objects

Right-click the asset browser objects folder, create > object, name: objSolid, click on the "No Sprite" value, select Sprites, then sprBlue

Right-click the asset browser objects folder, create > object, name: objFatal, click on the "No Sprite" value, select Sprites, then sprRed

### Populate room with object instances

* Note - mouse wheel combined with ctrl/shift keys zoom/pan room
* Note - try to keep the number of instances low

Double-click Room1 in the asset browser rooms folder, create a new instance layer in the layers section of the inspector tab, set the name value to Layout

Expand the grid options toolbar (along the top of the Room1 tab in the main workspace area), set Grid X and Grid Y values to 16, and ensure Snap is enabled

Drag and drop objSolid from the asset browser objects folder into the room (place it on the top row, second column in)

With the object instance selected use the resize control to drag its right side towards the right of the level (create a long rectangle object spanning the top row from the second column in to last but one column across)

Drag and drop another objSolid instance from the asset browser objects folder into the room (place it on the left column, second row down)

With the second object instance selected use the resize control to drag its lower side towards the bottom of the level (create a long rectangle object spanning the left side from the second row in to last but one row down)

Keep repeating the steps of dragging in and resizing objSolid instances to create the desired level layout (if matching the example layout 18 variously resized objSolid instances are needed)

Drag and drop two objFatal instances from the asset browser objects folder into the room, placing and resizing as required to create the two trap areas along the bottom row

Press F5 to test the empty room, close the window when done testing

### Player object

Right-click the asset browser objects folder, create > object, name: objPlayer, click on the "No Sprite" value, select Sprites, then sprGreen

Click the add event button, select create - if the scripting preference dialog pops up select the gml code option and tick the "Don't ask again for this project" box then click ok

###### objPlayer:Create
```javascript
spd = 4;
xSpd = 0;
ySpd = 0;
```

Click the add event button, select step > step

###### objPlayer:Step
```javascript
var xDir = keyboard_check(vk_right) - keyboard_check(vk_left); // -1 left, 0 none, +1 right
var jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, objSolid);

xSpd = xDir * spd;
ySpd += 0.5; // pulled down by gravity

if (jump) ySpd = -12; // upward impulse

x += xSpd;
y += ySpd;
```

Double-click Room1 in the asset browser rooms folder, re-order the layers if required (drag and drop - Instances at the top, Layout in the middle, Background at the bottom)

Select the Instances layer, drag and drop objPlayer from the asset browser objects folder into the room (place it in an unoccupied space towards the top left corner of the room)

Press F5 to test the player as it stands (controllable, affected by gravity, but insubstantial), close the window when done testing

Edit the objPlayer:step code to only allow jumping when grounded and to respect collisions with objSolid by adding three if statements

###### objPlayer:Step
```javascript
var xDir = keyboard_check(vk_right) - keyboard_check(vk_left); // -1 left, 0 none, +1 right
var jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, objSolid);

xSpd = xDir * spd;
ySpd += 0.5; // pulled down by gravity

if (grounded) {
  if (jump) ySpd = -12; // upward impulse
}

// predictive collision on x-axis
if (place_meeting(x + xSpd, y, objSolid)) {
  xSpd = 0;
}
x += xSpd;

// predictive collision on y-axis
if (place_meeting(x, y + ySpd, objSolid)) {
  ySpd = 0;
}
y += ySpd;
```

Press F5 to test, close the window when done testing

-----
