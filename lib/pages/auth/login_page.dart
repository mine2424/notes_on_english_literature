import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/auth/widget/auth_form.dart';
import 'package:sign_button/sign_button.dart';

class LoginPage extends HookWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNotifier = useProvider(userNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(
            bottom: 32,
            top: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 32),
                  child: Text(
                    'choose your login method',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SignInButton(
                  buttonType: ButtonType.apple,
                  onPressed: () {
                    userNotifier.signInWithApple();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () {},
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16).copyWith(bottom: 8),
                  child: Text(
                    'or',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              AuthForm(
                emailController: emailController,
                passwordController: passwordController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
