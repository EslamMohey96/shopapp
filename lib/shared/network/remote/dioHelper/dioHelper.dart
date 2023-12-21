import 'package:dio/dio.dart';
import 'package:shop_app/shared/components/constants.dart';

class dioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        headers: headers,
      ),
    );
    print("init");
  }

  static Future<Response<dynamic>> getData({
    required String url,
    required Map<String, dynamic> queryParameter,
  }) async {
    return await dio!.get(
      url,
      queryParameters: queryParameter,
    );
  }

  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? queryParameter,
    required Map<String, dynamic> data,
    String lang = 'eng',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio!.post(
      url,
      queryParameters: queryParameter,
      data: data,
    );
  }
}
