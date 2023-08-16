import 'dart:developer';
import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/services/firebase_notification/firebase_notification.dart';
import 'package:coach_seek/view/coaches/coaches.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/widgets/bottom_nav_bar.dart';
import 'package:coach_seek/view/profile_screen/profile_screen.dart';
import 'package:coach_seek/view/search_result/search_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize Firebase Notification settings
    FirebaseNotificationClass().requestPermission();
    FirebaseNotificationClass().firebaseInit(context);
    FirebaseNotificationClass().isTokenRefresh();
    FirebaseNotificationClass().getToken().then((value) {
      log("Value: $value");
    });
  }

  // Get the current user's ID
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    // Fetch coaches' data and user's data
    BlocProvider.of<CoachBloc>(context).add(const GetCoaches());
    BlocProvider.of<AuthBloc>(context).add(UserEvent(userId: userId));

    // List of pages in the bottom navigation bar
    final pages = [
      const HomeScreen(),
      const SearchResultScreen(),
      Coaches(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: changeIndexNotifier,
          builder: (context, value, child) {
            // Display the selected page based on the current index
            return pages[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
