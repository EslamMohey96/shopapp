import 'package:flutter/material.dart';
import 'package:shop_app/shared/cubit/onBoardingCubit/onBoardingCubit.dart';
import 'package:shop_app/shared/cubit/shopCubit/shopCubit.dart';

//defaultButton
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.red,
  required Function() function,
  required Widget widget,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: widget,
      ),
    );
// sizeBoxHWidget
Widget sizeBoxH(double x) => SizedBox(
      height: x,
    );
// sizeBoxWWidget
Widget sizeBoxW(double x) => SizedBox(
      width: x,
    );
// textFormField
Widget textFormField({
  var context,
  required TextEditingController controller,
  required TextInputType textInputType,
  required String labelText,
  required IconData prefixIcon,
  required String? Function(String?)? valid,
  bool visible = false,
  bool isClickable = true,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function(String?)? onSubmit,
  Function(String?)? onChange,
  Function()? ontap,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: visible,
      onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      validator: valid,
      onTap: ontap,
      onChanged: onChange,
      
      enabled: isClickable,
      cursorColor: Colors.black,
      style: TextStyle(
        color: onBoardingCubit.get(context).lightMode
            ? Colors.black
            : Colors.white,
          
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:  TextStyle(          
          // textDirection: TextDirection.rtl,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
          ),
          onPressed: suffixPressed,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: const OutlineInputBorder(),
      ),
    );
