import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/modules/boarding/onBoarding.dart';
import 'package:shop_app/modules/loginScreen/logInScreen.dart';
import 'package:shop_app/modules/profile/profile.dart';
import 'package:shop_app/shared/components/blocObserver.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/profileCubit/profileCubit.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';
import 'package:shop_app/shared/network/remote/dioHelper/dioHelper.dart';
import 'package:shop_app/shared/styles/themes.dart';

// New Comment
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = blocObserver();
  await dioHelper.init();
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: "isDark") == null ? false : true;
  bool? onBoarding =
      cacheHelper.getData(key: "onBoarding") == null ? false : false;
  bool? isLogin = cacheHelper.getData(key: "token") == null ? false : true;
  var login_model;

  if (isLogin) {
    login_model = cacheHelper.getData(key: "token");
    print(login_model);
  }
  print(isDark);
  print(onBoarding);
  print(cacheHelper.getData(key: "token"));
  runApp(MyApp(isDark, onBoarding, isLogin, login_model));
}

class MyApp extends StatelessWidget {
  late final bool isDark;
  late final bool onBoardingScreen;
  late final bool isLogin;
  late String login_model;

  MyApp(this.isDark, this.onBoardingScreen, this.isLogin, this.login_model);

  Widget startPage(context) {
    if (isLogin) {
      print(cacheHelper.getData(key: "token"));
      profileCubit
          .get(context)
          .userData(token: cacheHelper.getData(key: "token"));
      print(profileCubit.get(context).login_model);
    }

    return onBoardingScreen
        ? isLogin
            ? profile(profileCubit.get(context).login_model)
            : logInScreen()
        : onBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return shopCubit()..changeDarkMode(isDarkMode: isDark);
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return myLoginCubit();
          },
        ),
        BlocProvider(
          create: (BuildContext context) => registerCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) {
            return profileCubit();
          },
        ),
      ],
      child: BlocConsumer<shopCubit, shopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: shopCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startPage(context),
          );
        },
      ),
    );
  }
}
