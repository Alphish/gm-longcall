var _instructions = [
    new LogInstruction("Hello"),
    
    new LongcallDeclareInstruction("test", 123),
    new PrintValueInstruction("test"),
    new LongcallSetInstruction("TEST", 456),
    new PrintValueInstruction("TesT"),
    
    new DialoguePrompt("Press Space or Enter to continue"),
    new LongcallEnterScopeInstruction(),
    new LongcallDeclareInstruction("inner", "lorem"),
    new PrintValueInstruction("inner"),
    new LongcallSetInstruction("inner", "ipsum"),
    new PrintValueInstruction("inner"),
    new LongcallDeclareInstruction("TEST", 789),
    new PrintValueInstruction("test"),
    new LongcallLeaveScopeInstruction(),
    new PrintValueInstruction("test"),
    
    new TypePrompt(),
    new LogReceivedInstruction(),

    new LongcallDeclareInstruction("awsum", [2, 2, 2, LongcallOperator.multiply, LongcallOperator.add]),
    new PrintValueInstruction("awsum"),
    new DialoguePrompt("This is all for now!"),
    
    new LongcallDeclareInstruction("xtime", ["Currently it's ", "@time", LongcallOperator.add]),
    new PrintValueInstruction("xtime"),
    new LogInstruction("Goodbye"),
];

for (var i = 1, _count = array_length(_instructions); i < _count; i++) {
    _instructions[i - 1].next = _instructions[i];
}

var _program = new LongcallProgram(_instructions[0]);
var _environment = new DemoEnvironment();
_environment.case_sensitive = false;
_environment.can_redeclare = true;
call = new Longcall(_program, _environment);

call.run();
