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

Widget buildTextFormField(
    {required String hintText,
    required String type,
    required IconData iconName,
    Function(String value)? func}) {
  return Container(
    width: 325,
    height: 50,
    margin: const EdgeInsets.only(
      left: 30,
      right: 30,
    ),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(40),
      ),
      border: Border.all(color: AppColors.lightbluecolor),
    ),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          child: Icon(
            iconName,
            color: AppColors.lightbluecolor,
          ),
        ),
        Container(
          width: 270,
          height: type == "desc" ? 100 : 50,
          child: TextField(
            onChanged: (value) {
              func!(value);
            },
            cursorColor: AppColors.lightbluecolor,
            keyboardType:
                type == "phone" ? TextInputType.phone : TextInputType.multiline,
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
                color: AppColors.greycolor,
              ),
            ),
            style: TextStyle(
              color: AppColors.blackColor,
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
