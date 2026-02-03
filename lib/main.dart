import 'package:cosmentics/core/logic/cache_helper.dart';
import 'package:cosmentics/views/auth/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/logic/helper_methods.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const Cosmetics());
}

class Cosmetics extends StatelessWidget {
  const Cosmetics({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
      child: MaterialApp(
        navigatorKey: navKey,

        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Color(0xff434C6D),
            ),
          ),

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffD75D72),
          ),
          scaffoldBackgroundColor: const Color(
            0xffD9D9D9,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xffD75D72),
            ),
          ),

          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 0,
            ),
            suffixIconColor: Color(0xff8E8EA9),
            labelStyle: TextStyle(
              color: Color(0xff8E8EA9),
            ),
            hintStyle: TextStyle(
              color: Color(0xff8E8EA9),
              fontSize: 12,
            ),
            floatingLabelStyle: TextStyle(
              fontSize: 14,
            ),

            errorStyle: TextStyle(height: .1, fontSize: 12),
          ),

          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xffD75D72),
              fixedSize: const Size.fromHeight(65),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
      ),
    );
  }
}
