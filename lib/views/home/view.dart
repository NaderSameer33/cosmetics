import 'package:cosmentics/views/home/pages/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/ui/app_image.dart';
import 'pages/cart.dart';
import 'pages/home/categories/view.dart';
import 'pages/profile/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final _homeList = [
    const _HomeModel('home.svg', HomePage()),
    const _HomeModel('categories.svg', CategoriesPage()),
    const _HomeModel('cart.svg', CartPage()),
    const _HomeModel('profile.svg', ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeList[_currentIndex].widget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: EdgeInsets.symmetric(horizontal: 13.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: const Offset(-4, 4),
              blurRadius: 6,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
              color: Colors.black.withValues(alpha: .1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            setState(() {});
          },
          selectedFontSize: 0,
          unselectedFontSize: 0,

          backgroundColor: const Color(0xffD9D9D9),
          type: BottomNavigationBarType.fixed,

          items: List.generate(
            4,
            (index) {
              return BottomNavigationBarItem(
                icon: AppImage(
                  image: _homeList[index].image,
                  color: _currentIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
                label: '',
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HomeModel {
  final String image;
  final Widget widget;
  const _HomeModel(this.image, this.widget);
}
