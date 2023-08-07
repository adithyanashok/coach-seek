import 'dart:developer';

import 'package:coach_seek/bloc/search_coach/search_coach_bloc.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart';
import 'package:coach_seek/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<SearchCoachBloc>().state;
    log("STATE SEARCH == $state");
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
                log(query.toString());
              },
              onClick: () {
                context
                    .read<SearchCoachBloc>()
                    .add(GetSearchedCoaches(query: query));
              },
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  // log("SEARCH STATE == ${state.coach[index]}");
                  final data = state.coach[index];
                  return coachCard(
                    context: context,
                    state: data,
                    func: (id) {
                      Navigator.of(context).pushNamed('profile', arguments: id);
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: state.coach.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
