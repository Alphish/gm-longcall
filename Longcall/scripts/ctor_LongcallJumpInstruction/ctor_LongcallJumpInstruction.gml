function LongcallJumpInstruction(_subroutine) : LongcallInstruction() constructor {
    subroutine = _subroutine;
    
    static execute = function(_call) {
        _call.jump_to(subroutine);
    }
}
