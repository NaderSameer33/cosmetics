import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.scaleDown,
    this.isCircle = false,
  });
  final String image;
  final double? height, width;
  final Color? color;
  final BoxFit fit;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final myFit = isCircle ? BoxFit.cover : fit;
    Widget child;
    if (image.isEmpty) {
      return const SizedBox.shrink();
    }

    if (image.toLowerCase().endsWith('svg')) {
      child = SvgPicture.asset(
        'assets/icons/$image',
        color: color, 
        height: height,
        width: width,
        fit: myFit,
      );
    } else if (image.startsWith('http')) {
      child = Image.network(
        fit: myFit,
        image,
        color: color,
        height: height,
        width: width,
      );
    } else if (image.endsWith('json')) {
      child = Lottie.asset(
        'assets/lotties/$image',
        height: height,
        width: width,
        fit: myFit,
      );
    } else {
      child = Image.asset(
        'assets/images/$image',
        fit: myFit,

        color: color,
        height: height,
        width: width,
      );
    }
    if (isCircle) {
      return ClipOval(
        child: child,
      );
    }

    return child;
  }
}
