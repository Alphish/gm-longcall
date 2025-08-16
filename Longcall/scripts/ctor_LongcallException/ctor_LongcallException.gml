/// @desc An exception to be thrown due to invalid Longcall usage.
/// @arg {String} code              The code of the exception to differentiate between different exception causes.
/// @arg {String} description       A detailed description explaining the exception.
function LongcallException(_code, _description) constructor {
    /// @desc The code of the exception to differentiate between different exception causes.
    /// @type {String}
    code = _code;
    
    /// @desc A detailed description explaining the exception.
    /// @type {String}
    description = _description;
    
    toString = function() {
        return $"Longcall.{code}: {description}";
    }
}

LongcallException.not_implemented = function(_context, _method) {
    return new LongcallException(
        nameof(not_implemented),
        $"{instanceof(_context)}.{_method} was not implemented."
        );
}

LongcallException.undeclared_value = function(_name) {
    return new LongcallException(
        nameof(undeclared_value),
        $"Cannot retrieve or set an undeclared value '{_name}'."
        );
}

LongcallException.illegal_declaration_reserved = function(_name) {
    return new LongcallException(
        nameof(illegal_declaration_reserved),
        $"The value of '{_name}' is reserved by the longcall environment and cannot be declared."
        );
}

LongcallException.illegal_declaration_forbidden = function(_name) {
    return new LongcallException(
        nameof(illegal_declaration_forbidden),
        $"The value of '{_name}' is already declared in the current or outer scope and the longcall environment forbids redeclaring variables."
        );
}

LongcallException.illegal_declaration_duplicate = function(_name) {
    return new LongcallException(
        nameof(illegal_declaration_duplicate),
        $"Cannot declare a value of '{_name}' when such a value is already declared in the current scope."
        );
}

LongcallException.unresolved_evaluation = function(_count) {
    return new LongcallException(
        nameof(unresolved_evaluation),
        $"The expression evaluation couldn't be resolved to a single result. {_count} values found at the end."
        );
}

LongcallException.unknown_truthiness = function(_value) {
    return new LongcallException(
        nameof(unknown_truthiness),
        $"Unable to determine a truthiness or falsiness of a non-boolean {typeof(_value)}: {_value}"
        );
}

LongcallException.illegal_break = function(_value) {
    return new LongcallException(
        nameof(illegal_break),
        $"'break' and 'continue' instructions can only be used within a breakable scope."
        );
}
