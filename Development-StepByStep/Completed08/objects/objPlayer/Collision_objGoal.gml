audio_play_sound(sfxGoal, 1, false);
//show_debug_message("Timer: " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
instance_create_layer(x, y, layer, objPlayerGoal); // create an instance of objPlayerGoal at the player's position
instance_destroy(); // destroy the original player instance
