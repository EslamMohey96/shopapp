import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/modules/shopScreens/search/searchScreen.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class shopLayout extends StatelessWidget {
  const shopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    print(homeModel.fromJson(model).status);
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        shopCubit cubit = shopCubit.get(context);
        return Directionality(
          textDirection: onBoardingCubit.get(context).langMode
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: onBoardingCubit.get(context).langMode
                  ? Text(
                      'Dynamo Store',
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      'متجر دينامو',
                      style: TextStyle(color: Colors.red),
                    ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => searchScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: cubit.bottomScreens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.index,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: onBoardingCubit.get(context).langMode
                      ? 'Home'
                      : 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: onBoardingCubit.get(context).langMode
                      ? 'Categories'
                      : 'الفئات',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: onBoardingCubit.get(context).langMode
                      ? 'Favorite'
                      : 'المفضلة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: onBoardingCubit.get(context).langMode
                      ? 'Setting'
                      : 'الإعدادات',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
