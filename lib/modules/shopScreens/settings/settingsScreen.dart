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
        return cubit.UpdateDone == 0
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
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
                          if (cubit.UpdateDone == 2)
                            LinearProgressIndicator(
                              color: Colors.red,
                            ),
                          sizeBoxH(10),
                          textFormField(
                            context: context,
                            controller: cubit.userNameController,
                            textInputType: TextInputType.text,
                            labelText: onBoardingCubit.get(context).langMode
                                ? "Name"
                                : "الاسم",
                            prefixIcon: (Icons.person),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode
                                    ? 'User Name must\'n be empty '
                                    : "لا يجب أن يكون الاسم فارغا ";
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context: context,
                            controller: cubit.emailController,
                            textInputType: TextInputType.emailAddress,
                            labelText: onBoardingCubit.get(context).langMode
                                ? "Email Address"
                                : "عنوان البريد الإلكتروني",
                            prefixIcon: (Icons.email_outlined),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode
                                    ? 'email must\'n be empty '
                                    : "لا يجب أن يكون عنوان البريد الإلكتروني فارغا ";
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context: context,
                            controller: cubit.phoneController,
                            textInputType: TextInputType.phone,
                            labelText: onBoardingCubit.get(context).langMode
                                ? "phone number"
                                : "رقم الهاتف",
                            prefixIcon: (Icons.phone),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode
                                    ? 'phone number must\'n be empty '
                                    : "لا يجب أن يكون رقم الهاتف فارغا ";
                              }
                              return null;
                            },
                          ),
                          sizeBoxH(10),
                          textFormField(
                            context: context,
                            controller: cubit.passwordController1,
                            textInputType: TextInputType.visiblePassword,
                            visible: !cubit.visiblePassword1,
                            labelText: onBoardingCubit.get(context).langMode
                                ? "Password"
                                : "كلمة السر",
                            prefixIcon: (Icons.lock),
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
                                return onBoardingCubit.get(context).langMode
                                    ? 'password must\'n be empty '
                                    : "لا يجب أن تكون كلمة السر فارغة ";
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
                                if (cubit.settingFormKey.currentState!
                                        .validate() &&
                                    cubit.passwordController1.text ==
                                        cacheHelper.getData(key: 'password')) {
                                  cubit.updateUserData({
                                    'name': cubit.userNameController.text,
                                    'phone': cubit.phoneController.text,
                                    'email': cubit.emailController.text,
                                    'password': cubit.passwordController1.text,
                                  }, context);
                                } else {
                                  Fluttertoast.showToast(
                                    msg: onBoardingCubit.get(context).langMode
                                        ? "Invalid Password"
                                        : "كلمة المرور غير صالحة",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 5,
                                    backgroundColor: Colors.red,
                                    textColor:
                                        onBoardingCubit.get(context).lightMode
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 16.0,
                                  );
                                }
                              },
                              child: onBoardingCubit.get(context).langMode
                                  ? Text(
                                      "Save",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    )
                                  : Text(
                                      "حفظ",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                            ),
                          ),
                          sizeBoxH(50),
                          IconButton(
                            onPressed: () {
                              onBoardingCubit.get(context).changeLightMode();
                            },
                            icon: Icon(
                              Icons.brightness_6_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              onBoardingCubit.get(context).changeLangMode();
                              cubit
                                ..getCategoriesData()
                                ..getHomeData()
                                ..IsFavoritesData()
                                ..getUserData();
                            },
                            icon: Icon(
                              Icons.language,
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
                                cacheHelper.setData(key: 'password', value: "");
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
