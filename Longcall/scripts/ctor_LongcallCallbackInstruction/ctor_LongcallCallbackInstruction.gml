function LongcallCallbackInstruction(_callback) : LongcallInstruction() constructor {
    execute = is_method(_callback) || is_undefined(method_get_self) ?  _callback : method(self, _callback);
}
