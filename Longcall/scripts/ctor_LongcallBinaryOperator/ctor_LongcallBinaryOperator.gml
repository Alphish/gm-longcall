function LongcallBinaryOperator(_name, _operation) : LongcallOperator(_name) constructor {
    operation = _operation;
    
    static apply = function(_evaluation) {
        var _stack = _evaluation.stack;
        var _right = array_pop(_stack);
        var _left = array_pop(_stack);
        array_push(_stack, operation(_left, _right));
    }
}

LongcallOperator.add = new LongcallBinaryOperator(nameof(add), function(_left, _right) { return _left + _right; });
LongcallOperator.subtract = new LongcallBinaryOperator(nameof(subtract), function(_left, _right) { return _left - _right; });
LongcallOperator.multiply = new LongcallBinaryOperator(nameof(multiply), function(_left, _right) { return _left * _right; });
LongcallOperator.divide = new LongcallBinaryOperator(nameof(divide), function(_left, _right) { return _left / _right; });
LongcallOperator.modulo = new LongcallBinaryOperator(nameof(modulo), function(_left, _right) { return _left % _right; });

LongcallOperator.equal = new LongcallBinaryOperator(nameof(equal), function(_left, _right) { return _left == _right; });
LongcallOperator.unequal = new LongcallBinaryOperator(nameof(unequal), function(_left, _right) { return _left != _right; });
LongcallOperator.greater_than = new LongcallBinaryOperator(nameof(greater_than), function(_left, _right) { return _left > _right; });
LongcallOperator.greater_or_equal = new LongcallBinaryOperator(nameof(greater_or_equal), function(_left, _right) { return _left >= _right; });
LongcallOperator.less_than = new LongcallBinaryOperator(nameof(less_than), function(_left, _right) { return _left < _right; });
LongcallOperator.less_or_equal = new LongcallBinaryOperator(nameof(less_or_equal), function(_left, _right) { return _left <= _right; });

LongcallOperator.logical_and = new LongcallBinaryOperator(nameof(logical_and), function(_left, _right) { return _left && _right; });
LongcallOperator.logical_xor = new LongcallBinaryOperator(nameof(logical_xor), function(_left, _right) { return _left ^^ _right; });
LongcallOperator.logical_or = new LongcallBinaryOperator(nameof(logical_or), function(_left, _right) { return _left || _right; });
