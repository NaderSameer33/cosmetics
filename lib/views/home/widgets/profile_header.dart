import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [
                Color(0x43434C6D),
                Color(0xffECA4C5),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: -50,
          child: CircleAvatar(
            radius: 50.r,
            child: const AppImage(
              image: 'prof.png',
            ),
          ),
        ),
      ],
    );
  }
}
