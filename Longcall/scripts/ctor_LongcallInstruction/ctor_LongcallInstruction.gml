function LongcallInstruction() constructor {
    next = undefined;
    
    static execute = function(_call, _arg = undefined) {
        throw LongcallException.not_implemented(self, nameof(execute));
    }
}
