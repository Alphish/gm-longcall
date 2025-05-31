function LongcallFinish(_inner = undefined) : LongcallInstruction() constructor {
    next = self;
    inner = _inner;
    
    static execute = function(_call, _args) {
        if (!is_undefined(inner))
            inner.execute(_call, _args);
        
        _call.finish();
    }
}
