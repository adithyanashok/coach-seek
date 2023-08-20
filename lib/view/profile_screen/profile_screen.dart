import 'dart:developer';

import 'package:coach_seek/controller/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/model/proficient_tag/proficient_tag.dart';
import 'package:coach_seek/services/firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coach_seek/controller/db/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/controller/db/user/user.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/profile/proficient_tag.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  final currentUserId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    // Get the device width for responsiveness
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double deviceWidth = mediaQuery.size.width;
    log("Width: $deviceWidth");

    final state = context.read<AuthBloc>().state.user;
    final currentUserRecruiterId = state['recruterId'];
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    TagModel tagModel =
        TagModel(userId: id ?? currentUserId!, text: "", id: "");

    return StreamBuilder(
      // Fetch user data using a stream from UserDb
      stream: UserDb().getAUser(id ?? currentUserId!),
      builder: (context, snapshot) {
        // Check the state of the data stream
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error while loading data"));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('User data not found');
        } else {
          // Extract user data from the snapshot
          final data = snapshot.data;
          final status = data!['available'];
          final recruiterId = data['recruterId'];
          final amount = data['amount'];
          final name = data['name'];
          final role = data['role'];
          final location = data['location'];
          final userId = data['userId'];
          final profileImg = data['profileImg'];
          final desc = data['desc'];
          final phone = data['phone'];
          final email = data['email'];
          final isCoach = data['isCoach'];
          final fcmToken = data['fcmToken'];
          log("currentUserRecruterId: $currentUserRecruiterId, currentUserId: $currentUserId, userId: $userId");
          // Update user state in AuthBloc
          context.read<AuthBloc>().add(AuthEvent.signInEvent(user: data));

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: AppBarWidget(title: name),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Display profile header
                  profileHead(
                    status: status,
                    imageurl: "assets/images/coach.jpg",
                    coachName: name,
                    coachRole: role,
                    coachLocation: location,
                    amount: amount,
                    currentUserId: currentUserId!,
                    userId: userId,
                    context: context,
                    data: data,
                    profileImg: profileImg,
                    desc: desc,
                    phone: phone,
                    email: email,
                    recruterId: recruiterId,
                    docId: userId,
                    isCoach: isCoach,
                    fcmToken: fcmToken,
                  ),
                  // Display "About Me" section
                  aboutMeContainer(text: desc, deviceWidth: deviceWidth),
                  // Display "Experience" section for coaches
                  if (isCoach == true)
                    experienceContainer(
                      context,
                      userId: userId,
                      currentUserId: currentUserId,
                      deviceWidth: deviceWidth,
                    ),
                  // Display tags section for coaches
                  if (isCoach == true)
                    SizedBox(
                      width: double.infinity,
                      height: isCoach == true ? 250 : 100,
                      child: Column(
                        children: [
                          // Add cricket aspect tag
                          if (currentUserId == userId)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildTextFormField(
                                  iconName: Icons.sports_cricket_rounded,
                                  hintText: "Your key cricket aspect",
                                  type: "text",
                                  width: 290,
                                  margin: 2,
                                  func: (value) {
                                    tagModel = tagModel.copyWith(text: value);
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ProficientTag.addTag(tagModel);
                                  },
                                  child: profileActionButton(
                                    text: "Add",
                                    color: AppColors.lightbluecolor,
                                    width: 80,
                                    height: 45,
                                  ),
                                ),
                              ],
                            ),
                          // Display proficient tags
                          proficientTags(
                            context,
                            currentUserId: currentUserId,
                            id: userId,
                          ),
                          // Display "Cancel Hiring" button if applicable
                          if (currentUserRecruiterId == userId)
                            buildDangerbutton(
                              context: context,
                              currentUserRecruiterId: currentUserRecruiterId,
                              buttonName: 'Cancel Hiring',
                              onTap: () {
                                showDeleteConfirmationDialog(
                                  context: context,
                                  methodFor: 'delete-hiring',
                                  recruterId: currentUserRecruiterId,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  if (currentUserId == userId)
                    buildDangerbutton(
                      context: context,
                      buttonName: "Signout",
                      onTap: () {
                        FireBaseAuthClass().signOut(context, currentUserId);
                      },
                    )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildDangerbutton(
      {required BuildContext context,
      currentUserRecruiterId,
      required String buttonName,
      Function? onTap}) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: profileActionButton(
          text: buttonName,
          color: Colors.red,
          width: 280,
          height: 40,
        ),
      ),
    );
  }
}
