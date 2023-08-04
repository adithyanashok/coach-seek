import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:coach_seek/database/functions/coaches/coaches.dart';
import 'package:coach_seek/database/model/user/user.dart';

part 'coach_bloc.freezed.dart';
part 'coach_event.dart';
part 'coach_state.dart';

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  CoachBloc() : super(CoachState.initial()) {
    on<GetCoaches>((event, emit) async {
      emit(state.copyWith(loading: true));

      final coaches = await CoachDb().getCoaches();

      coaches.shuffle();
      emit(state.copyWith(loading: false, coach: coaches));
    });

    on<GetSearchedCoaches>((event, emit) async {
      emit(state.copyWith(loading: true));
      final searchedQuery =
          await CoachDb().searchItems(searchQuery: event.query);
      searchedQuery.shuffle();

      emit(state.copyWith(loading: false, coach: searchedQuery));
    });
  }
}
