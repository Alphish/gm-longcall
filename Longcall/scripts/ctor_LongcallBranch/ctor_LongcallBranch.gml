function LongcallBranch(_instructions, _fallback = undefined) constructor {
    instructions = _instructions;
    length = array_length(instructions);
    fallback = _fallback ?? new LongcallLeaveScopeInstruction();
    
    static execute_at = function(_index, _call, _arg = undefined) {
        if (_index < length)
            instructions[_index].execute(_call, _arg);
        else
            fallback.execute(_call, _arg);
    }
}
