function Longcall(_program, _environment) constructor {
    program = _program;
    environment = _environment;
    scope = program.create_initial_scope(environment);
    
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
    
    // ------
    // Scopes
    // ------
    
    static enter_scope = function(_branch) {
        scope = scope.enter_scope(_branch);
    }
    
    static leave_scope = function() {
        scope = scope.leave_scope();
        if (is_undefined(scope))
            is_finished = true;
    }
}
