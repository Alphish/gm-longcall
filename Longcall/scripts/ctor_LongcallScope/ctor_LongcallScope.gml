function LongcallScope(_environment,_parent = undefined) constructor {
    environment = _environment;
    parent = _parent;
    
    declarations = is_undefined(parent) ? {} : parent.declarations;
    declared_keys = [];
    redeclarations = {};
    
    // ------
    // Values
    // ------
    
    static declare_value = function(_name, _value = undefined) {
        var _key = environment.case_sensitive ? _name : string_lower(_name);
        
        if (environment.has_value(_key))
            throw LongcallException.illegal_declaration_reserved(_name);
        
        if (struct_exists(declarations, _key)) {
            if (!environment.can_redeclare)
                throw LongcallException.illegal_declaration_forbidden(_name);
            else if (array_contains(declared_keys, _key))
                throw LongcallException.illegal_declaration_duplicate(_name);
            else
                redeclarations[$ _key] = declarations[$ _key];
        }
        
        declarations[$ _key] = _value;
        array_push(declared_keys, _key);
    }
    
    static has_value = function(_name) {
        var _key = environment.case_sensitive ? _name : string_lower(_name);
        return struct_exists(declarations, _key) || environment.has_value(_key);
    }
    
    static get_value = function(_name) {
        var _key = environment.case_sensitive ? _name : string_lower(_name);
        
        if (struct_exists(declarations, _key))
            return declarations[$ _key];
        else if (environment.has_value(_key))
            return environment.get_value(_key);
        else
            throw LongcallException.undeclared_value(_name);
    }
    
    static set_value = function(_name, _value) {
        var _key = environment.case_sensitive ? _name : string_lower(_name);
        
        if (struct_exists(declarations, _key))
            declarations[$ _key] = _value;
        else if (environment.has_value(_key))
            environment.set_value(_key, _value);
        else
            throw LongcallException.undeclared_value(_name);
    }
    
    // -----
    // Scope
    // -----
    
    static enter_scope = function() {
        return new LongcallScope(environment, self);
    }
    
    static leave_scope = function() {
        array_foreach(declared_keys, function(_key) {
            if (struct_exists(redeclarations, _key))
                declarations[$ _key] = redeclarations[$ _key];
            else
                struct_remove(declarations, _key);
        });
        return parent;
    }
}