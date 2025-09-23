function LongcallScopedOperator(_name, _apply) : LongcallOperator(_name, _apply) constructor {
    static skip_scope = function(_evaluation) {
        var _expression = _evaluation.expression;
        var _short_depth = 1;
        while (_short_depth > 0) {
            _evaluation.index += 1;
            var _item = _expression[_evaluation.index];
            if (_item == LongcallOperator.open_scope)
                _short_depth += 1;
            else if (_item == LongcallOperator.close_scope)
                _short_depth -= 1;
        }
    }
}

LongcallOperator.open_scope = new LongcallOperator(nameof(open_scope), function() {});
LongcallOperator.close_scope = new LongcallOperator(nameof(close_scope), function() {});

LongcallOperator.short_or = new LongcallScopedOperator(nameof(short_or), function(_evaluation) {
    var _stack = _evaluation.stack;
    show_debug_message(_stack);
    if (array_last(_stack) == true) {
        skip_scope(_evaluation);
    } else {
        array_pop(_evaluation.stack); // not the value we're looking for, discard
    }
});

LongcallOperator.short_and = new LongcallScopedOperator(nameof(short_and), function(_evaluation) {
    var _stack = _evaluation.stack;
    if (array_last(_stack) == false) {
        skip_scope(_evaluation);
    } else {
        array_pop(_evaluation.stack); // not the value we're looking for, discard
    }
});
