import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart';
import 'package:coach_seek/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String? query;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Search"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildSearchBar(
              func: (value) {
                query = value;
              },
              onClick: () {
                context.read<CoachBloc>().add(GetSearchedCoaches(query: query));
              },
            ),
            coachCard(context: context),
          ],
        ),
      ),
    );
  }
}
