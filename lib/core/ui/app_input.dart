import 'app_country_code.dart';

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
    this.onCountryCodeChanged,
    this.validator,
  });

  final String? suffixIcon, hintText, label;
  final bool withCountryCode;
  final bool isSuffix;
  final bool isSearch;
  final TextEditingController? controller;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.withCountryCode)
          AppCountryCode(
            onCountryCodeChanged: widget.onCountryCodeChanged,
          ),
        Expanded(
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: isHidden && widget.isSuffix,

            decoration: InputDecoration(
              isDense: true,
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
