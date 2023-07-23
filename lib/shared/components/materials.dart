import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/function.dart';

import '../style/colors.dart';

Widget defTextFormField(
        {required TextEditingController controller,
        required TextInputType textType,
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        required String? Function(String)? validate,
        required String? label,
        required IconData? prefix,
        void Function()? onPressedsuffix,
        IconData? suffix,
        void Function()? onTap,
        bool isClickable = true,
        bool isPassword = false,
        context}) =>
    TextFormField(
        controller: controller,
        keyboardType: textType,
        obscureText: isPassword,
        onTap: onTap,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        validator: (value) => validate!(value!),
        enabled: isClickable,
        style: TextStyle(color: Colors.black54, fontSize: 16),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                suffix,
                color: mainColor,
              ),
              onPressed: onPressedsuffix,
            ),
            prefixIcon: Icon(
              prefix,
              size: 30,
              color: mainColor,
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.grey[600], fontSize: 16)));
Widget defaultButton({
  required void Function()? onPressed,
  required String text,
  required Color? color,
}) =>
    ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainColor),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: color),
      ),
    );
Widget registerAsk({context, required Color? color, required Widget widget}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: color),
        ),
        GestureDetector(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Text(
              " Register now",
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            )),
      ],
    );
Widget loginAsk({context, required Color? color, required Widget widget}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Alredy have an account? ",
          style: TextStyle(color: color),
        ),
        GestureDetector(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Text(
              "Login now",
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            )),
      ],
    );
