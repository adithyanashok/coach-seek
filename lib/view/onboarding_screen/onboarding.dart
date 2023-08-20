import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/widgets/signin_image.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_bar_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //<-----------Appbar----------------->
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Welcome",
          ),
        ),
        //<-------------------------column------------------------->
        body: SingleChildScrollView(
          child: Column(
            children: [
              //<--------------------------Image--------------------->
              buildLoginImage(imageName: "onboarding-image"),
              //<-----------------------contnainer--------------------->
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 120,
                //<---------------------------Column----------------------->
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //<---------------------Container(Heading CoachSeek)------------------------>
                      Container(
                        child: Text(
                          "CoachSeek",
                          style: GoogleFonts.bakbakOne(
                            textStyle: TextStyle(
                              fontFamily: "bakbak one",
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightbluecolor,
                            ),
                          ),
                        ),
                      ),
                      //<-----------------------------Container(Sub Heading)---------------->>
                      Text(
                        "Find and Hire Cricket Coaches\nNear You",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontFamily: "bakbak one",
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightbluecolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  buildSignupButton(
                      buttonName: "Sign In",
                      buttonColor: "blue",
                      top: 80,
                      func: () {
                        Navigator.of(context).pushNamed("signin");
                      }),
                  buildSignupButton(
                    buttonName: "signup as coach",
                    buttonColor: "white",
                    top: 20,
                    func: () {
                      Navigator.of(context).pushNamed("signup");
                    },
                  ),
                  buildSignupButton(
                    buttonName: "signup as recruiter",
                    buttonColor: "white",
                    top: 20,
                    func: () {
                      Navigator.of(context)
                          .pushNamed("user-signup", arguments: "user");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
