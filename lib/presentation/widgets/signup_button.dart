import 'package:flutter/material.dart';

import '../core/colors.dart';

// <-------------Signin button------------------->
Widget buildSignupButton({required String buttonName}) {
  return Container(
    width: 350,
    height: 60,
    margin: const EdgeInsets.only(left: 40, right: 40, top: 200),
    decoration: BoxDecoration(
      color: AppColors.BlueColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 21,
          color: AppColors.WhiteColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
