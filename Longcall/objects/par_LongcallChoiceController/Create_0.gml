options_count = array_length(options);
selected_index = 0;

// -------
// Methods
// -------

select_previous = function() {
    if (selected_index > 0)
        selected_index--;
    else if (wrap_selection)
        selected_index = options_count - 1;
}

select_next = function() {
    if (selected_index < options_count - 1)
        selected_index++;
    else if (wrap_selection)
        selected_index = 0;
}

proceed = function() {
    var _call = call;
    var _option = options[selected_index];
    instance_destroy();
    _call.resume(_option.branch);
}

proceed_with = function(_option) {
    selected_index = is_real(_option) ? _option : array_get_index(options, _option);
    proceed();
}


