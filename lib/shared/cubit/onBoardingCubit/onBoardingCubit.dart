import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class onBoardingCubit extends Cubit<onBoardingStates> {
  onBoardingCubit() : super(onBoardingInitState());
  static onBoardingCubit get(context) => BlocProvider.of(context);
  int index = 0;

  void changeIndex({required i}) {
    index = i;
    emit(changeIndexState());
  }

// changeLightMode
  bool lightMode = cacheHelper.getData(key: "isLight") == null ? false : false;
  void changeLightMode({isLightMode}) {
    if (isLightMode != null) {
      lightMode = isLightMode;
      emit(lightModeState());
    } else {
      lightMode = !lightMode;
      print(lightMode);
      cacheHelper
          .setData(key: "isLight", value: lightMode)
          .then((value) => emit(lightModeState()));
      emit(lightModeState());
      print(cacheHelper.getData(key: 'isDark'));
    }
  }

  // changelangMode
  bool langMode = cacheHelper.getData(key: "isLang") == null ? false : false;
  void changeLangMode({isLangMode}) {
    if (isLangMode != null) {
      langMode = isLangMode;
      lang = langMode?"en":'ar';
      emit(langModeState());
    } else {
      langMode = !langMode;
      lang = langMode?"en":'ar';
      print(langMode);
      cacheHelper
          .setData(key: "isLang", value: langMode)
          .then((value) => emit(langModeState()));
      print(cacheHelper.getData(key: 'isLang'));
    }
  }
}
