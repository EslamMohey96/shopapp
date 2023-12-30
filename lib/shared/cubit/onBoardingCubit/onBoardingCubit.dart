
import 'package:flutter_bloc/flutter_bloc.dart';
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
// changeDarkMode
  bool darkMode =  cacheHelper.getData(key: "isDark")==null? false:false;
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