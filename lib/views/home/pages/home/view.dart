
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/ui/app_search.dart';
import '../../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';
part 'components/offers.dart';
part 'components/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.r),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            const AppSearch(),

            SizedBox(height: 12.h),
            const _Offers(),

            SizedBox(height: 10.h),

            const ProductList(),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.productModel});
  final ProductModel productModel;

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
                  image: productModel.image,
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
            productModel.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,

              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            '${productModel.price} \$',
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
