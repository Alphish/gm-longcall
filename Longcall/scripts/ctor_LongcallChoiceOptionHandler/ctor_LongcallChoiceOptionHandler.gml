function LongcallChoiceOptionHandler(_scope) : LongcallScopedInstructionHandler(_scope, "option") constructor {
    static try_handle = function(_instruction, _call, _args = undefined) {
        scope.add_option(_instruction.data, _instruction.branch);
    }
}
