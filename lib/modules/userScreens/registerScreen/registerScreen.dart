import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/userScreens/loginScreen/logInScreen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerCubit.dart';
import 'package:shop_app/shared/cubit/registerCubit/registerStatus.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    registerCubit cubit = registerCubit.get(context);
    return BlocConsumer<registerCubit, registerStates>(
      listener: (BuildContext context, registerStates state) {
        if (state is registerSuccessState) {
          if (cubit.register_model.status) {
            Fluttertoast.showToast(
              msg: cubit.register_model.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: onBoardingCubit.get(context).lightMode
                  ? Colors.white
                  : Colors.black,
              fontSize: 16.0,
            );
            cubit.emailController.text = '';
            cubit.nameController.text = '';
            cubit.passwordController.text = '';
            cubit.phoneController.text = '';
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => logInScreen()),
            );
          } else {
            Fluttertoast.showToast(
              msg: cubit.register_model.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: onBoardingCubit.get(context).lightMode
                  ? Colors.white
                  : Colors.black,
              fontSize: 16.0,
            );
          }
        }
      },
      builder: (BuildContext context, registerStates state) {
        return Directionality(
      textDirection: onBoardingCubit.get(context).langMode ? TextDirection.ltr:TextDirection.rtl,
          child: Scaffold(
            body:Center(
              child: Container(
                 color: onBoardingCubit.get(context).lightMode? Colors.white:Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeInDown(
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 1500),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 onBoardingCubit.get(context).langMode?
                                      Text(                                      
                                        'Dynamo',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ):
                                      Text(                                      
                                        'متجر',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      sizeBoxW(10),
                                      onBoardingCubit.get(context).langMode?
                                      Text(
                                        'Store',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ):
                                      Text(
                                        'دينامو',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onBoardingCubit.get(context).langMode?
                                  Text(
                                    'SignUp now to browse our hot offers.',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      // color: onBoardingCubit.get(context).darkMode? Colors.white:Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ):
                                   Text(
                                    'اشترك الآن لتصفح عروضنا المثيرة.',
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
                            controller: cubit.nameController,
                            textInputType: TextInputType.text,
                            labelText:onBoardingCubit.get(context).langMode? "Name": "الاسم",
                            prefixIcon: (Icons.person),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode? 'Name must\'n be empty ':"لا يجب أن يكون الاسم فارغا ";
                              }
                            },
                          ),
                        ),
                        sizeBoxH(20),
                        FadeInLeft(
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 1500),
                          child: textFormField(
                            context: context,
                            controller: cubit.emailController,
                            textInputType: TextInputType.emailAddress,
                            labelText: onBoardingCubit.get(context).langMode? "Email Address":"عنوان البريد الإلكتروني",
                            prefixIcon:(Icons.email_outlined),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode? 'email must\'n be empty ':"لا يجب أن يكون عنوان البريد الإلكتروني فارغا ";
                              }
                              return null;
                            },
                          ),
                        ),
                        sizeBoxH(20),
                        FadeInRight(
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 1500),
                          child: textFormField(
                            context: context,
                            controller: cubit.phoneController,
                            textInputType: TextInputType.phone,
                            labelText: onBoardingCubit.get(context).langMode? "Phone":"رقم الهاتف",
                            prefixIcon:(Icons.phone),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return onBoardingCubit.get(context).langMode? 'phone must\'n be empty ':"لا يجب أن يكون رقم الهاتف فارغا ";
                              }
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
                            labelText:onBoardingCubit.get(context).langMode? "Password":"كلمة السر",
                            prefixIcon:(Icons.lock),
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
                                return onBoardingCubit.get(context).langMode? 'password must\'n be empty ':"لا يجب أن تكون كلمة السر فارغة ";
                              }
                            },
                          ),
                        ),
                        sizeBoxH(20),
                        FadeInUp(
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 1500),
                          child: state is! registerLoadingState
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: defaultButton(
                                    function: () {
                                      if (cubit.formKey.currentState!
                                          .validate()) {
                                        cubit.userRegister(
                                          context: context,
                                          name: cubit.nameController.text,
                                          phone: cubit.phoneController.text,
                                          email: cubit.emailController.text,
                                          password:
                                              cubit.passwordController.text,
                                        );
                                      }
                                    },
                                    widget:onBoardingCubit.get(context).langMode? Text("SignUp"): Text("اشترك الان"),
                                  ),
                                )
                              : Center(child: CircularProgressIndicator(
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
                              onBoardingCubit.get(context).langMode?
                              Text("you have have an account?"):
                              Text("لديك حساب بالفعل؟"),
                              TextButton(
                                  onPressed: () {
                                    cubit.emailController.text = '';
                                    cubit.nameController.text = '';
                                    cubit.passwordController.text = '';
                                    cubit.phoneController.text = '';
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               logInScreen()),
                                    );
                                  },
                                  child:
                                  onBoardingCubit.get(context).langMode?
                                  Text(
                                    'SignIn now',
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ):
                                  Text(
                                    'سجل الدخول الان',
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
