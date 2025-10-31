#### Super Frog Ninja

## 05 - Visual improvements (tileset, background, sprites)

### Tileset

Drag and drop (using windows explorer) the provided sprTsLevel.png file (in the Assets folder) into the asset browser sprites folder

Right-click the asset browser tile sets folder, create > tile set, name: tsLevel, click on the "No Sprite" value, select Sprites, then sprTsLevel

Double-click rmLevel1 in the asset browser rooms folder, create a new tile layer in the layers section of the inspector tab, set the name value to Tiles

Re-order the layers if required (drag and drop - Instances at the top, then Layout, then Tiles, and Background at the bottom)

Select the Tiles layer, click on the "No Tile Set" value in the Room Editor tab, select Tile Sets, then tsLevel

Draw tiles as appropriate to match the level layout

Once satisfied that the Tiles and Layout layers match, click the visibility toggle (eye icon) to hide the Layout layer

Press F5 to test the new tile layer, press escape when done testing

### Background

Drag and drop (using windows explorer) the provided sprBackground.png file (in the Assets folder) into the asset browser sprites folder

Double-click rmLevel1 in the asset browser rooms folder

Select the Background layer, click on the "No Sprite" value, select Sprites, then sprBackground

Press F5 to test the static tiled background, press escape when done testing

Double-click objRmLevelController in the asset browser objects folder

Double-click the existing Step event

Add some code at the end to introduce a parallax scrolling effect (this gives an illusion of depth)

###### objRmLevelController:Step
```javascript
// ...code omitted from example listing

// apply a parallax effect to the background layer
layer_x(layer_get_id("Background"), newX * 0.65);
layer_y(layer_get_id("Background"), newY * 0.65);
```

Press F5 to test the parallax scrolling background, press escape when done testing

### Collectible sprite

Drag and drop (using windows explorer) the provided sprCollectible_strip17.png file (in the Assets folder) into the asset browser sprites folder

Under collision mask, set mode to manual, and the left/right/top/bottom values to 10/21/14/21, click the play button to view the animation and verify that the collision mask is appropriate

Double-click objCollectible in the asset browser objects folder

Click on the sprMagenta value, select Sprites, then sprCollectible

Press F5 to test the updated collectibles, press escape when done testing

### Goal sprite

Drag and drop (using windows explorer) the provided sprGoal_strip8.png file (in the Assets folder) into the asset browser sprites folder

Under collision mask, set mode to manual, and the left/right/top/bottom values to 18/45/28/63, click the play button to view the animation and verify that the collision mask is appropriate

Double-click objGoal in the asset browser objects folder

Click on the sprYellow value, select Sprites, then sprGoal

Press F5 to test the updated goal, press escape when done testing

### Reposition instances

Double-click rmLevel1 in the asset browser rooms folder

Select the Instances layer, in grid options (main workspace area toolbar option) set Grid X and Grid Y both to 16

Reposition the collectible and goal instances as required

Press F5 to test the updated collectible and goal positions, press escape when done testing

### Player sprites

Drag and drop (using windows explorer) the provided sprPlayerIdle_strip11.png file (in the Assets folder) into the asset browser sprites folder

Under collision mask, set mode to manual, and the left/right/top/bottom values to 7/25/7/30, click the play button to view the animation and verify that the collision mask is appropriate

Drag and drop (using windows explorer) the provided sprPlayerJump.png file (in the Assets folder) into the asset browser sprites folder

Under collision mask, set mode to manual, and the left/right/top/bottom values to 7/25/5/30, verify that the collision mask is appropriate

Drag and drop (using windows explorer) the provided sprPlayerRun_strip12.png file (in the Assets folder) into the asset browser sprites folder

Under collision mask, set mode to manual, and the left/right/top/bottom values to 6/26/5/30, click the play button to view the animation and verify that the collision mask is appropriate

Double-click objPlayer in the asset browser objects folder

Click on the sprGreen value, select Sprites, then sprPlayerIdle

Press F5 to test the player sprite (note that it is animated, but always in the idle state and always facing right), press escape when done testing

Double-click objPlayer in the asset browser objects folder

Double-click the existing Step event

Add some code at the end to flip the sprite if moving left or right

###### objPlayer:Step
```javascript
// ...code omitted from example listing

if (xDir != 0) image_xscale = xDir; // flip image when needed
```

Press F5 to test the player sprite (animated, facing the correct direction, but always in the idle state), press escape when done testing

Double-click objPlayer in the asset browser objects folder

Double-click the existing Step event

Add some code inside the "if grounded" block to switch between the running and idle sprites (depends on whether or not moving on the x-axis)

Add an else clause to the "if grounded" block to switch to the jumping sprite if not grounded

Here is the complete objPlayer:Step code as it should appear by now

###### objPlayer:Step
```javascript
var xDir = keyboard_check(vk_right) - keyboard_check(vk_left); // -1 left, 0 none, +1 right
var jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, objSolid);

xSpd = xDir * spd;
ySpd += 0.5; // pulled down by gravity

if (grounded) {
  if (xDir != 0) sprite_index = sprPlayerRun;
  else sprite_index = sprPlayerIdle;
  if (jump) ySpd = -12; // upward impulse
} else {
  sprite_index = sprPlayerJump;
}

// predictive collision on x-axis
if (place_meeting(x + xSpd, y, objSolid)) {
  // push up against the obstacle for pixel perfect result
  while (!place_meeting(x + sign(xSpd), y, objSolid)) {
    x += sign(xSpd);
  }
  xSpd = 0;
}
x += xSpd;

// predictive collision on y-axis
if (place_meeting(x, y + ySpd, objSolid)) {
  // push up against the obstacle for pixel perfect result
  while (!place_meeting(x, y + sign(ySpd), objSolid)) {
    y += sign(ySpd);
  }
  ySpd = 0;
}
y += ySpd;

if (place_meeting(x, y, objFatal)) {
  room_goto(rmGameOver);
}

if (xDir != 0) image_xscale = xDir; // flip image when needed
```

Press F5 to test the player sprite (animated, facing the correct direction, idle/jump/run states as appropriate), press escape when done testing

-----
