import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResentOtp extends StatefulWidget {
  const AppResentOtp({
    super.key,
    required this.countryCode,
    required this.phoneNumber,
  });
  final String countryCode, phoneNumber;

  @override
  State<AppResentOtp> createState() => _AppResentOtpState();
}

class _AppResentOtpState extends State<AppResentOtp> {
  Future<void> sendData() async {
    final response = await DioHelper.sendData(
      endPoint: 'Auth/resend-otp',
      data: {
        "countryCode": widget.countryCode,
        "phoneNumber": widget.phoneNumber,
      },
    );
    if (response.issucces) {
      showMsg(response.data!['message']);
    } else {
      showMsg(response.expetion!);
    }
  }

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
                  sendData();
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
