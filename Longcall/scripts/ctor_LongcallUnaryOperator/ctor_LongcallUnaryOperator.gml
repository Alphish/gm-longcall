function LongcallUnaryOperator(_name, _operation) : LongcallOperator(_name) constructor {
    operation = _operation;
    
    static apply = function(_evaluation) {
        var _stack = _evaluation.stack;
        var _operand = array_last(_stack);
        _stack[array_length(_stack) - 1] = operation(_operand);
    }
}

LongcallOperator.logical_not = new LongcallUnaryOperator(nameof(logical_not), function(_operand) { return !_operand; });
LongcallOperator.negate = new LongcallUnaryOperator(nameof(negate), function(_operand) { return -_operand; });
