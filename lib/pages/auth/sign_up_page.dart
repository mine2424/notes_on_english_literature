import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/auth/widget/auth_form.dart';
import 'package:notes_on_english_literature/pages/initial_page.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';
import 'package:sign_button/sign_button.dart';

class SignUpPage extends HookWidget {
  SignUpPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userNotifier = useProvider(userNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16).copyWith(
                    bottom: 32,
                    top: 32,
                  ),
                  child: Text(
                    'choose sign up method',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SignInButton(
                  buttonType: ButtonType.apple,
                  onPressed: () async {
                    final isSignUp = await userNotifier.signInWithApple();

                    if (isSignUp) {
                      // TODO: チュートリアルへ遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const InitialPage(),
                        ),
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () async {
                    // google sign in
                    final isSignUp = await userNotifier.signInWithGoogle();

                    if (isSignUp) {
                      // TODO: チュートリアルへ遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const InitialPage(),
                        ),
                      );
                    }
                  },
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
              ),
              RadiusButton(
                text: 'text',
                textStyle: TextStyle(color: Colors.amber),
                onTapLogic: () async {
                  final signUpStatus =
                      await userNotifier.createUserWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );

                  if (signUpStatus == AuthStatus.email) {
                    // TODO: チュートリアルへ遷移
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const InitialPage(),
                      ),
                    );
                  }
                },
              ).show(context),
            ],
          ),
        ),
      ),
    );
  }
}
