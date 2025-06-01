function Longcall(_program, _environment) constructor {
    program = _program;
    environment = _environment;
    
    instruction = _program.entry_instruction;
    scope = new LongcallScope(environment);
    is_pending = false;
    is_finished = false;
    
    // -------
    // Running
    // -------
    
    static run_next = function() {
        if (!is_finished && !is_pending)
            instruction = instruction.execute(self, undefined) ?? (instruction.next ?? program.exit_instruction);
    }
    
    static run = function() {
        while (!is_finished && !is_pending) {
            instruction = instruction.execute(self, undefined) ?? (instruction.next ?? program.exit_instruction);
        }
    }
    
    static pause = function() {
        is_pending = true;
    }
    
    static resume_next = function(_arg = undefined) {
        if (is_finished)
            return;
        
        is_pending = false;
        instruction = instruction.execute(self, _arg) ?? (instruction.next ?? program.exit_instruction);
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
    
    static enter_scope = function() {
        scope = scope.enter_scope();
    }
    
    static leave_scope = function() {
        scope = scope.leave_scope();
    }
}
