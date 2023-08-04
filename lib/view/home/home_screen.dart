import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/sub_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

final user = FirebaseAuth.instance.currentUser;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CoachBloc>().state;

    context.read<CoachBloc>().add(const GetCoaches());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(title: 'Home'),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      scrollNotifier.value == true
                          ? buildSubHeadings(
                              text: "Discover cricket coaches\nnear you",
                              left: 20,
                              top: 10,
                            )
                          : const SizedBox(
                              height: 10,
                            ),
                      coachCard(
                          context: context,
                          state: state,
                          func: (id) {
                            Navigator.of(context)
                                .pushNamed('profile', arguments: id);
                          }),
                      ElevatedButton(
                          onPressed: () {
                            FireBaseAuthClass().signOut(context);
                          },
                          child: const Text("Signout"))
                    ],
                  ),
                ));
          },
        ),
      ),
      // bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
