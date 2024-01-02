import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class myLoginCubit extends Cubit<myLoginStates> {
  GlobalKey<FormState> formKey = formKeyList[1];
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

  void changeVisiblePassword(bool pass) {
    visiblePassword = pass;
    emit(myLogvisiblePasswordState());
  }

  bool loginDone = false;
  userLogin({
    context,
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
      opt:{
        "lang":lang,
        "Content-Type":"application/json"
      } 
    ).then((value) {
      login_model = loginModel.fromJson(value.data);
      formKey.currentState?.reset();
      emit(loginSuccessState(login_model));
    }).then((value) => changeToken()).catchError((onError) {
      emit(loginErrorState(onError.toString()));
    });
  }

  bool changeTokenDone = false;
  changeToken() {
    cacheHelper
        .setData(
      key: 'token',
      value: login_model.data!.token,
    )
        .then((value) {
      Token = cacheHelper.getData(
        key: 'token',
      );
    }).then((value) {
      changeTokenDone = true;
      emit(changeTokenDoneState());
    });
  }
}
