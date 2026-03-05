function LongcallChoiceScope(_branch, _environment, _parent, _block) : LongcallScope(_branch, _environment, _parent, _block) constructor {
    add_handler(LongcallBreakOnceHandler);
    add_handler(LongcallChoiceOptionHandler);
    
    options = [];
    
    static add_option = function(_data, _branch) {
        array_push(options, { data: _data, branch: _branch });
    }
}
