import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/bording/onBoarding.dart';
import 'package:shop_app/shared/components/blocObserver.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
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
  dioHelper.init();
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: "isDark");
  runApp(MyApp(isDark = false));
}

class MyApp extends StatelessWidget {
  late final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((BuildContext context) =>
              shopCubit()..changeDarkMode(isDarkMode: isDark)),
        ),
        BlocProvider(
          create: (BuildContext context) => myLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => registerCubit(),
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
            home: onBoarding(),
          );
        },
      ),
    );
  }
}
