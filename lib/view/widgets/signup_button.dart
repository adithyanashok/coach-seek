import 'package:flutter/material.dart';

import '../core/colors.dart';

// <-------------Signin button------------------->
Widget buildSignupButton(
    {required String buttonName,
    required String buttonType,
    String? onBoardingbutton,
    required double value,
    Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 350,
      height: 48,
      margin: EdgeInsets.only(
          //buttonType == "signin" ? 200 : 120
          left: 40,
          right: 40,
          top: value),
      decoration: BoxDecoration(
        color: onBoardingbutton == "signin"
            ? AppColors.lightbluecolor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: onBoardingbutton == "signin"
              ? Colors.transparent
              : AppColors.lightbluecolor,
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 21,
            color: onBoardingbutton == "signin"
                ? AppColors.whiteColor
                : AppColors.lightbluecolor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
