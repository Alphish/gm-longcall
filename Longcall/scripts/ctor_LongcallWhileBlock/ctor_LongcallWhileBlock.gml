function LongcallWhileBlock(_condition, _branch) : LongcallBlock() constructor {
    condition = _condition;
    branch = _branch;
    
    static resolve_branch = function(_call) {
        var _check = LongcallEvaluation.resolve_bool(condition, _call);
        return _check ? branch : undefined;
    }
    
    static create_scope = function(_branch, _call) {
        return new LongcallLoopScope(_branch, _call.scope.environment, _call.scope, self);
    }
    
    static on_close = function(_call, _scope) {
        if (_scope.is_broken)
            return;
        
        _call.backtrack();
    }
}
