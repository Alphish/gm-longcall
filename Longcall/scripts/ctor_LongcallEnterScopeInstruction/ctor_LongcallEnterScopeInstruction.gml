function LongcallEnterScopeInstruction(_branch) : LongcallInstruction() constructor {
    branch = _branch;
    
    static execute = function(_call) {
        _call.enter_scope(branch);
    }
}
