import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResentOtp extends StatefulWidget {
  const AppResentOtp({
    super.key,
  });

  @override
  State<AppResentOtp> createState() => _AppResentOtpState();
}

class _AppResentOtpState extends State<AppResentOtp> {
  bool isSend = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Didn’t receive a code?',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: isSend
              ? null
              : () {
                  isSend = true;
                  setState(() {});
                },
          child: const Text(
            'Resend',
          ),
        ),
        const Spacer(),
        if (isSend)
          CircularCountDownTimer(
            onComplete: () {
              setState(() {
                isSend = false;
              });
            },
            textStyle: const TextStyle(color: Color(0xff8E8EA9)),
            isReverse: true,
            textFormat: CountdownTextFormat.MM_SS,
            width: 50.w,
            height: 50.h,
            duration: 60,
            fillColor: Colors.transparent,
            ringColor: Colors.transparent,
          ),
      ],
    );
  }
}
