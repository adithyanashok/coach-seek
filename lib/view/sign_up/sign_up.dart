import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/services/firebase_sign_up_method.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              buildLoginImage(imageName: "signup-image"),
              buildSubHeadings(text: "Create an account to\ncontinue"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //<----------------Name text form field------------------>

                  buildTextFieldLabel(title: "Name"),
                  buildTextFormField(
                    hintText: "Enter your name",
                    type: "name",
                    iconName: Icons.person_outlined,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.nameEvent(value));
                    },
                  ),
                  //<----------------Email text form field------------------>

                  buildTextFieldLabel(title: "Email"),
                  buildTextFormField(
                    hintText: "Enter your email",
                    type: "email",
                    iconName: Icons.email_outlined,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.emailEvent(value));
                    },
                  ),
                  //<----------------------password text form field------------>
                  buildTextFieldLabel(title: "Password"),
                  buildTextFormField(
                    hintText: "Enter your password",
                    type: "password",
                    iconName: Icons.lock_outline,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.passwordEvent(value));
                    },
                  ),
                  //<----------------Phone text form field------------------>

                  buildTextFieldLabel(title: "Phone"),
                  buildTextFormField(
                    hintText: "Enter your phone number",
                    type: "phone",
                    iconName: Icons.phone,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.phoneEvent(value));
                    },
                  ),
                  //<----------------Role text form field------------------>

                  buildTextFieldLabel(title: "Role"),
                  buildTextFormField(
                    hintText: "eg: batting coach",
                    type: "text",
                    iconName: Icons.person_pin,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.roleEvent(value));
                    },
                  ),
                  //<----------------Location text form field------------------>

                  buildTextFieldLabel(title: "Location"),
                  buildTextFormField(
                    hintText: "eg: Bangalore",
                    type: "text",
                    iconName: Icons.location_on_outlined,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.locationEvent(value));
                    },
                  ),
                  //<----------------Amount text form field------------------>

                  buildTextFieldLabel(title: "Amount"),
                  buildTextFormField(
                    hintText: "Amount per hour",
                    type: "text",
                    iconName: Icons.attach_money_outlined,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.amountEvent(value));
                    },
                  ),
                  //<----------------About text form field------------------>

                  buildTextFieldLabel(title: "About"),
                  buildTextAreaFormField(
                    hintText: "Write something about you...",
                    type: "desc",
                    // iconName: Icons.text_fields,
                    func: (value) {
                      context
                          .read<SignUpBloc>()
                          .add(SignUpEvent.descEvent(value));
                    },
                  ),

                  buildSignupButton(
                    buttonName: "Sign Up",
                    buttonType: "signup",
                    onBoardingbutton: "signin",
                    value: 40,
                    func: () {
                      FirebaseSignUpMethod(context).handleSignUp();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
