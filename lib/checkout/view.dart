import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:cosmentics/core/ui/app_back_button.dart';
import 'package:cosmentics/core/ui/app_image.dart';
import 'package:cosmentics/views/google_maps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../core/ui/app_button.dart';
import 'package:flutter/material.dart';
part 'widgets/summary.dart';
part 'widgets/tile.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: AppBackButton(
          startSpacing: 16.r,
        ),
        title: Text(
          'Check out',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff434C6D),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    const SizedBox(height: 20),
                    _Tile(
                      title: 'Home',
                      subTitle: 'Home Mansourea , 14 Porsaid S',
                      traling: 'check_out_arrow.svg',
                      padding: 15.r,
                      leading: 'map.png',
                      onTap: () {
                        goTo(const GoogleMapsView());
                      },
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    const _Tile(
                      title: '**************256',
                      traling: 'check_out_arrow.svg',
                      leading: 'misa.svg',
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    const _Tile(
                      title: 'Add vaucher',
                      leading: 'voucher.svg',
                    ),
                    SizedBox(height: 30.h),

                    Text(
                      '_ \t' * 100,
                      maxLines: 1,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '- REVIEW PAYMENT',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      'PAYMENT SUMMARY',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 20.h),
                    const _Summary(
                      title: 'Subtotal',
                      subTitle: '16.100 EGP',
                    ),
                    const _Summary(
                      title: 'SHIPPING FEES',
                      subTitle: 'TO BE CALCULATED',
                    ),
                    SizedBox(height: 20.h),

                    const Divider(
                      thickness: 1,
                      color: Color(0xff73B9BB),
                    ),

                    SizedBox(height: 10.h),
                    const _Summary(
                      title: 'TOTAL + VAT',
                      subTitle: '16.100 EGP',
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      title: 'Order',
                      onPressed: () {},
                      icon: 'order.svg',
                    ),
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
