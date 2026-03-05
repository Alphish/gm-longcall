function LongcallContinueLoopHandler(_scope) : LongcallScopedInstructionHandler(_scope, "continue") constructor {
    static try_handle = function(_instruction, _call, _arg = undefined) {
        _call.leave_scope(scope);
    }
}
