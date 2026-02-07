import 'package:dio/dio.dart';



enum DataState { loading, success, falied }

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
    Map<String, dynamic>? quweryParamters,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: quweryParamters,
      );
      final dynamic data;
      if (response.data is List) {
        data = {'list': response.data};
      } else {
        data = response.data;
      }
      if (response.statusCode == 200) {
        return CustomResponse(issucces: true, data: data);
      }
      return CustomResponse(issucces: false, data: data);
    } on DioException catch (e) {
      return CustomResponse(
        issucces: false,
        expetion: e.response?.data['message'],
      );
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
