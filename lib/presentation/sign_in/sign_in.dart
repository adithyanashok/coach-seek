import 'package:coach_seek/presentation/core/colors.dart';
import 'package:coach_seek/presentation/widgets/signup_button.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widgets.dart';
import '../widgets/text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //<-----------AppBar----------------->//
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: "Sign In"),
        ),
        //<----------------------body--------------------->//
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //<-----------------------Image--------------------->//
              Image.asset(
                "assets/images/signin_image.png",
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //<----------------Email text form field------------------>
                  buildTextFieldLabel(title: "Email"),
                  buildTextFormField(
                    hintText: "Enter your email",
                    type: "email",
                    iconName: const Icon(Icons.person),
                  ),
                  //<----------------------password text form field------------>
                  buildTextFieldLabel(title: "Password"),
                  buildTextFormField(
                    hintText: "Enter your password",
                    type: "password",
                    iconName: const Icon(Icons.lock),
                  ),
                  buildSignupButton(buttonName: "Sign In")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
