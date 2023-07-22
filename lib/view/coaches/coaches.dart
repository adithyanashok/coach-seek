import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart';
import 'package:flutter/material.dart';

class Coaches extends StatelessWidget {
  const Coaches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: AppBarWidget(title: "Coaches"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            coachCard(),
          ],
        ),
      ),
    );
  }
}
