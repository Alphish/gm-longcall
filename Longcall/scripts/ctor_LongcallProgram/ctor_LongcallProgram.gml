function LongcallProgram(_entry, _subroutines = undefined) constructor {
    entry_branch = _entry;
    subroutines = _subroutines ?? {};
    
    static create_entry_scope = function(_environment) {
        return new LongcallScope(entry_branch, _environment, undefined);
    }
    
    static create_subroutine_scope = function(_subroutine, _environment) {
        var _branch = subroutines[$ _subroutine];
        return new LongcallScope(_branch, _environment, undefined);
    }
}
