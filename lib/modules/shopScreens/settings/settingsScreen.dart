import 'package:flutter/material.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          cacheHelper
              .setData(
            key: 'token',
            value: '',
          )
              .then((value) {
            Token = cacheHelper.getData(
              key: 'token',
            );
          }).then((value) {
            shopCubit.get(context).index = 0;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => logInScreen()),
            );
          });
        },
        icon: Icon(Icons.login),
      ),
    );
  }
}
