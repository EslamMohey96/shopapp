import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';

class categories extends StatelessWidget {
  const categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        shopCubit cubit = shopCubit.get(context);
        return Scaffold(
          body: Center(
            child: Text(
              // "${cubit.home_model.data.banners[1].product}",
              ''
            ),
          ),
        );
      },
    );
  }
}
