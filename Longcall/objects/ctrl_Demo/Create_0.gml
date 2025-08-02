var _builder = new DemoProgramBuilder();
with (_builder) {
    log("Hello");
    
    prompt_with(obj_Dialogue, { text: "Press Space or Enter to continue" });
    declare_value("test", 123);
    print_value("test");
    set_value("TEST", 456);
    print_value("TesT");
    
    declare_value("condition1", true);
    begin_if("@condition1") {
        log("Then it happened");
    } end_if();
    
    declare_value("condition2", false);
    begin_if("@condition2") {
        log("Then another thing happened");
    } or_else() {
        log("Then something else happened");
        log("Again and again");
    } end_if();
    
    declare_value("countdown", 10);
    
    begin_while(["@countdown", 0, LongcallOperator.greater_or_equal]) {
        begin_if(["@countdown", 7, LongcallOperator.equal]) {
            log("???");
            set_value("countdown", ["@countdown", 1, LongcallOperator.subtract]);
            then_continue();
        } end_if();
        
        print_value("countdown");
        set_value("countdown", ["@countdown", 1, LongcallOperator.subtract]);
        
        begin_if(["@countdown", 3, LongcallOperator.equal]) {
            log("!!!");
            then_break();
        } end_if();
    } end_while();
    
    begin_scope() {
        declare_value("inner", "lorem");
        print_value("inner");
        set_value("inner", "ipsum");
        print_value("inner");
        declare_value("TEST", 789);
        print_value("test");
    } end_scope();
    print_value("test");
    
    prompt_with(obj_Type);
    log_received();

    declare_value("awsum", [2, 2, 2, LongcallOperator.multiply, LongcallOperator.add]);
    print_value("awsum");
    
    declare_value("is_unpaid", true);
    begin_if("@is_unpaid") {
        jump_to("unpaid");
    } end_if();
    
    prompt_with(obj_Dialogue, { text: "This is all for now!" });
    
    declare_value("xtime", ["Currently it's ", "@time", LongcallOperator.add]);
    print_value("xtime");
    log("Goodbye");
    
    begin_subroutine("unpaid");
    
    prompt_with(obj_Dialogue, { text: "This functionality is unavailable for unpaid users." });
    log("Goodbye anyway");
}

var _program = _builder.build();
var _environment = new DemoEnvironment();
_environment.case_sensitive = false;
_environment.can_redeclare = true;
call = new Longcall(_program, _environment);

call.run();
