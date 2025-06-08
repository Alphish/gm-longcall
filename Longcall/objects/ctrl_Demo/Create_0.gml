var _inner = new LongcallBranch([
    new LongcallDeclareInstruction("inner", "lorem"),
    new PrintValueInstruction("inner"),
    new LongcallSetInstruction("inner", "ipsum"),
    new PrintValueInstruction("inner"),
    new LongcallDeclareInstruction("TEST", 789),
    new PrintValueInstruction("test"),
]);

var _then1 = new LongcallBranch([
    new LogInstruction("Then it happened"),
]);

var _then2 = new LongcallBranch([
    new LogInstruction("Then another thing happened"),
]);

var _else2 = new LongcallBranch([
    new LogInstruction("Then something else happened"),
    new LogInstruction("Again and again"),
]);

var _while_body = new LongcallBranch([
    new PrintValueInstruction("countdown"),
    new LongcallSetInstruction("countdown", ["@countdown", 1, LongcallOperator.subtract]),
]);

var _outer = new LongcallBranch([
    new LogInstruction("Hello"),
    
    new LongcallObjectPrompt(obj_Dialogue, { text: "Press Space or Enter to continue" }),
    new LongcallDeclareInstruction("test", 123),
    new PrintValueInstruction("test"),
    new LongcallSetInstruction("TEST", 456),
    new PrintValueInstruction("TesT"),
    
    new LongcallDeclareInstruction("condition1", true),
    new LongcallIfInstruction("@condition1", _then1),
    new LongcallDeclareInstruction("condition2", false),
    new LongcallIfInstruction("@condition2", _then2, _else2),
    
    new LongcallDeclareInstruction("countdown", 5),
    new LongcallWhileInstruction(["@countdown", 0, LongcallOperator.greater_or_equal], _while_body),
    
    new LongcallEnterScopeInstruction(_inner),
    new PrintValueInstruction("test"),
    
    new LongcallObjectPrompt(obj_Type),
    new LogReceivedInstruction(),

    new LongcallDeclareInstruction("awsum", [2, 2, 2, LongcallOperator.multiply, LongcallOperator.add]),
    new PrintValueInstruction("awsum"),
    new LongcallObjectPrompt(obj_Dialogue, { text: "This is all for now!" }),
    
    new LongcallDeclareInstruction("xtime", ["Currently it's ", "@time", LongcallOperator.add]),
    new PrintValueInstruction("xtime"),
    new LogInstruction("Goodbye"),
]);

var _program = new LongcallProgram(_outer);
var _environment = new DemoEnvironment();
_environment.case_sensitive = false;
_environment.can_redeclare = true;
call = new Longcall(_program, _environment);

call.run();
