import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  final _list = const [
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://images.satu.kz/186949256_w200_h200_athe-authentic-lip.jpg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://img.joomcdn.net/687cd9796995bdd7fe40ed1b0e618c317c4ed3e0_original.jpeg',
      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',

      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/4a52958221ed2fe708ee1b196daf26ade9d73742_original.jpeg',
      '\$44.99',
      'Face tint / lip tint',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',
      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://img.joomcdn.net/307c7497a72f45db4cd241c998ca272a6efa670e_original.jpeg',

      '\$44.99',
      'Athe Red lipstick',
    ),
    _Modle(
      'https://images.satu.kz/186949256_w200_h200_athe-authentic-lip.jpg',
      '\$44.99',
      'Face tint / lip tint',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 100.r),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,

        childAspectRatio: 176 / 237,
      ),
      shrinkWrap: true,

      itemCount: _list.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _Item(
          prodcutModel: _list[index],
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.prodcutModel});
  final _Modle prodcutModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color(0xffD9D9D9),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.r,
            spreadRadius: 0,
            offset: const Offset(0, 1),
            blurStyle: BlurStyle.inner,
            color: Colors.black,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: AppImage(
                  fit: BoxFit.cover,
                  image: prodcutModel.image,
                  width: double.infinity,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 6.r, top: 6.r),
                padding: EdgeInsets.all(8.r),
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: AppImage(
                  image: 'home_card.svg',
                  height: 16.h,
                  width: 16.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            prodcutModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,

              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            prodcutModel.price,
            style: TextStyle(
              color: const Color(0xff70839C),
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Modle {
  final String image, title, price;
  const _Modle(this.image, this.price, this.title);
}
