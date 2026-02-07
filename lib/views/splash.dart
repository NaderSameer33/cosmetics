import 'package:animate_do/animate_do.dart';
import 'package:cosmentics/views/home/view.dart';
import '../core/logic/cache_helper.dart';
import 'auth/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/logic/helper_methods.dart';
import '../core/ui/app_image.dart';
import 'on_borading.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isFirstTime = CacheHelper.getIsFirstTime();
    bool isAuth = CacheHelper.isAuth();

    goTo(
      isFirstTime
          ? const OnBoradingView()
          : isAuth
          ? const HomeView()
          : const LoginView(),
      canPop: false,
      delayedSeconds: 5,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dance(
        duration: const Duration(seconds: 5),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppImage(
                image: 'splash_logo_two.png',
              ),

              SizedBox(height: 20.h),
              const AppImage(
                image: 'splash_logo_one.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
