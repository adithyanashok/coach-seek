import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';

Widget coachCard({Function? func}) {
  return Expanded(
    child: ListView.separated(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            func!();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 6, top: 30),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: AppColors.Lightbluecolor,
              boxShadow: const [
                BoxShadow(color: Colors.white, offset: Offset(1, 20)),
              ],
            ),
            height: 120,
            // width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/coach.jpg",
                    height: 150,
                    width: 140,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Stephen Fleming",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.lightbluecolor,
                                ),
                              )),
                          Text(
                            "\$30.0",
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
                      const Text(
                        "Batting Coach",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "inter",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8D8484),
                        ),
                      ),
                      const Text(
                        "Chennai",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "inter",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4662C8),
                        ),
                      ),
                      const Text(
                        "4.5",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "inter",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0F38C8),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Container(
                            width: 54,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0FA926),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Keeping",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0FA926),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Fielding",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 54,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0FA926),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Bowling",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
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
      itemCount: 1,
    ),
  );
}
