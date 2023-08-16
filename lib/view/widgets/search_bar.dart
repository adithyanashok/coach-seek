import 'package:flutter/material.dart';
import '../core/colors.dart'; // Importing the color constants

// Search bar widget
Widget buildSearchBar({
  required Function(String value) func, // Function to handle input changes
  required Function() onClick, // Function to handle search button click
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
      color: AppColors.whiteColor, // Background color
      borderRadius: const BorderRadius.all(
        Radius.circular(40), // Border radius
      ),
      border: Border.all(color: AppColors.lightbluecolor), // Border color
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Text field for user input
        SizedBox(
          width: 300,
          height: 50,
          child: TextField(
            onChanged: (value) {
              func(value); // Calling the provided function with the input value
            },
            cursorColor: AppColors.lightbluecolor, // Cursor color
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
            onClick(); // Calling the provided function when the search icon is clicked
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
