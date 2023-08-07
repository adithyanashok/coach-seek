import 'dart:developer';
import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/database/functions/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/colors.dart';

// Coach Card Widget
Widget coachCard({Function? func, context, state}) {
  final id = state.userId;
  return GestureDetector(
    onTap: () {
      func!(id);
    },
    child: Container(
      padding: const EdgeInsets.only(left: 6, top: 30),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.white, offset: Offset(1, 20)),
        ],
      ),
      height: 120,
      child: Row(
        children: [
          // Coach Profile Image
          ClipRRect(
            child: Image.network(
              state.profileImg,
              height: 150,
              width: 140,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coach Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.name,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightbluecolor,
                          ),
                        ),
                      ),
                      // Coach Amount
                      Text(
                        "\$${state.amount}",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightbluecolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Coach Role
                  Text(
                    state.role,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8D8484),
                    ),
                  ),
                  // Coach Location
                  Text(
                    state.location,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4662C8),
                    ),
                  ),
                  // Coach Rating (4.5 in this case)
                  const Text(
                    "4.5",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "inter",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0F38C8),
                    ),
                  ),
                  // Coach Skill Tags (Batting, Keeping, Fielding, Bowling)
                  StreamBuilder(
                    stream: ProficientTag.getTag(userId: state.userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for data, display a CircularProgressIndicator.
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        // If there is an error while loading data, display an error message.
                        return const Center(
                          child: Text("Error while loading data"),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        // If there is no data or the data is empty, display a message indicating "No Datas."
                        return const Center(
                          child: Text(
                            "No Datas",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        final data = snapshot.data;
                        return SizedBox(
                          height: 20,
                          // width: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 54,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0FA926),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    data[index].text,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: "inter",
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 2,
                              );
                            },
                            itemCount: data!.length,
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
