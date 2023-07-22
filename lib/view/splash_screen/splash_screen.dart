import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    log("$user");
    Future.delayed(const Duration(seconds: 5), () {
      if (user != null) {
        Navigator.of(context).pushNamed("home");
      } else {
        Navigator.of(context).pushNamed("signin");
      }
    });

    return const Scaffold(
      body: SafeArea(
        child: Text("Welcome this is splash screen"),
      ),
    );
  }
}
