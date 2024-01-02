import 'package:flutter/material.dart';
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
String lang = 'en';
List<GlobalObjectKey<FormState>> formKeyList = List.generate(10, (index) => GlobalObjectKey<FormState>(index));


