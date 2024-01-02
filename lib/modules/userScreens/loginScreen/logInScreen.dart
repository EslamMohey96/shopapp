import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shopLayout.dart';
import 'package:shop_app/modules/userScreens/registerScreen/registerScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class logInScreen extends StatelessWidget {
  // final List<String> images = [
  //   "https://image.ibb.co/k0wVTm/profile_pic.jpg",
  //   "https://image.ibb.co/cA2oOb/alex_1.jpg",
  //   "https://image.ibb.co/gSyTOb/bob_1.jpg",
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<myLoginCubit, myLoginStates>(
      listener: (BuildContext context, myLoginStates state) {
        if (state is changeTokenDoneState) {
          if (myLoginCubit.get(context).login_model.status) {
            Fluttertoast.showToast(
              msg: myLoginCubit.get(context).login_model.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: onBoardingCubit.get(context).lightMode
                  ? Colors.white
                  : Colors.black,
              fontSize: 16.0,
            );
            cacheHelper.setData(
                key: 'password',
                value: myLoginCubit.get(context).passwordController.text);
            myLoginCubit.get(context).emailController.text = '';
            myLoginCubit.get(context).passwordController.text = '';
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => shopLayout()),
            );
            print(myLoginCubit.get(context).login_model.message);
            print(myLoginCubit.get(context).login_model.data?.token);
          } else {
            Fluttertoast.showToast(
              msg: myLoginCubit.get(context).login_model.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: onBoardingCubit.get(context).lightMode
                  ? Colors.white
                  : Colors.black,
              fontSize: 16.0,
            );
            print(myLoginCubit.get(context).login_model.message);
          }
        }
      },
      builder: (BuildContext context, myLoginStates state) {
        myLoginCubit cubit = myLoginCubit.get(context);
        return Directionality(
          textDirection: onBoardingCubit.get(context).langMode
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            body: Container(
              color: onBoardingCubit.get(context).lightMode
                  ? Colors.white
                  : Colors.black,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          children: [
                            FadeInDown(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      onBoardingCubit.get(context).langMode
                                          ? Text(
                                              'Dynamo',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              'متجر',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      sizeBoxW(10),
                                      onBoardingCubit.get(context).langMode
                                          ? Text(
                                              'Store',
                                              style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              'دينامو',
                                              style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ],
                                  ),
                                  onBoardingCubit.get(context).langMode
                                      ? Text(
                                          'Login now to browse our hot offers.',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            // color: onBoardingCubit.get(context).darkMode? Colors.white:Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          'سجل الدخول الآن لتصفح عروضنا المثيرة.',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            // color: onBoardingCubit.get(context).darkMode? Colors.white:Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            sizeBoxH(20),
                            FadeInRight(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: textFormField(
                                context: context,
                                controller: cubit.emailController,
                                textInputType: TextInputType.emailAddress,
                                labelText: onBoardingCubit.get(context).langMode
                                    ? "Email Address"
                                    : "عنوان البريد الإلكتروني",
                                prefixIcon: Icons.email_outlined,
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return onBoardingCubit.get(context).langMode
                                        ? 'email must\'n be empty '
                                        : "لا يمكن أن يكون البريد الإلكتروني فارغا ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            sizeBoxH(20),
                            FadeInLeft(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: textFormField(
                                context: context,
                                controller: cubit.passwordController,
                                textInputType: TextInputType.visiblePassword,
                                visible: !cubit.visiblePassword,
                                labelText: onBoardingCubit.get(context).langMode
                                    ? "Password"
                                    : "كلمة السر",
                                prefixIcon: (Icons.lock),
                                suffixIcon: cubit.visiblePassword
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off_sharp,
                                suffixPressed: () {
                                  print(cubit.visiblePassword);
                                  cubit.changeVisiblePassword(
                                      !cubit.visiblePassword);
                                  print(cubit.visiblePassword);
                                },
                                valid: (value) {
                                  if (value!.isEmpty) {
                                    return onBoardingCubit.get(context).langMode
                                        ? 'password must\'n be empty '
                                        : "لا يمكن أن تكون كلمة السر فارغة ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            sizeBoxH(20),
                            FadeInUp(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: state is! loginLoadingState
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: defaultButton(
                                        function: () {
                                          if (cubit.formKey.currentState!
                                              .validate()) {
                                            cubit.userLogin(
                                              context: context,
                                              email: cubit.emailController.text,
                                              password:
                                                  cubit.passwordController.text,
                                            );
                                          }
                                        },
                                        widget: onBoardingCubit
                                                .get(context)
                                                .langMode
                                            ? Text("LogIn")
                                            : Text("تسجيل الدخول"),
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.red,
                                    )),
                            ),
                            sizeBoxH(10),
                            FadeInUp(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  onBoardingCubit.get(context).langMode
                                      ? Text("don\'t have an account?")
                                      : Text("ليس لديك حساب؟"),
                                  TextButton(
                                    onPressed: () {
                                      cubit.emailController.text = '';
                                      cubit.passwordController.text = '';
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const registerScreen()),
                                      );
                                    },
                                    child: onBoardingCubit.get(context).langMode
                                        ? Text(
                                            'Register Now',
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          )
                                        : Text(
                                            'سجل الآن',
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
