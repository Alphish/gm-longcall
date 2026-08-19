function DemoProgramBuilder() : LongcallProgramBuilder() constructor {
    static log = function(_message) {
        execute_method({ message: _message }, function() {
            show_debug_message(message);
        });
    }
    
    static log_received = function() {
        execute_function(function(_call, _args) {
            show_debug_message(_args);
        });
    }
    
    static print_value = function(_name) {
        var _instruction = new PrintValueInstruction(_name);
        add_instruction(_instruction);
    }
}