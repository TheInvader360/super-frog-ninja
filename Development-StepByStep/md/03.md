#### Super Frog Ninja

## 03 - More game elements (traps, collectibles, goal) and improved collisions

### Improved collisions

Press F5 to see an issue with collisions (jump onto first platform then fall back down to see a jittery collision with the ground), press escape when done testing

Double-click objPlayer in the asset browser objects folder

Edit the objPlayer:step code to have the player pushed right up against the obstacle when colliding (while loop iteratively repositions player until it meets the obstacle, and then the speed on relevant axis is set to zero)

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
```

Press F5 to test that the issue has been fixed, press escape when done testing

### Fatal traps

Double-click objPlayer in the asset browser objects folder

Edit the objPlayer:step code to add an objFatal collision check at the end

###### objPlayer:Step
```javascript
// ...code omitted from example listing

if (place_meeting(x, y, objFatal)) {
  game_restart();
}
```

Press F5 to test (fall into a fatal trap to automatically restart the game), press escape when done testing

### Collectibles

Right-click the asset browser objects folder, create > object, name: objCollectible, click on the "No Sprite" value, select Sprites, then sprMagenta

Double-click rmLevel1 in the asset browser rooms folder

Select the Instances layer, drag and drop objCollectible from the asset browser objects folder into the room (place it near the player's start position)

Keep dragging in and positioning objCollectible instances to match the desired level layout (if matching the example layout 30 objCollectible instances are needed)

Double-click objPlayer in the asset browser objects folder

Click the add event button, select collision > objects > objCollectible

###### objPlayer:Collision-objCollectible
```javascript
instance_destroy(other);
```

Press F5 to test (collectibles disappear on collision with player), press escape when done testing

### Goal

Right-click the asset browser objects folder, create > object, name: objGoal, click on the "No Sprite" value, select Sprites, then sprYellow

Double-click rmLevel1 in the asset browser rooms folder

Select the Instances layer, drag and drop objGoal from the asset browser objects folder into the room (place it in an empty space towards the top right corner of the room)

Double-click objPlayer in the asset browser objects folder

Click the add event button, select collision > objects > objGoal

###### objPlayer:Collision-objGoal
```javascript
game_restart(); // temporary action...
```

Press F5 to test (game restarts when player collides with goal), press escape when done testing

-----
