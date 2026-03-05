draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(0, 0, room_width, 180, false);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_Demo);
draw_text(16, 16, question);

for (var i = 0; i < options_count; i++) {
    var _text = options[i].data;
    if (selected_index == i)
        _text = $"[{_text}]";
    
    draw_text(16, 40 + 24 * i, _text);
}

draw_set_color(c_white);
