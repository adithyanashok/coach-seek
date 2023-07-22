import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //<--------------------AppBar----------------------->
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBarWidget(title: "Stephen Fleming"),
        ),
        //<------------------body: Row------------------------>
        body: ProfileHead(
          status: "Not Available",
          imageurl: "assets/images/coach.jpg",
          coachName: "Stephen Fleming",
          coachRole: "Head Coach",
          coachLocation: "Bangalore",
          amount: 50,
        ));
  }
}
