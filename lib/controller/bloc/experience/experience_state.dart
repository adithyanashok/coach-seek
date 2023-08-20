part of 'experience_bloc.dart';

@freezed
class ExperienceState with _$ExperienceState {
  const factory ExperienceState({
    required List<ExperienceModel> experiences,
  }) = _ExperienceState;

  factory ExperienceState.initial() {
    return const ExperienceState(
      experiences: [],
    );
  }
}
