import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class EmailInput extends FormzInput<String, EmailInputError> {
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Call super.pure to represent an unmodified form input.
  const EmailInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const EmailInput.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (displayError == EmailInputError.empty) {
      return 'Email is a required field';
    }
    if (displayError == EmailInputError.format) {
      return 'Invalid email address';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!emailRegExp.hasMatch(value)) return EmailInputError.format;

    return null;
  }
}

//  {
              // if (value == null || value.isEmpty) {
                // return 'Please enter an email address';
              // }
              // if (value.trim().isEmpty) return 'Email is a required field';
              // final emailRegExp = RegExp(
                // r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              // );
              // if (!emailRegExp.hasMatch(value)) {
                // return 'Invalid email address';
              // }
              // return null;
            // },