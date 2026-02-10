import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/logic/helper_methods.dart';
import '../login.dart';
import '../../home/view.dart';

import '../../../core/ui/app_button.dart';
import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class SucessDialog extends StatelessWidget {
  const SucessDialog({super.key, this.isComeSignUp = false});

  final bool isComeSignUp;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(16.r),
      backgroundColor: const Color(0xffD9D9D9),
      children: [
        AppImage(
          image: 'success.json',
          height: 70.h,
          width: 70.w,
        ),
        SizedBox(height: 20.h),
        Text(
          textAlign: TextAlign.center,
          isComeSignUp ? 'Account Activated!' : 'Password Created!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          textAlign: TextAlign.center,
          isComeSignUp
              ? 'Congratulations! Your account \n  has been successfully activated'
              : 'Congratulations! Your password\n  has been successfully created',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.h,
            color: const Color(0xff434C6D).withValues(alpha: .8),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        AppButton(
          title: 'Return to login',
          onPressed: () => goTo(
            const LoginView(),
            canPop: false,
          ),
        ),
      ],
    );
  }
}
