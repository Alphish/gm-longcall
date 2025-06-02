function LongcallEvaluation(_expression, _call) constructor {
    expression = _expression;
    call = _call;
    
    stack = [];
    index = 0;
    count = array_length(_expression);
    
    static evaluate = function() {
        while (index < count) {
            var _element = expression[index];
            if (is_method(_element))
                _element(self);
            else
                array_push(stack, LongcallEvaluation.evaluate_primitive(_element, call));
            
            index++;
        }
        return stack[0];
    }
}

LongcallEvaluation.create = function(_expression, _call) {
    if (!is_array(_expression))
        return LongcallEvaluation.evaluate_primitive(_expression, _call);
    else
        return new LongcallEvaluation(_expression, _call);
}

LongcallEvaluation.evaluate_primitive = function(_value, _call) {
    if (!is_string(_value))
        return _value;
    else if (string_starts_with(_value, "@"))
        return _call.get_value(string_delete(_value, 1, 1));
    else if (string_starts_with(_value, "\""))
        return string_copy(_value, 2, string_length(_value) - (string_ends_with(_value, "\"") ? 2 : 1));
    else
        return _value;
}
