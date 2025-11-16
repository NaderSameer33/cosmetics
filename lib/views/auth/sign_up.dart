import '../../core/ui/app_image.dart';
import 'widgets/custom_auth_logo.dart';
import 'widgets/custom_auth_phone_fild.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isSecure = false;
  bool isConformSecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const CustomAuthLogo(
                title: 'Create account',
              ),
              const SizedBox(height: 50),
              const AppInput(
                hintText: 'Your Name ',
                labelText: 'Your Name',
              ),
              const SizedBox(height: 33),
              const CustomPhoneAuthFild(),
              const SizedBox(height: 16),
              AppInput(
                obscureText: isSecure ? false : true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                  child: AppImage(
                    image: isSecure ? 'visiblily.svg' : 'visibily_off.svg',
                  ),
                ),
                hintText: 'Your Password',
                labelText: 'Your Password',
              ),
              const SizedBox(height: 16),
              AppInput(
                obscureText: isConformSecure ? false : true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    isConformSecure = !isConformSecure;
                    setState(() {});
                  },
                  child: AppImage(
                    image: isConformSecure
                        ? 'visiblily.svg'
                        : 'visibily_off.svg',
                  ),
                ),
                hintText: 'Your Password',
                labelText: 'Your Password',
              ),
              const SizedBox(height: 50),
              AppButton(
                title: 'Next',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
