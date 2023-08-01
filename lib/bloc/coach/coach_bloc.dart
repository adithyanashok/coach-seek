import 'package:bloc/bloc.dart';
import 'package:coach_seek/database/functions/coaches/coaches.dart';
import 'package:coach_seek/database/model/coach/coach.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_event.dart';
part 'coach_state.dart';
part 'coach_bloc.freezed.dart';

class CoachBloc extends Bloc<CoachEvent, CoachState> {
  CoachBloc() : super(CoachState.initial()) {
    on<GetCoaches>((event, emit) async {
      emit(state.copyWith(loading: true));

      final coaches = await CoachDb().getCoaches();
      emit(state.copyWith(loading: false, coach: coaches));
    });
  }
}
