import '../core/logic/cache_helper.dart';
import '../main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/logic/helper_methods.dart';
import '../core/ui/app_image.dart';
import 'auth/login.dart';
import 'package:flutter/material.dart';

class OnBoradingView extends StatefulWidget {
  const OnBoradingView({super.key});

  @override
  State<OnBoradingView> createState() => _OnBoradingViewState();
}

class _OnBoradingViewState extends State<OnBoradingView> {
  final _onBoradingList = [
    _Model(
      image: 'on_borading_one.png',
      title: 'WELCOME!',
      subTitle:
          'Makeup has the power to transform your \nmood and empowers you to be a more\n confident person.',
    ),
    _Model(
      image: 'on_borading_two.png',
      title: 'SEARCH & PICK',
      subTitle:
          'We have dedicated set of products and\n  routines hand picked for every skin type.',
    ),
    _Model(
      title: 'PUCH NOTIFICATIONS ',
      subTitle: 'Allow notifications for new makeup  &\n  cosmetics offers.',
      image: 'on_borading_three.png',
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },

        itemCount: _onBoradingList.length,
        itemBuilder: (context, index) => _OnBoradingItem(
          currentIndex: currentIndex,
          onBordingModel: _onBoradingList[index],
        ),
      ),
    );
  }
}

class _OnBoradingItem extends StatelessWidget {
  const _OnBoradingItem({
    required this.onBordingModel,
    required this.currentIndex,
  });
  final _Model onBordingModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            currentIndex == 0 || currentIndex == 1
                ? Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xff434C6D),
                      ),
                      onPressed: () {
                        goTo(const LoginView());
                      },
                      child: const Text(
                        'Skip',
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 50.h,
            ),
            AppImage(
              image: onBordingModel.image,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              textAlign: TextAlign.center,
              onBordingModel.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: currentIndex == 0 || currentIndex == 2
                    ? const Color(0xff434C6D)
                    : Colors.white,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              onBordingModel.subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: currentIndex == 0 || currentIndex == 2
                    ? const Color(0xff434C6D)
                    : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            if (currentIndex == 0 || currentIndex == 1)
              Center(
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  backgroundColor: const Color(0xff434C6D),
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 60, left: 60),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff434C6D),
                  ),
                  onPressed: ()  {
                     CacheHelper.setIsFirstTime(); 
                    goTo(const LoginView(), canPop: false);
                  },
                  child: Text(
                    'let’s start!',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final String image, title, subTitle;
  _Model({
    required this.image,
    required this.subTitle,
    required this.title,
  });
}
