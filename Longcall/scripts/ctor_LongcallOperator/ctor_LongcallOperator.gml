function LongcallOperator(_name, _apply = undefined) constructor {
    name = _name;
    
    if (!is_undefined(_apply))
        self.apply = method(self, _apply);
    
    static apply = function() {
        throw LongcallException.not_implemented(self, nameof(apply));
    }
    
    static toString = function() {
        return name;
    }
}
