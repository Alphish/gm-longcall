function DialoguePrompt(_text) : LongcallPrompt() constructor {
    text = _text;
    
    static make_prompt = function(_call, _args) {
        instance_create_layer(0, 0, "Instances", obj_Dialogue, { text });
    }
}