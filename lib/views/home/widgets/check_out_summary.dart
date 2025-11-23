import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutSummary extends StatelessWidget {
  const CheckOutSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- REVIEW PAYMENT',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'PAYMENT SUMMARY',
          style: TextStyle(
            fontSize: 20.sp,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
            ),
            Text(
              '16.100 EGP',
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SHIPPING FEES',
            ),
            Text(
              'TO BE CALCULATED',
            ),
          ],
        ),
      ],
    );
  }
}
