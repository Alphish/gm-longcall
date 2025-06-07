function LongcallSetInstruction(_name, _value) : LongcallInstruction() constructor {
    name = _name;
    value = _value;
    
    static execute = function(_call) {
        var _result = LongcallEvaluation.resolve(value, _call);
        _call.set_value(name, _result);
    }
}
