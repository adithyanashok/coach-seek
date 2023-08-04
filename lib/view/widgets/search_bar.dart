import 'package:flutter/material.dart';
import '../core/colors.dart';

// Search bar widget
Widget buildSearchBar({
  required Function(String value) func,
  required Function() onClick,
}) {
  return Container(
    width: double.infinity,
    height: 50,
    margin: const EdgeInsets.only(
      left: 15,
      right: 15,
      top: 15,
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
        // Text field for user input
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            onChanged: (value) {
              func(value);
            },
            cursorColor: AppColors.lightbluecolor,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: "Search top coaches...", // Placeholder text
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
                color: AppColors.greycolor, // Hint text color
              ),
            ),
            style: TextStyle(
              color: AppColors.blackColor, // Text color
              fontFamily: "Avenir",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        // Icon button for search
        GestureDetector(
          onTap: () {
            onClick();
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              Icons.search,
              color: AppColors.lightbluecolor, // Search icon color
            ),
          ),
        ),
      ],
    ),
  );
}
