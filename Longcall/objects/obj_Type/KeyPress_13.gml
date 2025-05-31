if (keyboard_string == "")
    return;

var _result = keyboard_string;
keyboard_string = "";
instance_destroy();
ctrl_Demo.call.resume(_result);
