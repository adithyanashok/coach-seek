import 'dart:developer';
import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/colors.dart';

// Coach Card Widget
Widget coachCard({Function? func, context}) {
  return Expanded(
    child: BlocBuilder<CoachBloc, CoachState>(
      builder: (context, state) {
        return state.loading == true
            ? circleLoadingWidget() // Show a loading widget while data is being fetched
            : ListView.separated(
                itemBuilder: (context, index) {
                  final data = state.coach[index];
                  log(data.toString());
                  return GestureDetector(
                    onTap: () {
                      func!();
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
                              data.profileImg,
                              height: 150,
                              width: 140,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Coach Name
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.name,
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
                                      data.amount,
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
                                  data.role,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF8D8484),
                                  ),
                                ),
                                // Coach Location
                                Text(
                                  data.location,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 54,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF0FA926),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Batting",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: "inter",
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Similar containers for other skills
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: state.coach.length,
              );
      },
    ),
  );
}
