import 'package:coach_seek/view/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:netflix_app/core/colors/colors.dart';

ValueNotifier<int> changeIndexNotifier = ValueNotifier(0);

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // <-------------Value listenable builder------------>
    return ValueListenableBuilder(
      valueListenable: changeIndexNotifier,
      builder: (context, value, child) {
        // <-------------------ClipRRect--------------------->
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          //<--------------------Bottom Navigation bar---------------->
          child: BottomNavigationBar(
            currentIndex: value,
            onTap: (index) {
              changeIndexNotifier.value = index;
            },
            // <-----------------bottom Navigation bar styles------------------>
            backgroundColor: AppColors.textBlueColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.whiteColor,
            showUnselectedLabels: false,
            // <------------------Google fonts-------------------->
            selectedLabelStyle: GoogleFonts.bakbakOne(
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: AppColors.textBlueColor),
            ),
            unselectedLabelStyle: GoogleFonts.bakbakOne(
              textStyle: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: AppColors.textBlueColor),
            ),
            //<---------------------bottom nav items------------------>
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_sharp),
                label: "My Coaches",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
