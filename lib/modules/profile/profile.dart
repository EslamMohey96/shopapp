import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';

class profile extends StatelessWidget {
  late loginModel login_model;

  profile(this.login_model, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<myLoginCubit, myLoginStates>(
      listener: (BuildContext context, myLoginStates state) {},
      builder: (BuildContext context, myLoginStates state) {
        myLoginCubit cubit = myLoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              "Profile",
            ),
          ),
          body: Container(
            width: double.infinity,
            color: Colors.tealAccent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    delay: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 1500),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          NetworkImage("${login_model.data?.image}"),
                    ),
                  ),
                  sizeBoxH(20),
                  FadeInUp(
                      delay: Duration(milliseconds: 300),
                      duration: Duration(milliseconds: 1500),
                      child: Text(
                        "Welcome ${login_model.data?.name}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
