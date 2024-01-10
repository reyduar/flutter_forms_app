import 'package:formz/formz.dart';

// Define input validation errors
enum UsenameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsenameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsenameInputError.empty) {
      return 'Username is a required field';
    }
    if (displayError == UsenameInputError.length) {
      return 'Require greater than 6 characters';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsenameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsenameInputError.empty;
    if (value.length < 6) return UsenameInputError.length;

    return null;
  }
}
