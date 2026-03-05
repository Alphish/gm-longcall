function LongcallLoopScope(_branch, _environment, _parent, _instruction) : LongcallScope(_branch, _environment, _parent, _instruction) constructor {
    add_handler(LongcallBreakLoopHandler);
    add_handler(LongcallContinueLoopHandler);
    
    is_broken = false;
}
