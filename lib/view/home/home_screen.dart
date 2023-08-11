import 'package:coach_seek/bloc/coach/coach_bloc.dart';

import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/card.dart';

final user = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoachBloc>(context).add(const GetCoaches());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(title: 'Home'),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          child: Column(
            children: [
              buildSubHeadings(
                text: "Discover cricket coaches\nnear you",
                left: 20,
                top: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocBuilder<CoachBloc, CoachState>(
                        builder: (context, state) {
                          return state.loading == true
                              ? circleLoadingWidget()
                              : ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return coachCard(
                                      context: context,
                                      state: state.coach[index],
                                      func: (id) {
                                        Navigator.of(context).pushNamed(
                                            'profile',
                                            arguments: id);
                                      },
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
                      ElevatedButton(
                        onPressed: () {
                          FireBaseAuthClass().signOut(context);
                        },
                        child: const Text("Signout"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
