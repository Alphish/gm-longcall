function LongcallChoiceObjectPrompt(_branch, _object, _params = undefined) : LongcallChoiceBlock(_branch) constructor {
    object_prompt = new LongcallObjectPrompt(_object, _params);
    
    static on_close = function(_call, _scope) {
        object_prompt.execute(_call, { options: _scope.options });
    }
}
