import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/functions/experiences/experiences.dart';
import 'package:coach_seek/database/model/experience/experiences.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/signup_button.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user data from the AuthBloc state
    final user = context.read<AuthBloc>().state.user;

    // Create an instance of ExperienceModel with the user's ID
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Input field for entering role
            buildTextFormField(
              hintText: "Enter your role",
              type: "text",
              iconName: Icons.person_pin,
              func: (value) {
                // Update the experience model with the entered role
                experience = experience.copyWith(role: value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // Input field for entering description
            buildTextAreaFormField(
              hintText: "Enter about your experience",
              type: "desc",
              func: (value) {
                // Update the experience model with the entered description
                experience = experience.copyWith(desc: value);
              },
            ),
            // Button to save the experience and go back
            buildSignupButton(
              buttonName: "Done",
              buttonColor: "blue",
              top: 50,
              func: () async {
                // Convert the experience model to a map
                Map<String, dynamic> experienceMap = experience.toJson();

                // Add the experience to the database
                await ExperienceDb.addExperience(experienceMap);

                // Close the current screen and go back
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
