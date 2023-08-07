import 'package:flutter/material.dart';

import '../core/colors.dart';

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
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      // automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.lightbluecolor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(37),
          bottomRight: Radius.circular(37),
        ),
      ),
    );
  }
}
