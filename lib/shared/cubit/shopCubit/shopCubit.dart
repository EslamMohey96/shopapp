import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/modules/shopScreens/categories/categories.dart';
import 'package:shop_app/modules/shopScreens/favorites/favorites.dart';
import 'package:shop_app/modules/shopScreens/products/products.dart';
import 'package:shop_app/modules/shopScreens/settings/settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/endPoints.dart';

class shopCubit extends Cubit<shopStates> {
  shopCubit() : super(shopInitState());
  static shopCubit get(context) => BlocProvider.of(context);

  int index = 0;
  late homeModel home_model;

  List<Widget> bottomScreens = [
    products(),
    categories(),
    favorites(),
    settings(),
  ];

  void changeBottom(int index) {
    this.index = index;
    emit(changeBottomState());
  }

  void getHomeData() {
    emit(homeLoadingState());
    print(home);
    print(Token);
    dioHelper
        .getData(
      url: home,
      token: Token,
    )
        .then((value) {
      print("home_model.status");
      home_model = homeModel.fromJson(value.data);
      print(home_model.status);
      emit(homeSuccessState());
    }).catchError((onError) {
      print("home_model");
      emit(homeErrorState(onError));
    });
  }
}
