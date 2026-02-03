import 'package:cosmentics/core/ui/app_country_code.dart';

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
    this.controller,
  });

  final String? suffixIcon, hintText, label;
  final bool withCountryCode;
  final bool isSuffix;
  final bool isSearch;
  final TextEditingController? controller;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.withCountryCode) const AppCountryCode(),
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            obscureText: isHidden && widget.isSuffix,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.isSearch ? 24 : 8),
                borderSide: const BorderSide(
                  color: Color(0xff5a6690),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.isSearch ? 24 : 8),
                borderSide: const BorderSide(
                  color: Color(0xff5a6690),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.isSearch ? 24 : 8),
                borderSide: const BorderSide(
                  color: Color(0xff5a6690),
                ),
              ),
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
