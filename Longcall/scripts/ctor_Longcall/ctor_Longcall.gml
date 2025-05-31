function Longcall(_program) constructor {
    program = _program;
    instruction = _program.entry_instruction;
    is_pending = false;
    is_finished = false;
    
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
}
