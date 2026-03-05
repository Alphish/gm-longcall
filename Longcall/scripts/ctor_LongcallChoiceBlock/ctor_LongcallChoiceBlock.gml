function LongcallChoiceBlock(_branch) : LongcallBlock() constructor {
    branch = _branch;
    
    static resolve_branch = function(_call) {
        return branch;
    }
    
    static create_scope = function(_branch, _call) {
        return new LongcallChoiceScope(_branch, _call.scope.environment, _call.scope, self);
    }
}
