import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import 'otp.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
                image: 'login_logo.png',
                height: 227,
                width: 284,
              ),
              const SizedBox(height: 24),
              const Text(
                textAlign: TextAlign.center,
                'Forget Passwrod',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Please enter your phone number below \n to recovery your password.',
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
                height: 40,
              ),
              AppButton(
                title: 'Next',
                onPressed: () => goTo(const OtpView()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
