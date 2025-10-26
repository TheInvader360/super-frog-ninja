draw_set_font(fntVisitor1);
draw_set_colour(c_yellow);
draw_text(4, 1, "Timer " + string_replace_all(string_format(global.levelTimerTicks/60, 8, 1), " ", ""));
draw_text(4, 21, "Cherries " + string(global.collectedCollectibles) + "/" + string(global.totalCollectibles));
