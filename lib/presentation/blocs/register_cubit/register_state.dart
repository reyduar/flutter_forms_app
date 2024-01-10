part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validation, posting }

class RegisterFormState extends Equatable {
  final String username;
  final String password;
  final String email;
  final FormStatus formStatus;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = '',
      this.password = '',
      this.email = ''});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object?> get props => [formStatus, username, email, password];
}
