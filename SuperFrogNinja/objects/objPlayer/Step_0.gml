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
  audio_play_sound(sfxDead, 1, false);
  instance_create_layer(x, y, layer, objPlayerDead); // create an instance of objPlayerDead at the player's position
  instance_destroy(); // destroy the original player instance
}

if (xDir != 0) image_xscale = xDir; // flip image when needed
