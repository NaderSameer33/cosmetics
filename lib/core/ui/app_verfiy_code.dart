import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerfiyCode extends StatelessWidget {
  const AppVerfiyCode({super.key, this.onCompleted});
  final void Function(String)? onCompleted ; 

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      onCompleted: onCompleted ,
      cursorHeight: 15.5.h,
      hintCharacter: '_',
      autoFocus: true,
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: (context, index) =>  SizedBox(
        width: 12.w
      ),
      animationDuration: const Duration(milliseconds: 350),
      animationType: AnimationType.scale,
      keyboardType: TextInputType.number,
      appContext: context,
      length: 4,
      textStyle: const TextStyle(color: Colors.black),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        fieldHeight: 45.h,
        fieldWidth: 45.w,
        activeColor: const Color(0xffD75D72),
        selectedColor: const Color(0xffD75D72),
        inactiveColor: const Color(0xff898992).withValues(alpha: .36),
        activeFillColor: const Color(0xffD9D9D9),
        inactiveFillColor: const Color(0xffD9D9D9),
        selectedFillColor: const Color(0xffD9D9D9),
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
