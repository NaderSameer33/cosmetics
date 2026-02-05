import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  List<CountryModel>? countryList;
  late String currentCountryIndex;

  Future<void> getCountryCode() async {
    final response = await Dio().get(
      'https://cosmatics.growfet.com/api/Countries',
    );
    countryList = CountryData.fromList(response.data).list;

    int? index = countryList?.indexWhere((element) => element.code == '+20');
    if (index == null || index == -1) {
      currentCountryIndex = countryList!.first.code;
    } else {
      currentCountryIndex = countryList![index].code;
    }

    widget.onCountryCodeChanged?.call(
      currentCountryIndex,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCountryCode();
  }

  @override
  Widget build(BuildContext context) {
    return countryList == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Padding(
            padding: EdgeInsetsDirectional.only(end: 6.r),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xff5a6690),
                ),
              ),
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                value: currentCountryIndex,
                items: countryList!
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.code,
                        child: Text(item.code),
                      ),
                    )
                    .toList(),

                onChanged: (value) {
                  currentCountryIndex = value!;
                  widget.onCountryCodeChanged?.call(currentCountryIndex);
                  setState(() {});
                },
              ),
            ),
          );
  }
}

class CountryData {
  late final List<CountryModel> list;
  CountryData.fromList(List<dynamic> list) {
    this.list = list.map((model) => CountryModel.fromJson(model)).toList();
  }
}

class CountryModel {
  late final int id;
  late final String name, code;

  CountryModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'] ?? 0;
    name = jsonData['name'] ?? '';
    code = jsonData['code'] ?? '';
  }
}
