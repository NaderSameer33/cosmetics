import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/ui/app_button.dart';
import '../../core/ui/app_image.dart';
import '../../core/ui/app_input.dart';
import 'widgets/sucees_dialog.dart';
import 'package:flutter/material.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key, this.countryCode, this.phonenumber});
  final String? countryCode, phonenumber;

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DataState? state;

  Future<void> sendData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.sendData(
      endPoint: 'Auth/reset-password',
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phonenumber,
        "newPassword": passwordController,
        "confirmPassword": confirmPasswordController,
      },
    );
    if (response.issucces) {
      state = DataState.success;

      showMsg(response.data!['message']);
    } else {
      state = DataState.falied;

      showMsg(response.expetion ?? 'فيه غلك ', isError: true);
    }
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
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage(
                  image: 'splash_logo_two.png',
                  height: 50.h,
                ),
                SizedBox(height: 40.h),
                Text(
                  textAlign: TextAlign.center,
                  'create password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 40.h),
                Text(
                  textAlign: TextAlign.center,
                  'The password should have at least \n 6 characters.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff8E8EA9),
                  ),
                ),
                SizedBox(height: 40.h),
                AppInput(
                  controller: passwordController,
                  isSuffix: true,
                  hintText: 'new password',
                  label: 'new password',
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppInput(
                  controller: confirmPasswordController,
                  isSuffix: true,
                  hintText: 'confirm password',
                  label: 'confirm password',
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppButton(
                  isLoading: state == DataState.loading,
                  title: 'Confirm',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await sendData();
                      if (state == DataState.success) {
                        showDialog(
                          context: context,
                          builder: (context) => const SucessDialog(),
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
