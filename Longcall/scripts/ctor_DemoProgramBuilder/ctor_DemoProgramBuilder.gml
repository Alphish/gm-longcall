function DemoProgramBuilder() : LongcallProgramBuilder() constructor {
    static log = function(_message) {
        var _instruction = new LogInstruction(_message);
        add_instruction(_instruction);
    }
    
    static log_received = function() {
        var _instruction = new LogReceivedInstruction();
        add_instruction(_instruction);
    }
    
    static print_value = function(_name) {
        var _instruction = new PrintValueInstruction(_name);
        add_instruction(_instruction);
    }
}