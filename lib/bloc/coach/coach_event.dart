part of 'coach_bloc.dart';

@freezed
class CoachEvent with _$CoachEvent {
  const factory CoachEvent.getCoaches() = GetCoaches;
  const factory CoachEvent.getSearchedCoaches({String? query}) =
      GetSearchedCoaches;
}
