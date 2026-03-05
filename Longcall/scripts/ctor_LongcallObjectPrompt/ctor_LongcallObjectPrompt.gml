function LongcallObjectPrompt(_object, _params = undefined) : LongcallPrompt() constructor {
    object = _object;
    params = _params ?? {};
    
    static make_prompt = function(_call, _arg = undefined) {
        var _layer = resolve_layer();
        var _params = variable_clone(params, 0);
        populate_params(_params, _call, _arg);
        instance_create_layer(0, 0, _layer, object, _params);
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
    
    static populate_params = function(_params, _call, _arg) {
        if (!is_undefined(_arg)) {
            struct_foreach(_arg, method(_params, function(_key, _value) {
                self[$ _key] = _value;
            }));
        }
        _params.call = _call;
    }
}
