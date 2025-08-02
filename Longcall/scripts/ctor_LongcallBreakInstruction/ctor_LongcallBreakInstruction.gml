function LongcallBreakInstruction() constructor {
    static execute = function(_call) {
        _call.leave_breakable();
        _call.skip(); // skip the instruction that would re-enter the loop
    }
}
