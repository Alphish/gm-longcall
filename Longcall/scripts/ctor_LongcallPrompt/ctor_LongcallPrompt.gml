function LongcallPrompt() : LongcallInstruction() constructor {
    static execute = function(_call, _arg = undefined) {
        _call.pause();
        make_prompt(_call, _arg);
    }
    
    static make_prompt = function(_call, _arg) {
        throw LongcallException.not_implemented(self, nameof(make_prompt));
    }
}
