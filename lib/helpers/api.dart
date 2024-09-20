import 'package:dio/dio.dart';
import 'package:p_o_s/constants/api_routes.dart';

class Api {
  factory Api() {
    _dio = Dio();
    return _singleton;
  }
  static late final Dio _dio;
  Api._internal();
  static final Api _singleton = Api._internal();

  Future<Map<String, dynamic>> get({String? params}) async {
    String url = baseUrl;

    if (params != null) {
      url += params;
    }
    final response = await _dio.get(url);
    return response.data;
  }
}
