function LongcallBranchSentinel() constructor {
    static accept_instruction = function(_instruction) {
        throw LongcallException.building_no_target_routine();
    }
    
    static store_value = function(_name, _value) {
        throw LongcallException.building_no_target_routine();
    }
    
    static take_value = function(_name) {
        throw LongcallException.building_no_target_routine();
    }
    
    static get_parent = function() {
        throw LongcallException.building_no_target_routine();
    }
    
    static begin_branch = function(_name) {
        throw LongcallException.building_no_target_routine();
    }
    
    static take_branch = function(_name) {
        throw LongcallException.building_no_target_routine();
    }
    
    static build = function() {
        throw LongcallException.building_no_target_routine();
    }
}

LongcallBranchSentinel.instance = new LongcallBranchSentinel();
