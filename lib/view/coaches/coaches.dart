import 'package:coach_seek/controller/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/controller/bloc/hired_coach/hired_coach_bloc.dart';
import 'package:coach_seek/controller/db/user/user.dart';
import 'package:coach_seek/view/core/colors.dart';

import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coaches extends StatelessWidget {
  Coaches({super.key});
  final id = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    // Function to call events related to hiring coaches
    void callEvents() async {
      // Get hired coaches and coaches who hired the current user
      BlocProvider.of<HiredCoachBloc>(context)
          .add(GetHiredCoaches(userId: id!));
      final data = await UserDb().getAUserFromHiredDb(id!);
      BlocProvider.of<CoachBloc>(context)
          .add(GetWhoHiredMe(recruterId: data.recruterId, userId: id!));
    }

    // Call the events on screen build
    callEvents();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: "Coaches"),
        ),
        body: Column(
          children: [
            // Tab bar for switching between "My Hirings" and "Who hired me" views
            TabBar(
              padding: const EdgeInsets.only(top: 10),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.lightbluecolor,
              tabs: [
                profileActionButton(
                    text: "My Hirings",
                    color: AppColors.lightbluecolor,
                    width: 180),
                profileActionButton(
                    text: "Who hired me",
                    color: AppColors.lightbluecolor,
                    width: 180),
              ],
            ),
            // Tab bar views for "My Hirings" and "Who hired me"
            const Expanded(
              child: TabBarView(
                children: [
                  MyHirings(),
                  WhoHiredMe(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHirings extends StatefulWidget {
  const MyHirings({super.key});

  @override
  _MyHiringsState createState() => _MyHiringsState();
}

class _MyHiringsState extends State<MyHirings>
    with AutomaticKeepAliveClientMixin {
  final id = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Build the view of "My Hirings"
    return BlocBuilder<HiredCoachBloc, HiredCoachState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            // Refresh the list of hired coaches
            BlocProvider.of<HiredCoachBloc>(context)
                .add(GetHiredCoaches(userId: id!));
            // Simulate a delay before completing the refresh
            await Future.delayed(const Duration(seconds: 1));
          },
          child: ListView.separated(
            itemBuilder: (context, index) {
              return coachCard(
                context: context,
                state: state.coach[index],
                func: (id) {
                  Navigator.of(context).pushNamed('profile', arguments: id);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: state.coach.length,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class WhoHiredMe extends StatefulWidget {
  const WhoHiredMe({super.key});

  @override
  _WhoHiredMeState createState() => _WhoHiredMeState();
}

class _WhoHiredMeState extends State<WhoHiredMe>
    with AutomaticKeepAliveClientMixin {
  final id = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // Build the view of "Who Hired Me"
    return BlocBuilder<CoachBloc, CoachState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            // Refresh the list of coaches who hired the current user
            final data = await UserDb().getAUserFromHiredDb(id!);
            BlocProvider.of<CoachBloc>(context)
                .add(GetWhoHiredMe(recruterId: data.recruterId, userId: id!));
            // Simulate a delay before completing the refresh
            await Future.delayed(const Duration(seconds: 1));
          },
          child: state.loading
              ? circleLoadingWidget()
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return coachCard(
                      context: context,
                      state: state.coach[index],
                      func: (id) {
                        Navigator.of(context)
                            .pushNamed('profile', arguments: id);
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: state.coach.length,
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
