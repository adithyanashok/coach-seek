import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';
import 'package:coach_seek/services/firebase_sign_in_method.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar_widgets.dart';
import '../widgets/signin_image.dart';
import '../widgets/text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, this.email, this.password});
  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).state;
    return SafeArea(
      child: Scaffold(
        //<-----------AppBar----------------->//
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Sign In",
          ),
        ),
        //<----------------------body--------------------->//
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.loading == true
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //<-----------------------Image--------------------->//
                        buildLoginImage(imageName: "signup-image"),
                        buildSubHeadings(text: "Sign in to your\naccount"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //<----------------Email text form field------------------>
                            buildTextFieldLabel(title: "Email"),
                            buildTextFormField(
                              hintText: "Enter your email",
                              type: "email",
                              iconName: Icons.email_outlined,
                              func: (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(EmailEvent(email: value));
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
                                    .read<SignInBloc>()
                                    .add(PasswordEvent(passWord: value));
                              },
                            ),
                            buildSignupButton(
                              buttonName: "Sign In",
                              buttonType: "signin",
                              onBoardingbutton: "signin",
                              value: 130,
                              func: () {
                                FirabaseSignInMethod(context)
                                    .signInHandle("email");
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
