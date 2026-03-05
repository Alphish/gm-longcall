function Longcall(_program, _environment, _subroutine = undefined) constructor {
    program = _program;
    environment = _environment;
    scope = is_undefined(_subroutine)
        ? program.create_entry_scope(environment)
        : program.create_subroutine_scope(_subroutine, environment);
    
    is_pending = false;
    is_finished = false;
    
    // -------
    // Running
    // -------
    
    static run_next = function() {
        if (!is_finished && !is_pending) {
            scope.execute_next(self, undefined);
        }
    }
    
    static run = function() {
        while (!is_finished && !is_pending) {
            scope.execute_next(self, undefined);
        }
    }
    
    static backtrack = function() {
        scope.branch_index -= 1;
    }
    
    static skip = function() {
        scope.branch_index += 1;
    }
    
    static pause = function() {
        is_pending = true;
    }
    
    static resume_next = function(_arg = undefined) {
        if (is_finished)
            return;
        
        is_pending = false;
        scope.execute_next(self, _arg);
    }
    
    static resume = function(_arg = undefined) {
        resume_next(_arg);
        run();
    }
    
    static finish = function() {
        is_finished = true;
    }
    
    // ------
    // Values
    // ------
    
    static declare_value = function(_name, _value = undefined) {
        scope.declare_value(_name, _value);
    }
    
    static get_value = function(_name) {
        return scope.get_value(_name);
    }
    
    static set_value = function(_name, _value) {
        scope.set_value(_name, _value);
    }
    
    // ----
    // Flow
    // ----
    
    static enter_branch = function(_branch, _sctor = undefined) {
        _sctor ??= LongcallScope;
        var _scope = new _sctor(_branch, scope.environment, scope);
        enter_scope(_scope);
    }
    
    static enter_scope = function(_scope) {
        scope = _scope;
    }
    
    static leave_scope = function(_scope = undefined) {
        _scope ??= scope;
        while (scope != _scope) {
            leave_current_scope();
            if (is_undefined(scope))
                throw LongcallException.leaving_unrelated_scope(_scope);
        }
        leave_current_scope();
    }
    
    static leave_current_scope = function() {
        var _left_scope = scope;
        scope = _left_scope.leave();
        _left_scope.after_leave(self);
        if (is_undefined(scope))
            is_finished = true;
    }
    
    static jump_to = function(_subroutine) {
        scope = program.create_subroutine_scope(_subroutine, environment);
    }
}
