import 'package:bloc/bloc.dart';
import 'package:coach_seek/model/experience/experiences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_event.dart';
part 'experience_state.dart';
part 'experience_bloc.freezed.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc() : super(ExperienceState.initial()) {
    on<GetExperience>((event, emit) async {
      // final List<ExperienceModel> exp = await UserDb().getExperience();
      emit(ExperienceState(experiences: event.experience));
    });
  }
}
