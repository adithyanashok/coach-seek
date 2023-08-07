import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coach_seek/database/functions/coaches/coaches.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_coach_event.dart';
part 'search_coach_state.dart';
part 'search_coach_bloc.freezed.dart';

class SearchCoachBloc extends Bloc<SearchCoachEvent, SearchCoachState> {
  SearchCoachBloc() : super(SearchCoachState.initial()) {
    on<GetSearchedCoaches>((event, emit) async {
      emit(state.copyWith(loading: true));
      final searchedQuery =
          await CoachDb().searchItems(searchQuery: event.query);
      // searchedQuery.shuffle()
      log("SEARCHED QUERY in file search bloc: $searchedQuery");
      emit(state.copyWith(loading: false, coach: searchedQuery));
    });
  }
}
