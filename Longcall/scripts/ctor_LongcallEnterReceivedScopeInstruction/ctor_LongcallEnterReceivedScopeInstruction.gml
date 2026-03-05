function LongcallEnterReceivedScopeInstruction() : LongcallBlock() constructor {
    static resolve_branch = function(_call, _arg) {
        return _arg;
    }
    
    static on_close = function(_call, _scope) {
        // do nothing
    }
}
