function LongcallScopeHandledInstruction(_type) : LongcallInstruction() constructor {
    type = _type;
    
    static execute = function(_call, _arg = undefined) {
        var _scope = _call.scope;
        while (!is_undefined(_scope)) {
            if (_scope.try_handle(self, _call, _arg))
                return;
            
            _scope = _scope.parent;
        }
        handle_out_of_scope(_call, _arg);
    }
    
    static handle_out_of_scope = function(_call, _arg = undefined) {
        throw LongcallException.unhandled_scope_instruction(type);
    }
}
