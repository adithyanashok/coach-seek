part of 'coach_bloc.dart';

@freezed
class CoachEvent with _$CoachEvent {
  const factory CoachEvent.getCoaches() = GetCoaches;
  const factory CoachEvent.getWhoHiredMe(
      {required String recruterId, required String userId}) = GetWhoHiredMe;
}
