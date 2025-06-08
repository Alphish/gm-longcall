proceed = function() {
    var _call = call;
    instance_destroy();
    _call.resume();
}

proceed_with = function(_value) {
    var _call = call;
    instance_destroy();
    _call.resume(_value);
}
