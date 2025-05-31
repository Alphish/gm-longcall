function LogReceivedInstruction() : LongcallInstruction() constructor {
    static execute = function(_call, _args) {
        show_debug_message(_args);
    }
}
