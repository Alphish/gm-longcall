function LongcallIfInstruction(_condition, _then, _else = undefined) : LongcallInstruction() constructor {
    condition = _condition;
    then_branch = _then;
    else_branch = _else;
    
    static execute = function(_call) {
        var _check = LongcallEvaluation.resolve_bool(condition, _call);
        if (_check)
            _call.enter_scope(then_branch);
        else if (!is_undefined(else_branch))
            _call.enter_scope(else_branch);
        
        // if a condition isn't met and no "else" branch was given
        // just continue with the current branch
    }
}
