import 'package:cosmentics/core/logic/dio_helper.dart';
import 'package:cosmentics/core/logic/helper_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/ui/app_image.dart';
import 'cart_button.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  DataState state = DataState.loading;
  List<CartModel> list = [];
  Future<void> getCart() async {
    final response = await DioHelper.getData(endPoint: 'Cart');
    if (response.issucces) {
      list = CartData.fromJson(response.data!).list;
      state = DataState.success;
    } else {
      state = DataState.falied;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return state == DataState.falied
        ? const Center(
            child: AppImage(image: 'error.json'),
          )
        : state == DataState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.only(bottom: 100.r),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => _Item(
              onDelete: () {
                list.removeAt(index);
                setState(() {});
              },
              cartModel: list[index],
            ),

            separatorBuilder: (context, index) => const Divider(
              color: Color(0xffB3B3C1),
              endIndent: 20,
              indent: 20,
            ),

            itemCount: list.length,
          );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.cartModel, required this.onDelete});
  final CartModel cartModel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: AppImage(
                image: cartModel.imageUrl,
                fit: BoxFit.cover,
                height: 100.h,
                width: 100.w,
              ),
            ),
            DeleteCart(
              onDelete: onDelete,
              productId: cartModel.id,
            ),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextSpan(
                  text: '${cartModel.proudctName} \n',

                  children: [
                    TextSpan(
                      text: '${cartModel.price} \$',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CartButton(
                  productId: cartModel.id,
                  quantity: cartModel.quantity,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DeleteCart extends StatefulWidget {
  const DeleteCart({
    super.key,
    required this.productId,
    required this.onDelete,
  });
  final int productId;
  final VoidCallback onDelete;
  @override
  State<DeleteCart> createState() => _DeleteCartState();
}

class _DeleteCartState extends State<DeleteCart> {
  late int productId;

  Future<void> deleteCart() async {
    final response = await DioHelper.deleteData(
      endPoint: 'Cart/remove/$productId',
    );
    if (response.issucces) {
      showMsg(response.data!['message']);
      widget.onDelete();
    } else {
      showMsg(response.expetion!);
    }
  }

  @override
  void initState() {
    super.initState();
    productId = widget.productId;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteCart();
      },
      icon: const AppImage(
        image: 'out.svg',
      ),
    );
  }
}

class CartData {
  late List<CartModel> list;
  late double total;
  CartData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['items'] ?? {},
    ).map((model) => CartModel.fromJson(model)).toList();
    total = json['total'];
  }
}

class CartModel {
  late int id, quantity;
  late double price;

  late String proudctName, imageUrl;

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['productId'] ?? 0;
    quantity = json['quantity'] ?? 0;
    price = json['price'] ?? 0;
    imageUrl = json['imageUrl'] ?? '';
    proudctName = json['productName'] ?? '';
  }
}
