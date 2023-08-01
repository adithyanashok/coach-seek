import 'package:coach_seek/view/core/colors.dart';
import 'package:flutter/material.dart';

Widget circleLoadingWidget() {
  return Center(
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: AppColors.textBlueColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(30),
      child: CircularProgressIndicator(
        backgroundColor: AppColors.lightbluecolor,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
