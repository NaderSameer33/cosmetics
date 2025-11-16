import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.scaleDown,
  });
  final String image;
  final double? height, width;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().endsWith('svg')) {
      return SvgPicture.asset(
        'assets/svg/$image',
        color: color,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (image.startsWith('http')) {
      return Image.network(
        fit: fit,
        image,
        color: color,
        height: height,
        width: width,
      );
    }
    return Image.asset(
      'assets/images/$image',
      fit: fit,

      color: color,
      height: height,
      width: width,
    );
  }
}
