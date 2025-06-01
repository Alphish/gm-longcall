function LongcallEnterScopeInstruction() : LongcallInstruction() constructor {
    static execute = function(_call, _args) {
        _call.enter_scope();
    }
}
