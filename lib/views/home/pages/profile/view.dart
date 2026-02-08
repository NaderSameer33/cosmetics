import 'package:cosmentics/core/logic/cache_helper.dart';
import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/views/auth/login.dart';
import 'package:cosmentics/views/home/view.dart';

import '../../../../core/logic/helper_methods.dart';
import '../../../../core/ui/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
part 'widgets/header.dart';
part 'widgets/item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          _Header(),
          _Itme(
            title: 'Edit Info',
          ),
          _Itme(
            title: 'Order History',
          ),
          _Itme(
            title: 'Wallet',
          ),
          _Itme(
            title: 'Settings',
          ),
          _Itme(
            title: 'Voucher',
          ),
          _Itme(
            title: 'LogOut',
            page: LoginView(),
          ),
        ],
      ),
    );
  }
}
