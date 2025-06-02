function LongcallDeclareInstruction(_name, _value) : LongcallInstruction() constructor {
    name = _name;
    value = _value;
    
    static execute = function(_call) {
        var _result = LongcallEvaluation.create(value, _call);
        if (is_instanceof(_result, LongcallEvaluation)) {
            _result = _result.evaluate();
        }
        _call.declare_value(name, _result);
    }
}
