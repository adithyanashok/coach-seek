import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/services/firebase_sign_in_method.dart';
import 'package:coach_seek/view/phone_signin/phone_signin.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar_widgets.dart';
import '../widgets/signin_image.dart';
import '../widgets/text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key, this.email, this.password}) : super(key: key);

  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    // Get the current state of the AuthBloc
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
            return SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return PhoneSignin();
                                      },
                                    ));
                                  },
                                  child: Image.asset(
                                    'assets/icons/phone-icon.png',
                                    width: 40,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    FireBaseAuthClass().googleSignIn(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/google-icon.png',
                                    width: 40,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    FireBaseAuthClass().facebookSignIn(context);
                                  },
                                  child: Image.asset(
                                    'assets/icons/fb-icon.png',
                                    width: 45,
                                  ),
                                ),
                              ],
                            ),
                            buildSignupButton(
                              buttonName: "Sign In",
                              buttonColor: "blue",
                              top: 60,
                              func: () async {
                                // Show loading widget during sign-in process
                                context
                                    .read<AuthBloc>()
                                    .add(const LoadingEvent(loading: true));

                                // Call the sign-in method to handle sign-in with email
                                FirabaseSignInMethod(context)
                                    .signInHandle("email");

                                // Hide loading widget after sign-in process
                                context
                                    .read<AuthBloc>()
                                    .add(const LoadingEvent(loading: false));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Show a circular loading widget if state.loading is true
                  if (state.loading) circleLoadingWidget()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
