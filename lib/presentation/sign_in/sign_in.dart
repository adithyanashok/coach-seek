import 'package:coach_seek/presentation/core/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: "Sign In"),
        ),
      ),
    );
  }
}
