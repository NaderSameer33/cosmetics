import '../logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, this.onCountryCodeChanged});
  final ValueChanged<String>? onCountryCodeChanged;

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late List<CountryModel> countryList;
  late String currentCountryIndex;

  @override
  void initState() {
    super.initState();
    getData();
    
  }

  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});
    final response = await DioHelper.getData(endPoint: 'Countries');
    if (response.issucces) {
      countryList = CountryData.fromJos(response.data!).list;
      getEgyptCode();
      state = DataState.success;
    } else {
      state = DataState.falied;
    }
    setState(() {});
  }

  void getEgyptCode() {
    final index = countryList.indexWhere((model) => model.code == '+20');
    if (index == -1) {
      currentCountryIndex = countryList.first.code;
    } else {
      currentCountryIndex = countryList[index].code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return state == DataState.falied
        ? IconButton(
            onPressed: getData,
            icon: const Icon(
              Icons.replay,
            ),
          )
        : state == DataState.loading
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
                items: countryList
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
  CountryData.fromJos(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? {},
    ).map((model) => CountryModel.fromJson(model)).toList();
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
