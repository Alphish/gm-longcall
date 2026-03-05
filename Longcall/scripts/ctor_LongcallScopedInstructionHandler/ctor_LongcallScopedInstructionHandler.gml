function LongcallScopedInstructionHandler(_scope, _type) constructor {
    scope = _scope;
    type = _type;
    
    static try_handle = function(_instruction, _call, _arg = undefined) {
        throw LongcallException.not_implemented(self, nameof(try_handle));
    }
}
