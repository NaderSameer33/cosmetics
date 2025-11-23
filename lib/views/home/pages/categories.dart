import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/ui/app_search.dart';
import '../widgets/categories_view.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                const AppSearch(),
                SizedBox(
                  height: 20.h,
                ),
                const CategoriesView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
