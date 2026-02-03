import 'app_image.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.startSpacing = 0});
  final double startSpacing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: startSpacing),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: const Color(0xff101010).withValues(alpha: .05),
        child: const AppImage(image: 'arrow_back.svg'),
      ),
    );
  }
}
