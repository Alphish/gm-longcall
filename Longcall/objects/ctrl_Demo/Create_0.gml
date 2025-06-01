var _instructions = [
    new LogInstruction("Hello"),
    
    new DeclareValueInstruction("test", 123),
    new PrintValueInstruction("test"),
    new SetValueInstruction("TEST", 456),
    new PrintValueInstruction("TesT"),
    
    new DialoguePrompt("Press Space or Enter to continue"),
    new LongcallEnterScopeInstruction(),
    new DeclareValueInstruction("inner", "lorem"),
    new PrintValueInstruction("inner"),
    new SetValueInstruction("inner", "ipsum"),
    new PrintValueInstruction("inner"),
    new DeclareValueInstruction("TEST", 789),
    new PrintValueInstruction("test"),
    new LongcallLeaveScopeInstruction(),
    new PrintValueInstruction("test"),
    
    new TypePrompt(),
    new LogReceivedInstruction(),
    new DialoguePrompt("This is all for now!"),
    
    new PrintValueInstruction("time"),
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
