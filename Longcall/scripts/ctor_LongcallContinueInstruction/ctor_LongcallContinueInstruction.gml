function LongcallContinueInstruction() constructor {
    static execute = function(_call) {
        _call.leave_breakable();
    }
}
