var _instructions = [
    new LogInstruction("Hello"),
    new DialoguePrompt("Press Space or Enter to continue"),
    new TypePrompt(),
    new LogReceivedInstruction(),
    new DialoguePrompt("This is all for now!"),
    new LogInstruction("Goodbye"),
];

for (var i = 1, _count = array_length(_instructions); i < _count; i++) {
    _instructions[i - 1].next = _instructions[i];
}

var _program = new LongcallProgram(_instructions[0]);
call = new Longcall(_program);

call.run();
