import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class settingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    shopCubit cubit = shopCubit.get(context);
    return BlocConsumer<shopCubit, shopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return cubit.UpdateDone==0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
              child: SingleChildScrollView(
                child: Form(
                    key: cubit.settingFormKey,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(                            
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(state is updateUserLoadingState)
                          LinearProgressIndicator(),
                          sizeBoxH(10),
                          textFormField(
                            context:context ,
                            controller: cubit.userNameController,
                            textInputType: TextInputType.text,
                            labelText: "User Name",
                            prefixIcon: Icon(Icons.person),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'User Name must\'n be empty ';
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context:context ,
                            controller: cubit.emailController,
                            textInputType: TextInputType.emailAddress,
                            labelText: "Email Address",
                            prefixIcon: Icon(Icons.email_outlined),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'email must\'n be empty ';
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context:context ,
                            controller: cubit.phoneController,
                            textInputType: TextInputType.phone,
                            labelText: "phone number",
                            prefixIcon: Icon(Icons.phone),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'phone number must\'n be empty ';
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context:context ,
                            controller: cubit.passwordController1,
                            textInputType: TextInputType.visiblePassword,
                            visible: !cubit.visiblePassword1,
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: cubit.visiblePassword1
                                ? Icons.visibility_sharp
                                : Icons.visibility_off_sharp,
                            suffixPressed: () {
                              print(cubit.visiblePassword1);
                              cubit.changeVisiblePassword1(
                                  !cubit.visiblePassword1);
                              print(cubit.visiblePassword1);
                            },
                            valid: (value) {
                              if (value!.isEmpty) {
                                return 'password must\'n be empty ';
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {
                                if (cubit.settingFormKey.currentState!.validate() &&
                                    cubit.passwordController1.text ==
                                        myLoginCubit
                                            .get(context)
                                            .passwordController
                                            .text) {
                                  cubit.updateUserData({
                                    'name': cubit.userNameController.text,
                                    'phone': cubit.phoneController.text,
                                    'email': cubit.emailController.text,
                                    'password': cubit.passwordController1.text,
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Invalid Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              },
                              child: Text(
                                "Save",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                          ),
                          sizeBoxH(50),
                          IconButton(
                            onPressed: () {
                              onBoardingCubit.get(context).changeDarkMode();
                            },
                            icon: Icon(
                              Icons.brightness_6_outlined,
                            ),
                          ),
                          IconButton(
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
                                cubit.settingFormKey.currentState?.reset();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => logInScreen()),
                                );
                              });
                            },
                            icon: Icon(Icons.login),
                          ),
                          sizeBoxH(30),
                        ],
                      ),
                    ),
                  ),
              ),
            );
      },
    );
  }
}
