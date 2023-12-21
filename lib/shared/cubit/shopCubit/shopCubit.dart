import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class shopCubit extends Cubit<shopStates> {
  shopCubit() : super(shopInitState());
  static shopCubit get(context) => BlocProvider.of(context);
  bool darkMode = false;
  int index = 0;

  void changeIndex({required i}) {
    index = i;
    emit(changeIndexState());
  }

  void changeDarkMode({isDarkMode}) {
    if (isDarkMode != null) {
      darkMode = isDarkMode;
      emit(darkModeState());
    } else {
      darkMode = !darkMode;
      print(darkMode);
      cacheHelper
          .setData(key: "isDark", value: darkMode)
          .then((value) => emit(darkModeState()));
      emit(darkModeState());
      print(cacheHelper.getData(key: 'isDark'));
    }
  }
}
