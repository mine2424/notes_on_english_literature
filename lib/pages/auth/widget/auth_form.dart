import 'package:flutter/material.dart';
import 'package:notes_on_english_literature/widgets/widgets.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AccentForm(
            controller: emailController,
            label: 'email',
          ),
          AccentForm(
            controller: passwordController,
            label: 'password',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
