import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json', 'lang': 'en'}));
  }

  static Future<Response> postData(
      {required String url, dynamic data, String? token, String? lang}) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url, dynamic data, String? token, String? lang}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang
    };

    return await dio!.put(
      url,
      data: data,
    );
  }

  static Future<Response> getData(
      {required String url, dynamic query, String? token, String? lang}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
