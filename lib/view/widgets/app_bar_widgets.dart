import 'package:flutter/material.dart';
import '../core/colors.dart'; // Importing the color constants

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title, // The provided title
        style: const TextStyle(
          fontSize: 22, // Font size
          fontWeight: FontWeight.w800, // Font weight
        ),
      ),
      elevation: 0, // No elevation
      backgroundColor: AppColors.lightbluecolor, // Background color
      centerTitle: true, // Center-align the title
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.circular(37), // Border radius for bottom left corner
          bottomRight:
              Radius.circular(37), // Border radius for bottom right corner
        ),
      ),
    );
  }
}
