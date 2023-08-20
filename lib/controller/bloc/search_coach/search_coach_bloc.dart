import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coach_seek/controller/db/coaches/coaches.dart';
import 'package:coach_seek/model/user/user.dart';
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
