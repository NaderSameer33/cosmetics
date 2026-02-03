import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String currentCountryIndex;
  final list = ['10', '20', '30', '40'];
  @override
  void initState() {
    super.initState();
    currentCountryIndex = list.first;
    widget.onCountryCodeChanged?.call(
      currentCountryIndex,
    ); // to call a parent in login one render
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
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          value: currentCountryIndex,
          items: list.map((buildDropDownItem)).toList(),

          onChanged: (value) {
            currentCountryIndex = value!;
             widget.onCountryCodeChanged?.call(currentCountryIndex);
            setState(() {});
           
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildDropDownItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item.toString()),
    );
  }
}
