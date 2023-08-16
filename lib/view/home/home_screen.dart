import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/card.dart';

// Get the current user
final user = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch coaches' data
    BlocProvider.of<CoachBloc>(context).add(const GetCoaches());

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(title: 'Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display subheading
            buildSubHeadings(
              text: "Discover cricket coaches\nnear you",
              left: 20,
              top: 10,
            ),
            Expanded(
              child: BlocBuilder<CoachBloc, CoachState>(
                builder: (context, state) {
                  return state.loading == true
                      ? circleLoadingWidget()
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            // Display coach card for each coach
                            return coachCard(
                              context: context,
                              state: state.coach[index],
                              func: (id) {
                                // Navigate to profile screen when a coach card is tapped
                                Navigator.of(context)
                                    .pushNamed('profile', arguments: id);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            // Add spacing between coach cards
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: state.coach.length,
                        );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Sign out the current user
                FireBaseAuthClass().signOut(context, user!.uid);
              },
              child: const Text("Signout"),
            ),
          ],
        ),
      ),
    );
  }
}
