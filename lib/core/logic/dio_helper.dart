import 'package:dio/dio.dart';

class DioHelper {
  static const _baseUrl = 'https://cosmatics.growfet.com/api/';
  static const _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static final _dio = Dio(
    BaseOptions(baseUrl: _baseUrl, headers: _headers),
  );

  static Future<CustomResponse> getData({
    required String endPoint,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
      );
      final data;
      if (response.data is List) {
        data = {'list': response.data};
      } else {
        data = response.data;
      }

      return CustomResponse(issucces: true, data: data);
    } on DioException catch (e) {
      print(e.toString());
      return CustomResponse(issucces: false, expetion: e.toString());
    }
  }

  static Future<CustomResponse> sendData({
    required Map<String, dynamic> data,
    required String endPoint,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );
      return CustomResponse(issucces: true, data: response.data);
    } on DioException catch (e) {
      return CustomResponse(
        issucces: false,
        expetion: e.response?.data['message'],
      );
    }
  }
}

class CustomResponse {
  final bool issucces;
  final String? expetion;
  final Map<String, dynamic>? data;

  CustomResponse({required this.issucces, this.expetion, this.data});
}
