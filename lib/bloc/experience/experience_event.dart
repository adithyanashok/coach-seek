part of 'experience_bloc.dart';

@freezed
class ExperienceEvent with _$ExperienceEvent {
  const factory ExperienceEvent.getExperience(
      List<ExperienceModel> experience) = GetExperience;
}
