function LongcallObjectPrompt(_object, _params = undefined) : LongcallPrompt() constructor {
    object = _object;
    params = _params ?? {};
    
    static make_prompt = function(_call) {
        var _layer = resolve_layer();
        params.call = _call;
        instance_create_layer(0, 0, _layer, object, params);
        struct_remove(params, "call");
    }
    
    static resolve_layer = function() {
        if (struct_exists(params, "layer"))
            return params.layer;
        
        if (layer_exists("Instances"))
            return layer_get_id("Instances");
        
        var _layers = layer_get_all();
        if (array_length(_layers) > 0)
            return _layers[0];
        else
            return layer_create(0, "Instances");
    }
}