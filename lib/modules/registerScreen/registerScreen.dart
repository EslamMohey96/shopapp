import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerCubit.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerStatus.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<registerCubit, registerStatus>(
      listener: (BuildContext context, registerStatus state) {},
      builder: (BuildContext context, registerStatus state) {
        return Scaffold(
          appBar: AppBar(),
        );
      },
    );
  }
}
