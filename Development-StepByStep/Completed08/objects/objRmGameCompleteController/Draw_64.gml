draw_set_font(fntVisitor1);
draw_set_colour(c_yellow);
draw_set_halign(fa_center);
draw_text(320, 75, "Timer " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
draw_text(320, 95, "Cherries " + string(global.collectedCollectibles) + "/" + string(global.totalCollectibles));
draw_set_halign(fa_left); // restore default
