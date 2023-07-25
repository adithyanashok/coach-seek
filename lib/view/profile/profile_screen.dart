// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
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
    UserDb().getExperience(userId);
    return StreamBuilder(
      stream: UserDb().getAUser(userId!),
      builder: (context, snapshot) {
        log("$snapshot");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Text('User data not found');
        } else {
          final data = snapshot.data;
          log(data.toString());
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
                  //<------------------This widget is used for profile screen header portion----------->
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
                      data: data),
                  aboutMeContainer(text: "${data['desc']}"),
                  //<-------------This widget is used for experience box--------------->
                  experienceContainer(context)
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
