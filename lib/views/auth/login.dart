import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  String ? countryCode ;
  final phoneController = TextEditingController() ; 
  final passwordController = TextEditingController() ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding:  EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 SizedBox(height: 30.h),
                 AppImage(
                  image: 'login_logo.png',
                  height: 227.h,
                  width: 284.w,
                ),
                 SizedBox(height: 24.h),
                 Text(
                  textAlign: TextAlign.center,
                  'Login Now',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 20.h),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter the details below to continue',
                  style: TextStyle(
                    color: const Color(0xff434C6D).withValues(alpha: .8),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                 SizedBox(height: 25.h),
                const AppInput(
                  
                  withCountryCode: true,
                  label: 'phone Number',
                  hintText: 'phone Number',
                ),
                 SizedBox(
                  height: 10.h,
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
                 SizedBox(height: 43.h),
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      goTo(const HomeView());
                    }
                  },
                  title: 'Login ',
                ),
                 SizedBox(height: 20.h),
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
