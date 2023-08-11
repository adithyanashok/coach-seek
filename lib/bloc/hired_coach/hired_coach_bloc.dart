import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coach_seek/database/functions/hired_coach/hired_coach.dart';
import 'package:coach_seek/database/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hired_coach_event.dart';
part 'hired_coach_state.dart';
part 'hired_coach_bloc.freezed.dart';

class HiredCoachBloc extends Bloc<HiredCoachEvent, HiredCoachState> {
  HiredCoachBloc() : super(HiredCoachState.initial()) {
    on<GetHiredCoaches>((event, emit) async {
      emit(state.copyWith(loading: true));

      final coaches = await HiredCoachDb.getAllHiredCoaches(event.userId);

      // log("User at coaches page: ${data}");
      emit(state.copyWith(loading: false, coach: coaches));
    });
  }
}
