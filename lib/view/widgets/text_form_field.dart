import 'package:flutter/material.dart';

import '../core/colors.dart';

Widget buildTextFieldLabel({required String title}) {
  return Container(
    margin: const EdgeInsets.only(left: 30, top: 10),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    ),
  );
}

// Text Form Field method ///

Widget buildTextFormField({
  required String hintText,
  required String type,
  required IconData iconName,
  String value = '',
  required Function(String value) func,
}) {
  final TextEditingController textCtrl = TextEditingController(text: value);
  return Container(
    width: 325,
    height: 50,
    margin: const EdgeInsets.only(
      left: 30,
      right: 30,
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
        SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            iconName,
            color: AppColors.lightbluecolor,
          ),
        ),
        SizedBox(
          width: 270,
          height: type == "desc" ? 100 : 50,
          child: TextField(
            onChanged: (value) {
              func(value);
            },
            cursorColor: AppColors.lightbluecolor,
            controller: textCtrl,
            keyboardType:
                type == "phone" ? TextInputType.phone : TextInputType.multiline,
            obscureText: type == "password" ? true : false,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              hintText: hintText,
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
                color: AppColors.greycolor,
              ),
            ),
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: "Avenir",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    ),
  );
}

// Text Area Field method ///

Widget buildTextAreaFormField(
    {required String hintText,
    required String type,
    IconData? iconName,
    String value = '',
    required Function(String value) func}) {
  final TextEditingController textCtrl = TextEditingController(text: value);

  return Container(
    width: 325,
    // height: 50,
    margin: const EdgeInsets.only(
      left: 30,
      right: 30,
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
        SizedBox(
          width: 320,
          // height: 100,
          child: TextField(
            onChanged: (value) {
              func(value);
            },
            controller: textCtrl,
            cursorColor: AppColors.lightbluecolor,
            maxLines: 5,
            minLines: 4,
            // maxLength: 10,
            keyboardType:
                type == "phone" ? TextInputType.phone : TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
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
                color: AppColors.greycolor,
              ),
            ),
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: "Avenir",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    ),
  );
}
