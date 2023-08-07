part of 'hired_coach_bloc.dart';

@freezed
class HiredCoachState with _$HiredCoachState {
  const factory HiredCoachState({
    required bool loading,
    required List<UserModel> coach,
  }) = _HiredCoachState;
  factory HiredCoachState.initial() {
    return const HiredCoachState(
      loading: false,
      coach: [],
    );
  }
}
