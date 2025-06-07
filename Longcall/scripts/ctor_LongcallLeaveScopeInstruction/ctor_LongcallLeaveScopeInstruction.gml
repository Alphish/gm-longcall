function LongcallLeaveScopeInstruction() : LongcallInstruction() constructor {
    static execute = function(_call) {
        _call.leave_scope();
    }
}
