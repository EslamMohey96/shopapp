import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/constants.dart';

class dioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        // receiveDataWhenStatusError: true,
      ),
    );
    print("init");
  }

  static Future<Response<dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParameter,
    String lang = 'en',
    String? token = '',
  }) async {
    //  dio!.options.headers = {
    //   'Content-Type': 'application/json',
    //   'lang': lang,
    //   'Authorization': token,
    // };
    print(dio?.request(url));
    print(token);
    return await dio!.get(
      // 'https://student.valuxapps.com/api/${url}',
      url,
      options: Options(
        headers: {
          // 'Host': '<calculated when request is sent>',
          // 'Postman-Token': '<calculated when request is sent>',
          // 'User-Agent': '<PostmanRuntime/7.36.0>',
          // 'Accept': '<*/*>',
          // 'Accept-Encoding': '<gzip, deflate, br>',
          // 'Connection': '<keep-alive>',
          'lang': lang,
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      ),
    );
  }

  static Future<Response<dynamic>> postData({
    required String url,
    Map<String, dynamic>? queryParameter,
    required Map<String, dynamic> data,
    String lang = 'eng',
    String? token = '',
  }) async {
    // dio!.options.headers = {
    //   'Content-Type': 'application/json',
    //   'lang': lang,
    // };
    return await dio!.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'lang': lang,
          'Authorization': token,
        },
      ),
    );
  }
}
