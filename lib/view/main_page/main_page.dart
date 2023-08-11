import 'package:coach_seek/bloc/coach/coach_bloc.dart';

import 'package:coach_seek/view/coaches/coaches.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/widgets/bottom_nav_bar.dart';
import 'package:coach_seek/view/profile_screen/profile_screen.dart';
import 'package:coach_seek/view/search_result/search_result.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoachBloc>(context).add(const GetCoaches());

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
