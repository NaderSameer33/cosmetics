import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatefulWidget {
  const CartButton({
    super.key,
  });

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(
          color: const Color(0xff8E8EA9),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,

        children: [
          IconButton(
            onPressed: () {
              if (number > 1) {
                number--;
                setState(() {});
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$number',
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              number++;
              setState(() {});
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
