function LongcallEnvironment() constructor {
    case_sensitive = true;
    can_redeclare = false;
    
    static has_value = function(_key) {
        return false;
    }
    
    static get_value = function(_key) {
        throw LongcallException.not_implemented(self, nameof(get_value));
    }
    
    static set_value = function(_key, _value) {
        throw LongcallException.not_implemented(self, nameof(set_value));
    }
}
