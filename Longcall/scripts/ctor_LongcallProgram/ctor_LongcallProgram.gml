function LongcallProgram(_branch) constructor {
    entry_branch = _branch;
    
    static create_initial_scope = function(_environment) {
        return new LongcallScope(entry_branch, _environment, undefined);
    }
}
