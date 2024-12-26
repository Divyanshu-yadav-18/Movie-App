import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/configs/theme/app_color.dart';
import 'package:movie_app/presentation/auth/pages/signup_page.dart';
import 'package:reactive_button/reactive_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 100,
          right: 16,
          left: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 10),
            _pwField(),
            const SizedBox(height: 60),
            _signInButton(),
            const SizedBox(height: 20),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _pwField() {
    return const TextField(
      decoration: InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signInButton() {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColor.primary,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Don't you have an account?"),
          TextSpan(
            text: ' SignUp ',
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SignUpPage(),
                );
              },
          ),
        ],
      ),
    );
  }
}
