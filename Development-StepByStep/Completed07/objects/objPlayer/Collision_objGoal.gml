room_goto(rmGameComplete);
audio_play_sound(sfxGoal, 1, false);
show_debug_message("Timer: " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
