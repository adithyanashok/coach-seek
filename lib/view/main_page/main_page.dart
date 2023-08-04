import 'package:coach_seek/view/coaches/coaches.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/widgets/bottom_nav_bar.dart';
import 'package:coach_seek/view/profile/profile_screen.dart';
import 'package:coach_seek/view/search_result/search_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:coach_seek/presentation/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final pages = [
      const HomeScreen(),
      SearchResultScreen(),
      const Coaches(),
      ProfileScreen(currentUserId: userId!),
    ];
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: changeIndexNotifier,
          builder: (context, value, child) {
            return pages[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
