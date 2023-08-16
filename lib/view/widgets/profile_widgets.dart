import 'package:coach_seek/database/functions/experiences/experiences.dart';
import 'package:coach_seek/database/functions/hired_coach/hired_coach.dart';
import 'package:coach_seek/database/functions/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/database/functions/user/user.dart';
import 'package:coach_seek/database/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/services/firebase_notification/firebase_notification.dart';

import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/experience_form/experience_form.dart';
import 'package:coach_seek/view/profile_updating_form/profile_updating_form.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Profile Head Widget
Widget profileHead({
  required bool status,
  required String imageurl,
  required String coachName,
  required String coachRole,
  required String coachLocation,
  required String amount,
  required String userId,
  required String currentUserId,
  required String profileImg,
  required String email,
  required String phone,
  required String desc,
  required String recruterId,
  required String docId,
  required String fcmToken,
  required bool isCoach,
  required context,
  required data,
}) {
  final HiredCoacheModel userModel = HiredCoacheModel(
    name: coachName,
    recruterId: currentUserId,
    email: email,
    role: coachRole,
    location: coachLocation,
    amount: amount,
    desc: desc,
    available: false,
    phone: phone,
    userId: userId,
    profileImg: profileImg,
  );

  void makePhoneCall(phoneNumber) async {
    try {
      final encodedPhoneNumber = Uri.encodeComponent(phoneNumber);
      final phoneUri = Uri(scheme: 'tel', path: encodedPhoneNumber);

      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch $phoneUri';
      }
    } catch (e) {
      print('Error launching phone call: $e');
    }
  }

  // Return the Profile Head layout
  return Column(
    children: [
      // Row for Status Tag and Profile Image with Details
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Tag
          GestureDetector(
            onTap: () async {
              FireBaseAuthClass().signOut(context, currentUserId);
            },
            child: tag(
              color: status != false ? AppColors.greenColor : Colors.red,
              text: status == false ? "Hired" : "Available",
            ),
          ),
          // Column for Profile Image and Other Details
          Column(
            children: [
              // Profile Image
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.network(profileImg),
                ),
              ),
              // Coach Name
              titleWidget(
                text: coachName,
                color: AppColors.lightbluecolor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              // Coach Role
              isCoach == true
                  ? titleWidget(
                      text: coachRole,
                      color: AppColors.lightbluecolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    )
                  : titleWidget(
                      text: email,
                      color: AppColors.lightbluecolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
              // Coach Location
              titleWidget(
                text: coachLocation,
                color: AppColors.greycolor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ],
          ),
          // Price Tag
          isCoach == true
              ? GestureDetector(
                  onTap: () {},
                  child: tag(color: AppColors.lightbluecolor, text: "₹$amount"),
                )
              : tag(color: Colors.transparent, text: ""),
        ],
      ),
      // Action Buttons
      if (currentUserId != userId)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (status == true)
              isCoach == true
                  ? GestureDetector(
                      onTap: () {
                        HiredCoachDb.hireTheCoach(
                            hiredCoacheModel: userModel, fcmToken: fcmToken);
                      },
                      child: profileActionButton(
                        color: Colors.red,
                        text: "Hire",
                      ),
                    )
                  : const SizedBox()
            else
              recruterId == currentUserId
                  ? GestureDetector(
                      onTap: () {
                        showDeleteConfirmationDialog(context, userId,
                            methodFor: 'un-hire');
                      },
                      child: profileActionButton(
                        color: Colors.blue,
                        text: "Unhire",
                      ),
                    )
                  : const SizedBox(),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                makePhoneCall('8281168929');
              },
              child: profileActionButton(
                color: AppColors.greenColor,
                text: "Call Now",
              ),
            ),
          ],
        )
      else
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileUpdatingScreen(
                        data: data,
                      );
                    },
                  ),
                );
              },
              child: profileActionButton(
                color: AppColors.lightbluecolor,
                text: "Edit profile",
              ),
            ),
          ],
        ),
      const SizedBox(
        height: 10,
      ),
      recruterId == currentUserId
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('payment');
              },
              child: profileActionButton(
                color: AppColors.lightbluecolor,
                text: "Pay \$$amount",
              ),
            )
          : const SizedBox(),
    ],
  );
}

// Profile Action Button Widget
Widget profileActionButton({
  required String text,
  required Color color,
  double? width,
  double? height,
}) {
  return Container(
    width: width ?? 140,
    height: height ?? 34,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: color,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
    ),
  );
}

