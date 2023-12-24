import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shopLayout.dart';
import 'package:shop_app/modules/userScreens/profile/profile.dart';
import 'package:shop_app/modules/userScreens/registerScreen/registerScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginCubit.dart';
import 'package:shop_app/shared/cubit/loginCubit/loginStates.dart';
import 'package:shop_app/shared/network/local/cacheHelper.dart';

class logInScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  // final List<String> images = [
  //   "https://image.ibb.co/k0wVTm/profile_pic.jpg",
  //   "https://image.ibb.co/cA2oOb/alex_1.jpg",
  //   "https://image.ibb.co/gSyTOb/bob_1.jpg",
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<myLoginCubit, myLoginStates>(
      listener: (BuildContext context, myLoginStates state) {
        if (state is loginSuccessState) {
          if (state.login_model.status) {
            cacheHelper
                .setData(
              key: 'token',
              value: state.login_model.data!.token,
            )
                .then((value) {
              Token = cacheHelper.getData(
                key: 'token',
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => shopLayout()),
              );
            });
            print(state.login_model.message);
            print(state.login_model.data?.token);
          } else if (!state.login_model.status) {
            Fluttertoast.showToast(
              msg: state.login_model.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            print(state.login_model.message);
          }
        }
        // else if (state is loginLoadingState) {
        //   myLoginCubit.get(context).changeMassage(mass: "");
        // }
      },
      builder: (BuildContext context, myLoginStates state) {
        myLoginCubit cubit = myLoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
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
                                      const Text(
                                        'Electronic',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      sizeBoxW(10),
                                      const Text(
                                        'Markit',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Login now to browse our hot offers.',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black54,
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
                            ),
                            sizeBoxH(20),
                            FadeInLeft(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: textFormField(
                                controller: cubit.passwordController,
                                textInputType: TextInputType.visiblePassword,
                                visible: !cubit.visiblePassword,
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
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
                                    return 'password must\'n be empty ';
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
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.userLogin(
                                              email: cubit.emailController.text,
                                              password:
                                                  cubit.passwordController.text,
                                            );
                                          }

                                          
                                          // cubit.valid(
                                          //     user: cubit.emailController.text,
                                          //     pass: cubit.passwordController.text);
                                          // if (formKey.currentState!.validate()) {
                                          //   if (cubit.li[0] == "valid") {
                                          //     print("valid ${cubit.li[0]}");

                                          //     cubit.changeMassage(mass: "");
                                          //     Navigator.push(
                                          //         context,
                                          //         MaterialPageRoute(
                                          //             builder: (context) => shopLayout()));
                                          //   } else if (cubit.li[0] == "notPass") {
                                          //     print("notPass ${cubit.li[0]}");

                                          //     cubit.changeMassage(
                                          //         mass: "Invalid Password");
                                          //   }
                                          //   if (cubit.li[0] == "notFound") {
                                          //     print("notFound ${cubit.li[0]}");
                                          //     cubit.changeMassage(mass: "Invalid User");
                                          //   }
                                          //   print(cubit.emailController.text);
                                          //   print(cubit.passwordController.text);
                                          // }
                                        },
                                        widget: (Text("LogIn")),
                                      ),
                                    )
                                  : Center(child: CircularProgressIndicator()),
                            ),
                            sizeBoxH(10),
                            Text(
                              cubit.massage,
                              style: TextStyle(color: Colors.red),
                            ),
                            FadeInUp(
                              delay: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 1500),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("don\'t have an account?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const registerScreen()),
                                        );
                                      },
                                      child: const Text(
                                        'Register Now',
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ))
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
