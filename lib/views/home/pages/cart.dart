import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/ui/app_image.dart';
import '../../../checkout/view.dart';
import '../widgets/cart_view.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? productCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'My Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => goTo(const CheckoutView()),
                    icon: const AppImage(image: 'card.svg'),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),

              Text(
                'You have $productCount products in your cart',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 34.h,
              ),

              CartView(
                countProduct: (value) {
                  productCount = value;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
