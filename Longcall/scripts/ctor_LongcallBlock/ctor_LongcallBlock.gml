function LongcallBlock() : LongcallInstruction() constructor {
    static execute = function(_call, _arg = undefined) {
        var _branch = resolve_branch(_call, _arg);
        if (is_undefined(_branch))
            return;
        
        var _scope = create_scope(_branch, _call);
        _call.enter_scope(_scope);
    }
    
    static resolve_branch = function(_call, _arg = undefined) {
        throw LongcallException.not_implemented(self, nameof(resolve_branch));
    }
    
    static create_scope = function(_branch, _call, _arg = undefined) {
        return new LongcallScope(_branch, _call.scope.environment, _call.scope, self);
    }
    
    static on_close = function(_call, _scope) {
        throw LongcallException.not_implemented(self, nameof(on_close));
    }
}
