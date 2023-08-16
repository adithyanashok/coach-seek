import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneSignin extends StatefulWidget {
  PhoneSignin({super.key});

  @override
  State<PhoneSignin> createState() => _PhoneSigninState();
}

class _PhoneSigninState extends State<PhoneSignin> {
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void phoneSignin() {
    FireBaseAuthClass().linkPhoneNumberToEmailAccount(
        context: context, otp: '111111', phoneNumber: phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Phone Signin"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(hintText: "Enter Phone"),
              ),
            ),
            buildSignupButton(
              buttonName: "Submit",
              buttonColor: "blue",
              top: 50,
              func: () {
                phoneSignin();
              },
            )
          ],
        ),
      ),
    );
  }
}
