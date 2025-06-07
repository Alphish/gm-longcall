var _inner = new LongcallBranch([
    new LongcallDeclareInstruction("inner", "lorem"),
    new PrintValueInstruction("inner"),
    new LongcallSetInstruction("inner", "ipsum"),
    new PrintValueInstruction("inner"),
    new LongcallDeclareInstruction("TEST", 789),
    new PrintValueInstruction("test"),
]);

var _outer = new LongcallBranch([
    new LogInstruction("Hello"),
    
    new LongcallDeclareInstruction("test", 123),
    new PrintValueInstruction("test"),
    new LongcallSetInstruction("TEST", 456),
    new PrintValueInstruction("TesT"),
    
    new DialoguePrompt("Press Space or Enter to continue"),
    new LongcallEnterScopeInstruction(_inner),
    new PrintValueInstruction("test"),
    
    new TypePrompt(),
    new LogReceivedInstruction(),

    new LongcallDeclareInstruction("awsum", [2, 2, 2, LongcallOperator.multiply, LongcallOperator.add]),
    new PrintValueInstruction("awsum"),
    new DialoguePrompt("This is all for now!"),
    
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
