function LongcallEnterScopeInstruction(_branch) : LongcallBlock() constructor {
    branch = _branch;
    
    static resolve_branch = function() {
        return branch;
    }
    
    static on_close = function(_call, _scope) {
        // do nothing
    }
}
