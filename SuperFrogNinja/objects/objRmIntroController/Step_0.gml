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
