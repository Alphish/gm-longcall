function SetValueInstruction(_name, _value) : LongcallInstruction() constructor {
    name = _name;
    value = _value;
    
    static execute = function(_call, _args) {
        _call.set_value(name, value);
    }
}
