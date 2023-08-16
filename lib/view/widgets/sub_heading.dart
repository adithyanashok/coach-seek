import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importing the required package
import '../core/colors.dart'; // Importing the color constants

// Function to build subheadings with specified text, left margin, and top margin
Widget buildSubHeadings({
  required String text, // The text for the subheading
  double left = 30, // Left margin, default is 30
  double top = 0, // Top margin, default is 0
}) {
  return Container(
    margin: EdgeInsets.only(
        left: left, bottom: 10, top: top), // Margin for the container
    width: double
        .infinity, // Make the container's width take up the full available space
    child: Text(
      text, // The provided text
      style: GoogleFonts.bakbakOne(
        textStyle: TextStyle(
          fontSize: 24, // Font size
          fontWeight: FontWeight.w400, // Font weight
          color: AppColors.textBlueColor, // Text color from the imported colors
        ),
      ),
    ),
  );
}
