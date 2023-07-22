import 'package:coach_seek/view/core/colors.dart';
import 'package:flutter/material.dart';

//,---------------------Profile Head------------------->
Widget ProfileHead({
  required String status,
  required String imageurl,
  required String coachName,
  required String coachRole,
  required String coachLocation,
  required double amount,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //<------------------Status tag----------------------->
          Tag(
              color: status == "Available" ? AppColors.greenColor : Colors.red,
              text: status),
          //<---------------coloumn for profile image, and other detais------------>
          Column(
            children: [
              //<--------profile image--------------------->
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.asset(imageurl),
                ),
              ),
              // <-------------------Name and others------------------->
              // <----------Name----------------->
              TitleWidget(
                text: coachName,
                color: AppColors.lightbluecolor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),

              // <------------------Role------------------->
              TitleWidget(
                text: coachRole,
                color: AppColors.lightbluecolor,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              //<-----------------Location------------------->
              TitleWidget(
                text: coachLocation,
                color: AppColors.greycolor,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ],
          ),
          //<---------------------Price tag---------------------->
          Tag(color: AppColors.lightbluecolor, text: "\$$amount"),
        ],
      ),
      // <--------------------Action buttons------------------------>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileActionButton(
            color: Colors.red,
            text: "Hire",
          ),
          ProfileActionButton(
            color: AppColors.greenColor,
            text: "Call Now",
          ),
        ],
      ),
      //<------------------------About me container--------------------->
      AboutMeContainer(),
      //<--------------------------Experience container---------------------------->
      ExperienceContainer()
    ],
  );
}

//<-----------------------Profile Action buttons------------------>
Widget ProfileActionButton({
  required String text,
  required Color color,
}) {
  return Container(
    width: 140,
    height: 40,
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
//<-----------------------Profile Action buttons Ending------------------>

//<-----------------------Text widget------------------>
Widget TitleWidget({
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
//<-----------------------Text widget ending------------------>

//<-------------------------------Tag widget---------------->
Widget Tag({required Color color, required String text}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 10),
    height: 21,
    width: 77,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: color,
    ),
    //<--------------------Status Text----------------->
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontFamily: "inter",
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
      ),
    ),
  );
}
//<-------------------------------Tag widget ending---------------->

//<-------------------------------About me container---------------->

Widget AboutMeContainer() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 20),
    width: 353,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: AppColors.lightbluecolor,
    ),
    //<----------------------Column----------------------------------->
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //<-----------------------Reusable text widget----------------->
        TitleWidget(
          text: "About me",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        //<-----------------------Reusable text widget----------------->
        TitleWidget(
          text:
              "Rahul Sharad Dravid is an Indian cricket coach and former captain of the Indian national team, currently serving as its head coach. Prior to his appointment to the senior men's national team, Dravid was the Head of Cricket at the National Cricket Academy, and the head coach of the India Under-19 and India A teams",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w300,
          fontSize: 15,
        )
      ],
    ),
  );
}

//<---------------------------ExperienceContainer------------------->
Widget ExperienceContainer() {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 10),
    width: 353,
    height: 250,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: AppColors.greenColor,
    ),
    //<-----------------Column------------------------------->
    child: Column(
      children: [
        //<-------------------Row---------------------------->
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //<------------------Reusable text widget------->
            TitleWidget(
              text: "Experience",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 19,
            ),
            //<--------------------icon widget----------->
            Icon(
              Icons.add,
              color: AppColors.whiteColor,
              size: 30,
            )
          ],
        ),
        // <----------------------List View------------------->
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              //<-------------------container--------------->
              return Container(
                width: 345,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.whiteColor,
                ),
                //<------------------column------------------->
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //<------------------Reusable text widget------->
                    TitleWidget(
                      text: "Batting Coach",
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    //<------------------Reusable text widget------->
                    TitleWidget(
                      text: "Batting Coach at CSK",
                      color: AppColors.greyColor2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: 1,
          ),
        )
      ],
    ),
  );
}
