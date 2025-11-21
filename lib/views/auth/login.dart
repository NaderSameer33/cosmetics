import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';
import 'forget_password.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_button.dart';
import '../home/view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const AppImage(
                  image: 'login_logo.png',
                  height: 227,
                  width: 284,
                ),
                const SizedBox(height: 24),
                const Text(
                  textAlign: TextAlign.center,
                  'Login Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter the details below to continue',
                  style: TextStyle(
                    color: const Color(0xff434C6D).withValues(alpha: .8),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                const AppInput(
                  withCountryCode: true,
                  label: 'phone Number',
                  hintText: 'phone Number',
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppInput(
                  hintText: 'your Password',
                  isSuffix: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => goTo(const ForgetPasswordView()),
                    child: const Text('Forget Password?'),
                  ),
                ),
                const SizedBox(height: 43),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      goTo(const HomeView());
                    }
                  },
                  title: 'Login ',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppLoginOrSignup(
        isLogin: true,
      ),
    );
  }
}
