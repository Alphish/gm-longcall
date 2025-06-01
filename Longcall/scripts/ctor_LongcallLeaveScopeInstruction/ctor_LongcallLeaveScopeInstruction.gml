function LongcallLeaveScopeInstruction() : LongcallInstruction() constructor {
    static execute = function(_call, _args) {
        _call.leave_scope();
    }
}
