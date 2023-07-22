import 'package:flutter/material.dart';

Widget buildLoginImage({required String imageName}) {
  return Image.asset(
    "assets/images/$imageName.png",
    // fit: BoxFit.fill,
    width: double.infinity,
    height: 300,
  );
}
