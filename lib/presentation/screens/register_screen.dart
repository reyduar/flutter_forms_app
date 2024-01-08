import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register From'),
      ),
      body: const _RegisterView(),
    );
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

class _RegisteForm extends StatefulWidget {
  const _RegisteForm({super.key});

  @override
  State<_RegisteForm> createState() => _RegisteFormState();
}

class _RegisteFormState extends State<_RegisteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String username = '';
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                onChanged: (value) => username = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an user name';
                  }
                  if (value.trim().isEmpty) {
                    return 'User name is a required field';
                  }
                  if (value.length < 6) {
                    return 'Require greater than 6 characters';
                  }
                  return null;
                },
                label: 'User Name',
                hint: 'Enter an user name',
                icon: Icons.person),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  }
                  if (value.trim().isEmpty) return 'Email is a required field';
                  final emailRegExp = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Invalid email address';
                  }
                  return null;
                },
                label: 'Email',
                hint: 'Enter your email address',
                icon: Icons.email),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.trim().isEmpty) {
                    return 'Password is a required field';
                  }
                  if (value.length < 6) {
                    return 'Require greater than 6 characters';
                  }
                  return null;
                },
                obscureText: true,
                label: 'Password',
                hint: 'Enter password',
                icon: Icons.password),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid) return;
                  print('Username: $username');
                  print('Email: $email');
                  print('Password: $password');
                },
                icon: const Icon(Icons.save),
                label: const Text('Create User')),
          ],
        ));
  }
}
