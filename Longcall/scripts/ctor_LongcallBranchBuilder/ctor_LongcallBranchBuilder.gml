function LongcallBranchBuilder(_parent = undefined) constructor {
    parent = _parent;
    instructions = [];
    stored_values = {};
    inner_branches = {};
    
    static accept_instruction = function(_instruction) {
        array_push(instructions, _instruction);
    }
    
    static store_value = function(_name, _value) {
        stored_values[$ _name] = _value;
    }
    
    static take_value = function(_name) {
        var _value = stored_values[$ _name];
        struct_remove(stored_values, _name);
        return _value;
    }
    
    static begin_branch = function(_name) {
        var _branch = new LongcallBranchBuilder(self);
        inner_branches[$ _name] = _branch;
        return _branch;
    }
    
    static take_branch = function(_name) {
        var _branch = inner_branches[$ _name];
        struct_remove(inner_branches, _name);
        return _branch;
    }
    
    static build = function() {
        return new LongcallBranch(instructions);
    }
}
