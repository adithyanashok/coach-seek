import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/bloc/hired_coach/hired_coach_bloc.dart';
import 'package:coach_seek/view/coaches/coaches.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/widgets/bottom_nav_bar.dart';
import 'package:coach_seek/view/profile/profile_screen.dart';
import 'package:coach_seek/view/search_result/search_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:coach_seek/presentation/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    BlocProvider.of<CoachBloc>(context).add(const GetCoaches());

    BlocProvider.of<HiredCoachBloc>(context)
        .add(GetHiredCoaches(userId: userId!));

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
            return pages[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
