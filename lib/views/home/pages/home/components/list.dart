part of '../view.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel>? list;
  Future<void> getData() async {
    final resp = await Dio().get('https://cosmatics.growfet.com/api/Products');
    list = ProductData.formJosnList(resp.data).list;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top rated products',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          padding: EdgeInsets.only(bottom: 100.r),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,

            childAspectRatio: 176 / 237,
          ),
          shrinkWrap: true,

          itemCount: list!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _Item(
              productModel: list![index],
            );
          },
        ),
      ],
    );
  }
}

class ProductData {
  late final List<ProductModel> list;
  ProductData.formJosnList(List<dynamic> list) {
    this.list = list
        .map((productModel) => ProductModel.fromJson(productModel))
        .toList();
  }
}

class ProductModel {
  late final int id, stock, catagoryId;
  late final String name, descrption, image;

  late final num price;

  ProductModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    name = jsonData['name'] ?? '';
    descrption = jsonData['description'] ?? '';
    price = jsonData['price'] ?? 0;
    image = jsonData['imageUrl'] ?? '';

    stock = jsonData['stock'] ?? 0;
    catagoryId = jsonData['categoryId'] ?? 0;
  }
}
