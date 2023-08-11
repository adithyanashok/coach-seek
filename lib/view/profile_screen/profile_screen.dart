import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/functions/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/database/functions/user/user.dart';
import 'package:coach_seek/database/model/proficient_tag/proficient_tag.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/profile/proficient_tag.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';
import 'package:coach_seek/view/widgets/text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String?;
    TagModel tagModel =
        TagModel(userId: id ?? currentUserId!, text: "", id: "");

    return StreamBuilder(
      stream: UserDb().getAUser(id ?? currentUserId!),
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
          final status = data!['available'];
          final recruterId = data['recruterId'];
          final amount = data['amount'];
          final name = data['name'];
          final role = data['role'];
          final location = data['location'];
          final userId = data['userId'];
          final profileImg = data['profileImg'];
          final desc = data['desc'];
          final phone = data['phone'];
          final email = data['email'];

          // Update user state in AuthBloc
          context.read<AuthBloc>().add(AuthEvent.signInEvent(user: data));

          return Scaffold(
            //<--------------------AppBar----------------------->
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: AppBarWidget(title: name),
            ),
            //<------------------body: Row------------------------>
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //<------------------This widget is used for the profile screen header portion----------->
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
                    recruterId: recruterId,
                    docId: userId,
                  ),

                  // This widget is used to display the "About Me" section
                  aboutMeContainer(text: desc),
                  //<-------------This widget is used for the experience box--------------->
                  experienceContainer(
                    context,
                    userId: userId,
                    currentUserId: currentUserId,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        currentUserId == userId
                            ? Row(
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
                                  )
                                ],
                              )
                            : const SizedBox(),
                        proficientTags(
                          context,
                          currentUserId: currentUserId,
                          id: userId,
                        ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
