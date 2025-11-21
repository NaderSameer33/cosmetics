import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';
import 'login.dart';
import 'otp.dart';
import '../../core/ui/app_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppImage(
                height: 100,
                image: 'splash_logo_two.png',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Create account',
                style: TextStyle(
                  fontSize: 24,

                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 71,
              ),
              const AppInput(
                hintText: 'your Name',
                label: ' your Name',
              ),
              const SizedBox(
                height: 10,
              ),
              const AppInput(
                withCountryCode: true,
                hintText: 'phone Number',
                label: 'phone Number',
              ),
              const SizedBox(
                height: 10,
              ),
              const AppInput(
                hintText: 'your password',
                label: 'your password',
                isSuffix: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppInput(
                hintText: 'Confirm password',
                label: 'Confirm password',
                isSuffix: true,
              ),
              const SizedBox(
                height: 80,
              ),
              AppButton(
                title: 'Create Account',
                onPressed: () => goTo(
                  const OtpView(
                    isComeSignUp: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppLoginOrSignup(),
    );
  }
}
