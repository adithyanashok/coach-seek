part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    required Map items,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return const ProfileState(isLoading: false, items: {});
  }
}
