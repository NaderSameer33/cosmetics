import 'package:cosmentics/views/home/view.dart';

import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../home/pages/home/view.dart';
import '../../core/logic/input_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_input.dart';
import '../../core/ui/app_login_or_signup.dart';
import 'forget_password.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String? countryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  DataState? state;

  Future<void> sendData() async {
    state = DataState.loading;
    setState(() {});
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();
    final code = countryCode;
    final response = await DioHelper.sendData(
      data: {
        "countryCode": code,
        "phoneNumber": phone,
        "password": password,
      },
      endPoint: 'Auth/login',
    );

    if (response.issucces) {
      state = DataState.success;
      showMsg('login sucessfly my brother ');
      goTo(const HomeView(), canPop: false);

      final model = UserData.fromJson(response.data!);
      await CacheHelper.saveUserData(model);
    } else {
      state = DataState.falied;
      showMsg(response.expetion!, isError: true);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState!.validate();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
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
                AppInput(
                  validator: InputValidator.phoneValidator,
                  controller: phoneController,
                  onCountryCodeChanged: (value) {
                    countryCode = value;
                  },
                  withCountryCode: true,
                  label: 'phone Number',
                  hintText: 'phone Number',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  validator: InputValidator.passwordValidator,
                  controller: passwordController,
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
                  isLoading: state == DataState.loading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sendData();
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

class UserData {
  late final String token;
  late final UserModel userModel;
  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    userModel = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String userName,
      email,
      phoneNumber,
      countryCode,
      role,
      profileImage;
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userName = json['username'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    countryCode = json['countryCode'] ?? '';
    role = json['role'] ?? '';
    profileImage = json['ProfilePhotoUrl'] ?? '';
  }
}
