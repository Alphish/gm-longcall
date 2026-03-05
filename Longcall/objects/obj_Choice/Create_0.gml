// Inherit the parent event
event_inherited();

var _names = array_map(options, function(_option, _idx) { return $"{_idx + 1} - {_option.data}"; });

description = $"{question}\n{string_join_ext("\n", _names)}";
