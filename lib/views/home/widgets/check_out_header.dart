import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutHeader extends StatelessWidget {
  const CheckOutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.r),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.withValues(alpha: .4),
            radius: 18.r,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          const Spacer(),

           Text(
            'Checkout',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
