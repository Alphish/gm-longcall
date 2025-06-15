function LongcallProgramBuilder() {
    root_branch = new LongcallBranchBuilder();
    current_branch = root_branch;
    
    static add_instruction = function(_instruction) {
        current_branch.accept_instruction(_instruction);
    }
    
    static store_builder_value = function(_name, _value) {
        current_branch.store_value(_name, _value);
    }
    
    static take_builder_value = function(_name) {
        return current_branch.take_value(_name);
    }
    
    static begin_branch = function(_name) {
        current_branch = current_branch.begin_branch(_name);
    }
    
    static end_branch = function() {
        current_branch = current_branch.parent;
    }
    
    static take_branch = function(_name) {
        return current_branch.take_branch(_name);
    }
    
    static build = function() {
        var _branch = root_branch.build();
        return new LongcallProgram(_branch);
    }
    
    // ------
    // Values
    // ------
    
    static declare_value = function(_name, _value) {
        var _instruction = new LongcallDeclareInstruction(_name, _value);
        add_instruction(_instruction);
    }
    
    static set_value = function(_name, _value) {
        var _instruction = new LongcallSetInstruction(_name, _value);
        add_instruction(_instruction);
    }
    
    // ----
    // Flow
    // ----
    
    // Scope
    
    static begin_scope = function() {
        begin_branch("scope");
    }
    
    static end_scope = function() {
        end_branch();
        var _branch = take_branch("scope").build();
        var _instruction = new LongcallEnterScopeInstruction(_branch);
        add_instruction(_instruction);
    }
    
    // If
    
    static begin_if = function(_condition) {
        store_builder_value("condition", _condition);
        begin_branch("if_then");
    }
    
    static or_else = function() {
        end_branch();
        begin_branch("if_else");
    }
    
    static end_if = function() {
        end_branch();
        
        var _condition = take_builder_value("condition");
        var _then = take_branch("if_then").build();
        var _else = take_branch("if_else");
        if (!is_undefined(_else))
            _else = _else.build();
        
        var _instruction = new LongcallIfInstruction(_condition, _then, _else);
        add_instruction(_instruction);
    }
    
    // While
    
    static begin_while = function(_condition) {
        store_builder_value("condition", _condition);
        begin_branch("body");
    }
    
    static end_while = function() {
        end_branch();
        var _condition = take_builder_value("condition");
        var _body = take_branch("body").build();
        var _instruction = new LongcallWhileInstruction(_condition, _body);
        add_instruction(_instruction);
    }
    
    // -------
    // Prompts
    // -------
    
    static prompt_with = function(_object, _params = undefined) {
        var _instruction = new LongcallObjectPrompt(_object, _params);
        add_instruction(_instruction);
    }
}
