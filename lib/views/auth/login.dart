import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_image.dart';
import 'reset_password.dart';
import 'widgets/custom_auth_phone_fild.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_button.dart';
import 'widgets/custom_dont_have_account.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const AppImage(
                  image: 'login_logo.png',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Login Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Please enter the details below to continue',
                  style: TextStyle(
                    color: const Color(0xff434C6D).withValues(alpha: .8),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 25),
                const CustomPhoneAuthFild(),
                const SizedBox(height: 10),
                const AppInput(
                  hintText: ' Your Password',
                  labelText: ' Your Password',
                ),

                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => goTo(const ResetPasswordView()),
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

                const CustomDontHaveAccout(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
