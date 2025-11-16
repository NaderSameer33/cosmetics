import 'package:cosmentics/core/ui/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.isPassword = false,
  });
  final String hintText;
  final String labelText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,

      cursorColor: const Color(0xff434C6D),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This fild is requird';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: const AppImage(image: 'search.svg'),

        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
