part of '../view.dart';

class _Summary extends StatelessWidget {
  const _Summary({
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
