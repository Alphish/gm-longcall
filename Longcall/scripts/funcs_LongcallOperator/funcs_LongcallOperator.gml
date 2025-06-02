function LongcallOperator() {}

LongcallOperator.logical_not = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _operand = array_pop(_stack);
    array_push(_stack, !_operand);
}

LongcallOperator.negate = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _operand = array_pop(_stack);
    array_push(_stack, -_operand);
}

LongcallOperator.add = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left + _right);
}

LongcallOperator.subtract = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left - _right);
}

LongcallOperator.multiply = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left * _right);
}

LongcallOperator.divide = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left / _right);
}

LongcallOperator.modulo = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left % _right);
}

LongcallOperator.equal = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left == _right);
}

LongcallOperator.unequal = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left != _right);
}

LongcallOperator.greater_than = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left > _right);
}

LongcallOperator.greater_or_equal = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left >= _right);
}

LongcallOperator.less_than = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left < _right);
}

LongcallOperator.less_or_equal = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left <= _right);
}

LongcallOperator.logical_and = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left && _right);
}

LongcallOperator.logical_xor = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left ^^ _right);
}

LongcallOperator.logical_or = function(_evaluation) {
    var _stack = _evaluation.stack;
    var _right = array_pop(_stack);
    var _left = array_pop(_stack);
    array_push(_stack, _left || _right);
}
