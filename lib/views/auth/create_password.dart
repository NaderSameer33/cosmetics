import 'package:flutter/material.dart';

import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import 'login.dart';
import 'otp.dart';
import 'widgets/custom_auth_intinal.dart';
import 'widgets/custom_auth_logo.dart';
import '../../core/ui/app_input.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  bool isSecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const CustomAuthLogo(title: 'Create Password'),
              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                'The password should have at least \n 6 characters.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff8E8EA9),
                ),
              ),
              const SizedBox(height: 40),
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 100),
              AppButton(
                title: 'Confirm',
                onPressed: () {
                  buildDialog(
                    context,
                    title: 'Password Created!',
                    subTitle:
                        'Congratulations! Your password \n has been successfully created',
                  );
                  goTo(const LoginView(), delayedSeconds: 3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
