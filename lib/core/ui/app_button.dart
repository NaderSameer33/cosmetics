import 'app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });
  final String title;
  final VoidCallback onPressed;
  final String? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: isLoading
          ? SizedBox(
              height: 16.h,
              width: 16.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: .5,
              ),
            )
          : icon != null
          ? AppImage(image: icon!)
          : null,
      onPressed: isLoading ? null : onPressed,
      label: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
