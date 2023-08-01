import 'package:flutter/material.dart';
import '../core/colors.dart';

// Signin button widget
Widget buildSignupButton({
  required String buttonName,
  required String buttonColor,
  required double top,
  Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 350,
      height: 48,
      margin: EdgeInsets.only(left: 40, right: 40, top: top),
      decoration: BoxDecoration(
        // Apply color based on the buttonColor parameter.
        color: buttonColor == "blue"
            ? AppColors.lightbluecolor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          // If the buttonColor is not "blue", show a transparent border.
          color: buttonColor == "blue"
              ? Colors.transparent
              : AppColors.lightbluecolor,
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 21,
            // Apply text color based on the buttonColor parameter.
            color: buttonColor == "blue"
                ? AppColors.whiteColor
                : AppColors.lightbluecolor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}
