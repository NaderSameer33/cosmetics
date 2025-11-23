import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_view.dart';
import '../widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Nader Sameer Gaber',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ProfileView(),
          ],
        ),
      ),
    );
  }
}
