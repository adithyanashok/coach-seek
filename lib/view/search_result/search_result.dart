import 'dart:developer';

import 'package:coach_seek/controller/bloc/search_coach/search_coach_bloc.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/card.dart'; // Assuming you have a widget named coachCard
import 'package:coach_seek/view/widgets/circle_loading_widget.dart';
import 'package:coach_seek/view/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? query; // Holds the search query

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
                query = value; // Store the search query
                log(query.toString());
              },
              onClick: () {
                context.read<SearchCoachBloc>().add(GetSearchedCoaches(
                    query: query)); // Trigger search based on query
              },
            ),
            Expanded(
              child: BlocBuilder<SearchCoachBloc, SearchCoachState>(
                builder: (context, state) {
                  return state.loading == true
                      ? circleLoadingWidget() // Display loading widget
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return coachCard(
                              // Assuming coachCard is a widget that displays coach details
                              context: context,
                              state: state
                                  .coach[index], // Coach data from the state
                              func: (id) {
                                Navigator.of(context).pushNamed('profile',
                                    arguments:
                                        id); // Navigate to coach's profile
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: state.coach
                              .length, // Number of coaches in search results
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
