part of 'hired_coach_bloc.dart';

@freezed
class HiredCoachEvent with _$HiredCoachEvent {
  const factory HiredCoachEvent.getHiredCoaches({required String userId}) =
      GetHiredCoaches;
}
