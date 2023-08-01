part of 'coach_bloc.dart';

@freezed
class CoachState with _$CoachState {
  const factory CoachState({
    required bool loading,
    required List<UserModel> coach,
  }) = _CoachState;
  factory CoachState.initial() {
    return const CoachState(
      loading: false,
      coach: [],
    );
  }
}
