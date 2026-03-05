for (var i = 0; i < options_count; i++) {
    if (keyboard_check_pressed(49 + i)) {
        proceed_with(i);
        return;
    }
}

if (keyboard_check_pressed(vk_up))
    select_previous();
else if (keyboard_check_pressed(vk_down))
    select_next();

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
    proceed();
    keyboard_clear(vk_space);
    keyboard_clear(vk_enter);
}
