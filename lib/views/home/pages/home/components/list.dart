part of '../view.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel>? list;
  DataState state = DataState.loading;
  Future<void> getData() async {
    final resp = await DioHelper.getData(endPoint: 'Products');

    if (resp.issucces) {
      state = DataState.success;

      list = ProductData.formJosnList(resp.data!).list;
    } else {
      state = DataState.falied;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return state == DataState.falied
        ? const Center(
            child: AppImage(
              image: 'error.json',
            ),
          )
        : state == DataState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Column(
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
  ProductData.formJosnList(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? {},
    ).map((model) => ProductModel.fromJson(model)).toList();
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
