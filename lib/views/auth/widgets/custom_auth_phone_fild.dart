import 'package:flutter/material.dart';

import '../../../core/ui/app_input.dart';

class CustomPhoneAuthFild extends StatelessWidget {
  const CustomPhoneAuthFild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 46,
            width: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
              border: BoxBorder.all(color: const Color(0xff5A6690)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+20',
                ),
                Icon(
                  Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Expanded(
          flex: 3,
          child: AppInput(
            hintText: 'Phone Number',
            labelText: 'Phone Number',
          ),
        ),
      ],
    );
  }
}
