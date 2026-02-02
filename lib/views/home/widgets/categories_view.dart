import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  final _list = const [
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Bundles',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Perfumes',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Makeup',
    ),
    _Model(
      'https://i.pinimg.com/736x/83/fe/6e/83fe6e8e6c1e5e642f1e4fe88847bb6b.jpg',
      'Skin Care',
    ),
    _Model(
      'https://img.joomcdn.net/687cd9796995bdd7fe40ed1b0e618c317c4ed3e0_original.jpeg',
      'Gifts',
    ),

    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Bundles',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Perfumes',
    ),
    _Model(
      'https://d1flfk77wl2xk4.cloudfront.net/Assets/38/067/XXL_p0189906738.jpg',
      'Makeup',
    ),
    _Model(
      'https://i.pinimg.com/736x/83/fe/6e/83fe6e8e6c1e5e642f1e4fe88847bb6b.jpg',
      'Skin Care',
    ),
    _Model(
      'https://img.joomcdn.net/687cd9796995bdd7fe40ed1b0e618c317c4ed3e0_original.jpeg',
      'Gifts',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:  EdgeInsets.only(bottom: 100.r),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _list.length,
      itemBuilder: (context, index) => _Item(
        model: _list[index],
      ),

      separatorBuilder: (context, index) => const Divider(
        color: Color(0xffb3b3c1),
        thickness: 1,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.model});
  final _Model model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: AppImage(
          image: model.image,
          height: 64.h,
          width: 64.w,
        ),
      ),
      title: Text(
        model.title,
        style:  TextStyle(
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

class _Model {
  final String image, title;
  const  _Model(this.image, this.title);
   


  
}

