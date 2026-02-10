import '../../../../../core/logic/dio_helper.dart';
import '../../../../../core/logic/helper_methods.dart';
import '../../../../../core/ui/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/ui/app_search.dart';
part 'components/item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryModel>? list;

  Future<void> getData() async {
    final resp = await DioHelper.getData(endPoint: 'Categories');
    if (resp.issucces) {
      list = CategoryData.fromJson(resp.data ?? {}).list;

      setState(() {});
    } else {
      showMsg(resp.expetion ?? '', isError: true);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
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
              ListView.separated(
                padding: EdgeInsets.only(bottom: 100.r),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list!.length,
                itemBuilder: (context, index) => _Item(
                  categoryModel: list![index],
                ),
      
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xffb3b3c1),
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryData {
  late final List<CategoryModel> list;
  CategoryData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'],
    ).map((model) => CategoryModel.fromJson(model)).toList();
  }
}

class CategoryModel {
  late final int id;
  late final String image, title;

  CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    title = jsonData['title'] ?? '';
    image = jsonData['imageUrl'] ?? '';
  }
}
