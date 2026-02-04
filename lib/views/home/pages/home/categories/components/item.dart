part of '../view.dart';

class _Item extends StatelessWidget {
  const _Item({required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: AppImage(
          image: categoryModel.image,
          height: 64.h,
          width: 64.w,
        ),
      ),
      title: Text(
        categoryModel.title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const AppImage(
        image: 'arrow.svg',
      ),
    );
  }
}
