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
