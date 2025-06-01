function PrintValueInstruction(_name) : LongcallInstruction() constructor {
    name = _name;
    
    static execute = function(_call, _args) {
        var _value = _call.get_value(name);
        show_debug_message(_value);
    }
}
