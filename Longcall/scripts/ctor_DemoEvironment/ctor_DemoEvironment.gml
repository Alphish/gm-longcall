function DemoEnvironment() : LongcallEnvironment() constructor {
    static has_value = function(_key) {
        return _key == "time";
    }
    
    static get_value = function(_key) {
        if (_key == "time")
            return $"{current_hour}:{current_minute}:{current_second}";
        else
            return undefined;
    }
    
    // set_value remains unimplemented
}
