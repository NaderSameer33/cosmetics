part of '../view.dart';
class _Tile extends StatelessWidget {
  const _Tile({
    super.key,
    required this.title,
    this.leading,
    this.traling,
    this.subTitle,
    this.padding = 0,
    this.onTap
  });
  final String title;
  final String? subTitle, leading, traling;
  final double padding;
  final VoidCallback ? onTap ; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(padding).copyWith(left: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30.r),
        side: const BorderSide(
          color: Color(0xff73B9BB),
          width: 1.5,
        ),
      ),
      leading: leading != null
          ? GestureDetector(
            onTap: onTap,
            child: AppImage(image: leading!))
          : Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
      title: Text(
        title,
        style: TextStyle(
          color: const Color(0xff434C6D),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subTitle != null
          ? Text(
              subTitle!,
              style: TextStyle(
                color: const Color(0xff434C6D),
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      trailing: traling != null
          ? AppImage(
              image: traling!,
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: FilledButton(
                style: FilledButton.styleFrom(),
                onPressed: () {},
                child: const Text(
                  'Apply',
                ),
              ),
            ),
    );
  }
}
