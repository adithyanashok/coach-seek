import 'package:coach_seek/bloc/hired_coach/hired_coach_bloc.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coaches extends StatelessWidget {
  Coaches({super.key});
  final id = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HiredCoachBloc>(context).add(GetHiredCoaches(userId: id!));

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: AppBarWidget(title: "Coaches"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<HiredCoachBloc, HiredCoachState>(
              builder: (context, state) {
                return Expanded(
                  child: state.loading == true
                      ? circleLoadingWidget()
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return coachCard(
                                context: context,
                                state: state.coach[index],
                                func: (id) {
                                  Navigator.of(context)
                                      .pushNamed('profile', arguments: id);
                                });
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: state.coach.length,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
