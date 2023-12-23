import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

loginModel userLogin({
  required email,
  required password,
}) {
  var i;
  dioHelper.postData(
    url: login,
    data: {
      "email": email,
      "password": password,
    },
  ).then((value) {
    i = value;
  }).catchError((onError) {});
  return loginModel.fromJson(i.data);
}
