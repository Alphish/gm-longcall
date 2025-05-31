function LongcallProgram(_entry, _exit = undefined) constructor {
    entry_instruction = _entry;
    exit_instruction = new LongcallFinish(_exit) ?? new LongcallFinish();
}
