import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:coach_seek/controller/db/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';

final userId = FirebaseAuth.instance.currentUser!.uid;

Widget proficientTags(context, {currentUserId, id}) {
  return StreamBuilder(
    stream: ProficientTag.getTag(userId: id),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While waiting for data, display a CircularProgressIndicator.
        return Center(
          child: circleLoadingWidget(),
        );
      } else if (snapshot.hasError) {
        // If there is an error while loading data, display an error message.
        return const Center(
          child: Text("Error while loading data"),
          // List<TagModel> tagModels = snapshot.data; // Assuming TagModel is the type you're expecting in the List
        );
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        // If there is no data or the data is empty, display a message indicating "No Datas."

        return const Center(
          child: Text(
            "No Datas",
            style: TextStyle(
                color: Colors
                    .white), // Assuming AppColors.whiteColor is Colors.white
          ),
        );
      } else {
        // If there is data, display the list of tags in a horizontal ListView.
        final data = snapshot.data;
        return Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 10,
            right: 30,
            left: 30,
          ),
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 30, right: 30),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Use the profileActionButton widget to create each item in the ListView.
              return GestureDetector(
                onLongPress: () {
                  currentUserId == id
                      ? showDeleteConfirmationDialog(
                          context: context,
                          userId: data[index].id,
                          methodFor: "delete-tag")
                      : "";
                },
                child: profileActionButton(
                  text: data[index].text,
                  color: AppColors
                      .textBlueColor, // Assuming AppColors.textBlueColor is Colors.blue
                  width: 100,
                  // height: 30,
                ),
              );
            },
            separatorBuilder: (context, index) {
              // Add some spacing between items in the ListView.
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: data!.length,
          ),
        );
      }
    },
  );
}
