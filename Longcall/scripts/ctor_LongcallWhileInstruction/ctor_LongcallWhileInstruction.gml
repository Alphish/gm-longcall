function LongcallWhileInstruction(_condition, _branch) : LongcallInstruction() constructor {
    condition = _condition;
    branch = _branch;
    
    static execute = function(_call) {
        var _check = LongcallEvaluation.resolve_bool(condition, _call);
        if (!_check)
            return;
        
        _call.backtrack(); // go back to the while instruction to run it again
        _call.enter_scope(branch);
    }
}
