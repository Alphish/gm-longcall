function DeclareValueInstruction(_name, _value) : LongcallInstruction() constructor {
    name = _name;
    value = _value;
    
    static execute = function(_call, _args) {
        _call.declare_value(name, value);
    }
}
