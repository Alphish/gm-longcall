function LogInstruction(_message) : LongcallInstruction() constructor {
    message = _message;
    
    static execute = function(_call, _args) {
        show_debug_message(message);
    }
}
