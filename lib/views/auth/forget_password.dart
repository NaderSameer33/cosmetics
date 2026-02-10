import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/input_validator.dart';
import 'package:cosmentics/views/auth/otp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final phoneController = TextEditingController();
  String? countryCode;
  final formKey = GlobalKey<FormState>();
  DataState? state;
  Future<void> sendData() async {
    state == DataState.loading;
    setState(() {});

    final response = await DioHelper.sendData(
      endPoint: 'Auth/forgot-password',
      data: {
        "countryCode": countryCode,
        "phoneNumber": phoneController.text.trim(),
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
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage(
                  image: 'login_logo.png',
                  height: 227.h,
                  width: 284.w,
                ),
                SizedBox(height: 24.h),
                Text(
                  textAlign: TextAlign.center,
                  'Forget Passwrod',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Please enter your phone number below \n to recovery your password.',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  onCountryCodeChanged: (value) {
                    countryCode = value;
                  },
                  validator: InputValidator.phoneValidator,

                  controller: phoneController,
                  withCountryCode: true,
                  hintText: 'phone Number',
                  label: 'phone Number',
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppButton(
                  isLoading: state == DataState.loading,

                  title: 'Next',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                     await  sendData();
                      if (state == DataState.success) {
                        goTo(
                          canPop: true , 
                          OtpView(
                            
                          
                            phoneNumber: phoneController.text,
                            codeCountry: countryCode,
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
    );
  }
}
