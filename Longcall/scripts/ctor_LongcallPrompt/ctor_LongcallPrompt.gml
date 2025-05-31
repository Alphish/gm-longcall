function LongcallPrompt() : LongcallInstruction() constructor {
    static execute = function(_call, _args = undefined) {
        _call.pause();
        make_prompt();
    }
    
    static make_prompt = function() {
        throw LongcallException.not_implemented(self, nameof(make_prompt));
    }
}
