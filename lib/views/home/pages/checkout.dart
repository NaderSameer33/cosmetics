import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/check_out_header.dart';
import '../widgets/check_out_summary.dart';

import '../../../core/ui/app_button.dart';
import '../widgets/checkout_payment.dart';
import '../widgets/check_out_map.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              const CheckOutHeader(),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 41.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),

                  color: const Color(0x4329d3da).withValues(alpha: .1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Delivery to',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    const CheckoutMap(),
                    SizedBox(height: 40.h),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    const CheckOutPayment(
                      isCheckd: true,
                    ),
                    SizedBox(height: 12.h),
                    const CheckOutPayment(),
                    SizedBox(height: 31.h),
                    Text(
                      '_ \t' * 100,
                      maxLines: 1,
                    ),
                    SizedBox(height: 30.h),
                    const CheckOutSummary(),
                    SizedBox(height: 20.h),
                    const Divider(
                      thickness: 1,
                      color: Color(0xff73B9BB),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL + VAT',
                        ),
                        Text(
                          '16.100 EGP',
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    AppButton(title: 'ORDER', onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
