import 'package:flutter/material.dart';

import '../widgets/app_bar_widgets.dart';
import '../widgets/signin_image.dart';
import '../widgets/signup_button.dart';
import '../widgets/text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: "Sign up"),
        ),

        //<----------------------body--------------------->//
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //<-----------------------Image--------------------->//
              buildLoginImage(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //<----------------Email text form field------------------>
                  buildTextFieldLabel(title: "Name"),
                  buildTextFormField(
                    hintText: "Enter your name",
                    type: "name",
                    iconName: const Icon(Icons.person),
                  ),
                  buildTextFieldLabel(title: "Email"),
                  buildTextFormField(
                    hintText: "Enter your email",
                    type: "email",
                    iconName: const Icon(Icons.email),
                  ),
                  //<----------------------password text form field------------>
                  buildTextFieldLabel(title: "Password"),
                  buildTextFormField(
                    hintText: "Enter your password",
                    type: "password",
                    iconName: const Icon(Icons.lock),
                  ),
                  buildSignupButton(buttonName: "Sign Up", buttonType: "signup")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
