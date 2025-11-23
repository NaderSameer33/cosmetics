import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class CheckOutPayment extends StatelessWidget {
  const CheckOutPayment({
    super.key,
    this.isCheckd = false,
  });
  final bool isCheckd;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.r),
      height: 57,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: const Color(0xff73B9BB),
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          AppImage(
            image: isCheckd ? 'paymnet.svg' : 'discount.svg',
            color: null,
          ),
           SizedBox(
            width: 10.w,
          ),
          Text(
            isCheckd ? '**** **** **** 0256 ' : 'Add vaucher',
          ),
          const Spacer(),
          if (isCheckd)
            Transform.rotate(
              angle: -1.5708,

              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffDA498C),
                ),
              ),
            )
          else
            Container(
              alignment: Alignment.center,
              height: 30.h,
              width: 77.w,
              decoration: BoxDecoration(
                color: const Color(0xffDA498C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
