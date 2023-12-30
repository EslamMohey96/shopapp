import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/models/registerModel.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerStatus.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class registerCubit extends Cubit<registerStates> {
  registerCubit() : super(registerInitStatus());
  static registerCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  bool visiblePassword = false;
  late registerModel register_model;

  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(registervisiblePasswordState());
  }

  void userRegister({
    context,
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(registerLoadingState());
    dioHelper
        .postData(
          url: register, data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        }, opt: {
          "lang": "en",
          "Content-Type": "application/json",
        })
        .then((value) {
          register_model = registerModel.fromJson(value.data);
          formKey.currentState?.reset();
          emit(registerSuccessState(register_model));
        })
        .catchError((onError) {
          emit(registerErrorState(onError.toString()));
        });
  }
}
