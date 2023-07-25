import 'dart:developer';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/functions/user/user.dart';
import 'package:coach_seek/database/model/experiences.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    ExperienceModel experience = ExperienceModel(userId: user['userId']);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: "Add Experience"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextFieldLabel(title: "Role"),
            buildTextFormField(
              hintText: "Enter your role",
              type: "text",
              iconName: Icons.person_pin,
              func: (value) {
                experience = experience.copyWith(role: value);
              },
            ),
            buildTextFieldLabel(title: "Description"),
            buildTextAreaFormField(
              hintText: "Enter about your experience",
              type: "desc",
              func: (value) {
                log(value);
                experience = experience.copyWith(desc: value);
              },
            ),
            buildSignupButton(
              buttonName: "Done",
              onBoardingbutton: "signin",
              buttonType: "signin",
              value: 50,
              func: () {
                Map<String, dynamic> experienceMap = experience.toJson();
                UserDb().addExperience(experienceMap);
              },
            ),
          ],
        ),
      ),
    );
  }
}
