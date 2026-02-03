import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late int currentCuntryIndex;
  final list = [10, 20, 30, 40];
  @override
  void initState() {
    super.initState();
    currentCuntryIndex = list.first ;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsetsDirectional.only(end: 6.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xff5a6690),
                ),
              ),
              child: DropdownButton(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                value: currentCuntryIndex,
                items: list
                    .map(
                      (e) => DropdownMenuItem<int>(
                        value: e,
                        child: Text('$e'),
                      ),
                    )
                    .toList(),

                onChanged: (value) {
                  setState(() {
                    currentCuntryIndex = value!;
                  });
                },
              ),
            ),
          ); 
  }
}