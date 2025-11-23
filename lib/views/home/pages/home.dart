import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_search.dart';

import '../../../core/ui/app_image.dart';
import '../widgets/home_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppImage(
                    image: 'home_makup.png',
                    height: 320.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE9DCD3).withValues(alpha: .8),
                    ),
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '50% OFF DISCOUNT \n CUPON CODE : 125865',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff62322D),
                                ),
                              ),
                            ),
                            const AppImage(
                              image: 'offer.svg',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            const AppImage(image: 'offer.svg'),
                            const Spacer(),
                            Text(
                              'Hurry up! \n Skin care only !',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            Text(
              'Top rated products',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            const HomeGridView(),
          ],
        ),
      ),
    );
  }
}
