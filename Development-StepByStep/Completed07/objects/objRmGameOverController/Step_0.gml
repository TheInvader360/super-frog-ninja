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
