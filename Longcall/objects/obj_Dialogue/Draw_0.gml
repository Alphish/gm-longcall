draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(0, 0, room_width, 120, false);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_Demo);
draw_text(16, 16, text);

draw_set_color(c_white);
