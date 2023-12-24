import 'package:shop_app/shared/network/local/cacheHelper.dart';

String baseURL = 'https://student.valuxapps.com/api/';
Map<String, dynamic> headers = {
  'Content-Type': 'application/json',
};
String urlMethod = 'api/users';
Map<String, dynamic> users = {
  'page': 2,
};

String Token = '';
