part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers();

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? offerData;
  DataState state = DataState.loading;
  Future<void> getData() async {
    final respone = await DioHelper.getData(endPoint: 'Sliders');
    if (respone.issucces) {
      state = DataState.success;
      offerData = OfferData.fromJson(respone.data!).list;
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
    return state == DataState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : CarouselSlider(
            items: List.generate(
              offerData!.length,
              (index) => ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppImage(
                      image: offerData![index].image,
                      height: 320.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffE9DCD3).withValues(alpha: .8),
                      ),
                      padding: EdgeInsets.all(20.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  offerData![index].descriptionTitle1,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff62322D),
                                  ),
                                ),
                              ),
                              const AppImage(
                                image: 'offer.svg',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            children: [
                              const AppImage(image: 'offer.svg'),
                              const Spacer(),
                              Text(
                                offerData![index].descriptionTitle2,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).toList(),
            options: CarouselOptions(
              height: 320.h,
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 364.w / 317.h,
            ),
          );
  }
}

class OfferData {
  late final List<OfferModel> list;
  OfferData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((model) => OfferModel.fromJson(model)).toList();
  }
}

class OfferModel {
  late final int id, discountPercent;
  late final String image, descriptionTitle1, descriptionTitle2;
  OfferModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    discountPercent = jsonData['discountPercent'] ?? 0;
    image = jsonData['imageUrl'] ?? '';
    descriptionTitle1 = jsonData['descriptionTitle1'] ?? '';
    descriptionTitle2 = jsonData['descriptionTitle2'] ?? '';
  }
}
