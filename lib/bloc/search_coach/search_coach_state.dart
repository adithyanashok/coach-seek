part of 'search_coach_bloc.dart';

@freezed
class SearchCoachState with _$SearchCoachState {
  const factory SearchCoachState({
    required bool loading,
    required List<UserModel> coach,
  }) = _SearchCoachState;
  factory SearchCoachState.initial() {
    return const SearchCoachState(
      loading: false,
      coach: [],
    );
  }
}
