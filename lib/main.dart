import 'package:cosmentics/views/home/view.dart';
import 'core/logic/helper_methods.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cosmetics());
}

class Cosmetics extends StatelessWidget {
  const Cosmetics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,

      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xff434C6D),
          ),
        ),

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffD75D72)),
        scaffoldBackgroundColor: const Color(
          0xffD9D9D9,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xffD75D72),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          suffixIconColor: const Color(0xff8E8EA9),
          labelStyle: const TextStyle(
            color: Color(0xff8E8EA9),
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          errorStyle: const TextStyle(height: .1, fontSize: 12),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xffD75D72),
            fixedSize: const Size(286, 65),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(
      color: Color(0xff5a6690),
    ),
  );
}
