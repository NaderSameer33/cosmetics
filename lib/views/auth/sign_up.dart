import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/input_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';
import 'otp.dart';
import '../../core/ui/app_button.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final phoneController = TextEditingController();
  final userNameContruller = TextEditingController();
  final emailController = TextEditingController();
  final passwrodControlelr = TextEditingController();
  late String countryCode;

  DataState? state;
  Future<void> sendData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.sendData(
      endPoint: 'Auth/register',
      data: {
        "username": userNameContruller.text.trim(),
        "countryCode": countryCode,
        "phoneNumber": phoneController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwrodControlelr.text.trim(),
      },
    );
    if (response.issucces) {
      state = DataState.success;

      showMsg(response.data!['message']);
    } else {
      state = DataState.falied;

      showMsg(response.expetion!, isError: true);
    }
    setState(() {});
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        onChanged: () {
          formKey.currentState!.validate();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage(
                  height: 100.h,
                  image: 'splash_logo_two.png',
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Create account',
                  style: TextStyle(
                    fontSize: 24.sp,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 71.h,
                ),
                AppInput(
                  validator: InputValidator.userNameValdator,
                  controller: userNameContruller,
                  hintText: 'your Name',
                  label: ' your Name',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  validator: InputValidator.phoneValidator,
                  onCountryCodeChanged: (value) {
                    countryCode = value;
                  },
                  controller: phoneController,

                  withCountryCode: true,
                  hintText: 'phone Number',
                  label: 'phone Number',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  validator: InputValidator.emailValitor,
                  controller: emailController,
                  hintText: 'your Email',
                  label: 'your Email',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  validator: InputValidator.passwordValidator,
                  controller: passwrodControlelr,
                  hintText: 'Your password',
                  label: 'Your password ',
                  isSuffix: true,
                ),
                SizedBox(
                  height: 80.h,
                ),
                AppButton(
                  isLoading: state == DataState.loading,
                  title: 'Create Account',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await sendData();
                      if (state == DataState.success) {
                        goTo(
                          OtpView(
                            isComeSignUp: true,
                            codeCountry: countryCode,
                            phoneNumber: phoneController.text.trim(),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppLoginOrSignup(),
    );
  }
}
