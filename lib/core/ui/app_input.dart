import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.label,
    this.withCountryCode = false,
    this.isSuffix = false,
    this.isSearch = false,
  });
  final String? suffixIcon, hintText, label;
  final bool withCountryCode;
  final bool isSuffix;
  final bool isSearch;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late int currentCuntryIndex;
  final list = [10, 20, 30, 40];
  bool isHidden = true;
  @override
  void initState() {
    currentCuntryIndex = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.withCountryCode)
          Padding(
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
          ),

        Expanded(
          child: TextFormField(
            obscureText: isHidden && widget.isSuffix,
            decoration: InputDecoration(
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
              labelText: widget.label,

              hintText: widget.hintText,
              suffixIcon: widget.isSuffix
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: AppImage(
                        image: isHidden ? 'visibily_off.svg' : 'visiblily.svg',
                      ),
                    )
                  : widget.suffixIcon != null
                  ? AppImage(
                      image: widget.suffixIcon!,
                      fit: BoxFit.scaleDown,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Color(0xff5a6690),
    ),
  );
}
