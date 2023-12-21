import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class myLoginCubit extends Cubit<myLoginStates> {
  myLoginCubit() : super(myLoginInitState());
  static myLoginCubit get(context) => BlocProvider.of(context);
  String massage = "";
  bool visiblePassword = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  List li = [];
  late loginModel login_model;

  void changeMassage({required mass}) {
    massage = mass;
    emit(changeMassageState());
  }

  late Map<String, dynamic> allUsers = {};
  void getAllUser() {
    emit(getAllUsersLoadingState());
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: users,
    )
        .then((value) {
      print("get is done");
      allUsers = value.data;
      print(allUsers);
      emit(getAllUsersSuccessState());
    }).catchError((onError) {
      emit(getAllUsersErrorState(onError.toString()));
    });
  }

  valid({
    required user,
    required pass,
  }) {
    li = [];
    for (int value = 0; value < allUsers["data"].length; value++) {
      print(value);

      if (allUsers["data"][value]["email"] == user) {
        if (allUsers["data"][value]["first_name"] == pass) {
          print("trying");
          li.add("valid");
          li.add(value);
          break;
        } else {
          li.add("notPass");
          li.add(0);
          break;
        }
      }
    }
    if (li.length == 0) {
      li = ["notFound", 0];
    }
  }

  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(myLogvisiblePasswordState());
  }

  void userLogin({
    required email,
    required password,
  }) {
    emit(loginLoadingState());
    dioHelper.postData(
      url: login,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      login_model = loginModel.fromJson(value.data);
      // print(login_model.message);
      // print(login_model.data?.token);
      // print(value.data);
      emit(loginSuccessState(login_model));
    }).catchError((onError) {
      emit(loginErrorState(onError.toString()));
    });
  }
}
