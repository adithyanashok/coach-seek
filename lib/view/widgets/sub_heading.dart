import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';

Widget buildSubHeadings(
    {required String text, double left = 30, double top = 0}) {
  return Container(
    margin: EdgeInsets.only(left: left, bottom: 10, top: top),
    width: double.infinity,
    child: Text(
      text,
      style: GoogleFonts.bakbakOne(
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.textBlueColor,
        ),
      ),
    ),
  );
}
