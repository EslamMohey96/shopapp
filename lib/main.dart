import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shopLayout.dart';
import 'package:shop_app/modules/onBoarding/onBoarding.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/blocObserver.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingStates.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/styles/themes.dart';

// New Comment
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = blocObserver();
  dioHelper.init();
  await cacheHelper.init();
  Widget startPage;
  Token = cacheHelper.getData(key: 'token') == null
      ? ''
      : cacheHelper.getData(key: 'token');
  bool? isLight = cacheHelper.getData(key: "isLight") == null
      ? true
      : cacheHelper.getData(key: "isLight");
  bool? isLang = cacheHelper.getData(key: "isLang") == null
      ? true
      : cacheHelper.getData(key: "isLang");
  bool? onBoard = cacheHelper.getData(key: "onBoarding") == null ? false : true;
  bool? isLogin = Token == '' ? false : true;
  lang = !isLang! ? "en" : "ar";

  if (Token == '') {
    if (onBoard) {
      startPage = logInScreen();
    } else {
      startPage = onBoarding();
    }
  } else {
    if (onBoard) {
      if (isLogin) {
        startPage = shopLayout();
      } else {
        startPage = logInScreen();
      }
    } else {
      startPage = onBoarding();
    }
  }

  runApp(MyApp(
    isLight!,
    isLang!,
    startPage,
  ));
}

class MyApp extends StatelessWidget {
  Widget startPage;
  late final bool isLight;
  late final bool isLang;
  MyApp(this.isLight, this.isLang, this.startPage);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((BuildContext context) => onBoardingCubit()
            ..changeLightMode(isLightMode: isLight)
            ..changeLangMode(isLangMode: isLang)),
        ),
        BlocProvider(
          create: (BuildContext context) => myLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => registerCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => shopCubit()
            ..getCategoriesData()
            ..getHomeData()
            ..IsFavoritesData()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<onBoardingCubit, onBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: onBoardingCubit.get(context).lightMode
                ? ThemeMode.light
                : ThemeMode.dark,
            home: startPage,
          );
        },
      ),
    );
  }
}
