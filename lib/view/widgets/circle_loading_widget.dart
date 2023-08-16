import 'package:coach_seek/view/core/colors.dart';
import 'package:flutter/material.dart';

// Loading widget with a circular shape and centered content
Widget circleLoadingWidget() {
  return Center(
    child: Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.textBlueColor, // Background color
        borderRadius: BorderRadius.circular(10), // Circular border radius
      ),
      padding: const EdgeInsets.all(30), // Padding inside the container
      child: CircularProgressIndicator(
        backgroundColor: AppColors
            .lightbluecolor, // Background color of the CircularProgressIndicator
        color: AppColors.whiteColor, // Color of the CircularProgressIndicator
      ),
    ),
  );
}
