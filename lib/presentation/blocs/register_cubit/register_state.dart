part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final UsernameInput username;
  final PasswordInput password;
  final EmailInput email;
  final bool isValid;
  final FormStatus formStatus;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = const UsernameInput.pure(),
      this.password = const PasswordInput.pure(),
      this.email = const EmailInput.pure(),
      this.isValid = false});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          UsernameInput? username,
          EmailInput? email,
          PasswordInput? password,
          bool? isValid}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          email: email ?? this.email,
          isValid: isValid ?? this.isValid,
          password: password ?? this.password);

  @override
  List<Object?> get props => [formStatus, isValid, username, email, password];
}
