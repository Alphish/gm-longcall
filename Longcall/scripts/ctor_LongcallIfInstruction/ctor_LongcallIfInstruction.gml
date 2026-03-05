function LongcallIfInstruction(_condition, _then, _else = undefined) : LongcallBlock() constructor {
    condition = _condition;
    then_branch = _then;
    else_branch = _else;
    
    static resolve_branch = function(_call, _arg) {
        var _check = LongcallEvaluation.resolve_bool(condition, _call);
        return _check ? then_branch : else_branch;
    }
    
    static on_close = function(_call, _scope) {
        // do nothing
    }
}
