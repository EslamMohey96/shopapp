import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constants.dart';

class dioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
    print("init");
  }

  static Future<Response<dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? opt
  }) async {
    print("${Token}!!!!!");
    return await dio!.get(
      url,
      queryParameters: queryParameter,
      options: Options(
        headers:opt,
      ),
    );
  }

  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? data,
    Map<String, dynamic>? opt
  }) async {
    return await dio!.post(
    url,
    data: data,
    queryParameters: queryParameter,
    options: Options(
      headers:opt,
    ),
    );
  }

    static Future<Response<dynamic>> putData({
    required String url,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? data,
    String lang = 'eng',
    String? token = '',
    Map<String, dynamic>? opt
  }) async {
    return await dio!.put(
      url,
      data: data,
      queryParameters: queryParameter,
      options: Options(
        headers:opt,
      ),
    );
  }
}
