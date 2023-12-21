import 'package:flutter/material.dart';

//defaultButton
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.teal,
  required Function() function,
  required Widget widget,
}) =>
    Container(
      width: width,
      color: background,
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
  required TextEditingController controller,
  required TextInputType textInputType,
  required String labelText,
  required Icon prefixIcon,
  required String? Function(String?)? valid,
  bool visible = false,
  bool isClickable = true,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function? onSubmit,
  Function? onChange,
  Function()? ontap,
}) =>
    TextFormField(
      // initialValue: passwordController.text,
      controller: controller,
      keyboardType: textInputType,
      obscureText: visible,
      // onFieldSubmitted: onSubmit,
      // onChanged: onChange,
      validator: valid,
      onTap: ontap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: const OutlineInputBorder(),
      ),
    );
