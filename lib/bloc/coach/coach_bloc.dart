import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coach_seek/database/functions/hired_coach/hired_coach.dart';
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
      log("Coach at CoachBloc: $coaches");

      coaches.shuffle();
      emit(state.copyWith(loading: false, coach: coaches));
    });
  }
}
