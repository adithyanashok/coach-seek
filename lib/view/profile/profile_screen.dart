// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/experience/experience_bloc.dart';
import 'package:coach_seek/database/functions/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  final String? userId;
  const ProfileScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // StreamBuilder to fetch user data from Firebase Firestore
    return StreamBuilder(
      stream: UserDb().getAUser(userId!),
      builder: (context, snapshot) {
        // Check connection state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error while loading data"));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('User data not found');
        } else {
          // Extract user data from snapshot
          final data = snapshot.data;
          // Update user state in AuthBloc
          context.read<AuthBloc>().add(AuthEvent.signInEvent(user: data));

          return Scaffold(
            //<--------------------AppBar----------------------->
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: AppBarWidget(title: "${data!['name']}"),
            ),
            //<------------------body: Row------------------------>
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //<------------------This widget is used for the profile screen header portion----------->
                  profileHead(
                    status: "${data['available']}",
                    imageurl: "assets/images/coach.jpg",
                    coachName: "${data['name']}",
                    coachRole: "${data['role']}",
                    coachLocation: "${data['location']}",
                    amount: "${data['amount']}",
                    currentUserId: "${data['userId']}",
                    userId: userId ?? "${data['userId']}",
                    context: context,
                    data: data,
                    profileImg: "${data['profileImg']}",
                  ),
                  // This widget is used to display the "About Me" section
                  aboutMeContainer(text: "${data['desc']}"),
                  //<-------------This widget is used for the experience box--------------->
                  experienceContainer(context),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
