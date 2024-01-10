import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register From'),
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView(),
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 200,
              ),
              _RegisteForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisteForm extends StatelessWidget {
  const _RegisteForm({super.key});
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            label: 'User Name',
            hint: 'Enter an user name',
            icon: Icons.person),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
            label: 'Email',
            hint: 'Enter your email address',
            icon: Icons.email),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
            obscureText: true,
            label: 'Password',
            hint: 'Enter password',
            icon: Icons.password),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create User')),
      ],
    ));
  }
}
