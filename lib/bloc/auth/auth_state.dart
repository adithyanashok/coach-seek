part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required bool loading,
    @Default({}) Map<String, dynamic> user,
  }) = _AuthState;
  factory AuthState.initial() {
    return const AuthState(loading: false, user: {});
  }
}
