// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/colors.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  Function()? func;

  AppBarWidget({
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
