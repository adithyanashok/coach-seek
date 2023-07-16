// Text form field label //
import 'dart:ui';
import 'package:flutter/material.dart';

import '../core/colors.dart';

Widget buildTextFieldLabel({required String title}) {
  return Container(
    margin: const EdgeInsets.only(left: 30, top: 10),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    ),
  );
}

// Text Form Field method ///

Container buildTextFormField(
    {required String hintText, required String type, required Icon iconName}) {
  return Container(
    width: 325,
    height: 50,
    margin: const EdgeInsets.only(
      left: 30,
      right: 30,
    ),
    decoration: BoxDecoration(
      color: AppColors.WhiteColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      border: Border.all(color: AppColors.BlackColor),
    ),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          child: iconName,
        ),
        Container(
          width: 270,
          height: 50,
          child: TextField(
            cursorColor: AppColors.BlackColor,
            keyboardType: TextInputType.multiline,
            obscureText: type == "password" ? true : false,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: TextStyle(
                color: AppColors.BlackColor,
              ),
            ),
            style: TextStyle(
              color: AppColors.BlackColor,
              fontFamily: "Avenir",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    ),
  );
}
