function LongcallBreakLoopHandler(_scope) : LongcallScopedInstructionHandler(_scope, "break") constructor {
    static try_handle = function(_instruction, _call, _arg = undefined) {
        scope.is_broken = true;
        _call.leave_scope(scope);
    }
}
