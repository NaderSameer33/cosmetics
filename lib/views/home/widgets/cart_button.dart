import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartButton extends StatefulWidget {
  CartButton({
    super.key,
    required this.quantity,
    required this.productId,
  });
  int quantity, productId;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  late int quantity;

  Future<void> upDataCart() async {
    final response = await DioHelper.putData(
      endPoint: 'Cart/update',
      queryParameters: {
        'productId': widget.productId,
        'quantity': quantity,
      },
    );
    if (response.issucces) {
      showMsg(response.data!['message']);
    } else {
      showMsg(response.expetion!, isError: true);
    }
  }

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

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
              if (quantity > 1) {
                quantity--;
                setState(() {});
                upDataCart();
              }
            },
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$quantity',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              if (quantity < 100) {
                quantity++;
                setState(() {});
                upDataCart();
              } else {
                showMsg(
                  'معدتش فيه  كميه ي غبي ',
                );
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
