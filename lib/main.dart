import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shopLayout.dart';
import 'package:shop_app/modules/onBoarding/onBoarding.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/modules/userScreens/profile/profile.dart';
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
  Token = cacheHelper.getData(key: 'token')== null ? '' :  cacheHelper.getData(key: 'token');
  bool? isDark = cacheHelper.getData(key: "isDark") == null ? false : true;
  bool? onBoard = cacheHelper.getData(key: "onBoarding");
  bool? isLogin = cacheHelper.getData(key: "isLogin");

  if (onBoard != null) {
    if (isLogin != null) {
      startPage = profile();
    } else {
      startPage = logInScreen();
    }
  } else {
    startPage = onBoarding();
  }

  runApp(MyApp(
    isDark,
    startPage,
  ));
}

class MyApp extends StatelessWidget {
  Widget startPage;
  late final bool isDark;
  MyApp(this.isDark, this.startPage);

  // Widget startPage() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((BuildContext context) => shopCubit()
          ..getHomeData()
          ),
        ),
        BlocProvider(
          create: ((BuildContext context) =>
              onBoardingCubit()..changeDarkMode(isDarkMode: isDark)),
        ),
        BlocProvider(
          create: (BuildContext context) => myLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => registerCubit(),
        ),
      ],
      child: BlocConsumer<onBoardingCubit, onBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: onBoardingCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home:
             startPage,
          );
        },
      ),
    );
  }
}