// Title Text Widget
Widget titleWidget({
  required String text,
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: "inter",
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

// Tag Widget
Widget tag({
  required Color color,
  required String text,
  double? width,
  double? height,
  Color? textColor,
  Color? backgroundColor,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 10),
    height: 21,
    width: 77,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: color,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontFamily: "inter",
          fontWeight: FontWeight.w400,
          color: textColor ?? AppColors.whiteColor,
        ),
      ),
    ),
  );
}

// About Me Container Widget
Widget aboutMeContainer({required String text, deviceWidth}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 20),
    width: deviceWidth - 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: AppColors.lightbluecolor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Text for "About me"
        titleWidget(
          text: "About me",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        // Description Text
        titleWidget(
          text: text,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w300,
          fontSize: 15,
        ),
      ],
    ),
  );
}

class ExperienceList extends StatelessWidget {
  final userId;
  final currentUserId;
  const ExperienceList(
      {super.key, required this.userId, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ExperienceDb.getExperience(userId: userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error while loading data"),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Text(
            "No Experience",
            style: TextStyle(color: AppColors.whiteColor),
          ));
        } else {
          final data = snapshot.data;

          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 345,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Role Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleWidget(
                          text: data![index].role!,
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        userId == currentUserId
                            ? IconButton(
                                iconSize: 20,
                                color: AppColors.greenColor,
                                onPressed: () {
                                  // Get the ID of the item from the data list (assuming it exists)
                                  final id = data[index].id!;
                                  // Call the function to show the confirmation dialog before deleting
                                  showDeleteConfirmationDialog(
                                      methodFor: 'delete-experience',
                                      context,
                                      id);
                                },
                                icon: const Icon(Icons.delete),
                              )
                            : const SizedBox()
                      ],
                    ),
                    // Description Text
                    titleWidget(
                      text: data[index].desc ?? "",
                      color: AppColors.greyColor2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        }
      },
    );
  }
}

// Define a custom function to show the confirmation dialog
void showDeleteConfirmationDialog(BuildContext context, String? id,
    {required String? methodFor, String? recruterId}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // The AlertDialog widget displays the confirmation dialog
      return AlertDialog(
        // Title of the dialog
        title: Text(
          'Confirm',
          style: TextStyle(
            color: AppColors.whiteColor, // Custom text color
          ),
        ),

        // Content of the dialog
        content: methodFor == 'un-hire'
            ? Text(
                'Are you sure you want to Unhire?',
                style: TextStyle(
                  color: AppColors.whiteColor, // Custom text color
                  fontSize: 16, // Custom font size
                ),
              )
            : Text(
                'Are you sure you want to delete this item?',
                style: TextStyle(
                  color: AppColors.whiteColor, // Custom text color
                  fontSize: 16, // Custom font size
                ),
              ),

        // Custom background color for the dialog
        backgroundColor: AppColors.lightbluecolor,

        // Custom text style for the title
        titleTextStyle: TextStyle(color: AppColors.whiteColor),

        // Custom shape for the dialog with a border radius of 30
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),

        // Actions to be displayed at the bottom of the dialog
        actions: <Widget>[
          // "Yes" button to delete the item
          TextButton(
            onPressed: () async {
              // Close the dialog and delete the item
              Navigator.of(context).pop();
              // Call the function to delete the item using the given id
              if (methodFor == "delete-tag") {
                ProficientTag.deleteTags(id);
              } else if (methodFor == "delete-hiring") {
                await HiredCoachDb.deleteHirings(
                  recruterId: recruterId,
                  userId: id,
                );

                return snackBar(context: context, msg: "Cancelled");
              } else if (methodFor == "delete-experience") {
                ExperienceDb.deleteExperience(id);
              } else if (methodFor == 'un-hire') {
                await HiredCoachDb.unHireCoach(docId: id, userId: id);
              }
            },
            child: Text(
              'Yes',
              style: TextStyle(
                color: AppColors.whiteColor, // Custom text color
              ),
            ), // Text displayed on the button
          ),

          // "No" button to cancel the delete action
          TextButton(
            onPressed: () {
              // Close the dialog without performing any action
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: TextStyle(
                color: AppColors.whiteColor, // Custom text color
              ),
            ), // Text displayed on the button
          ),
        ],
      );
    },
  );
}

// Experience Container Widget
Widget experienceContainer(context, {userId, currentUserId, deviceWidth}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 10, bottom: 30),
    width: deviceWidth - 50,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: AppColors.greenColor,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Text for "Experience"
            titleWidget(
              text: "Experience",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
            // Add Icon Button
            userId == currentUserId
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ExperienceScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        Expanded(
          child: ExperienceList(
            userId: userId,
            currentUserId: currentUserId,
          ), // Use the extracted widget here
        ),
      ],
    ),
  );
}
