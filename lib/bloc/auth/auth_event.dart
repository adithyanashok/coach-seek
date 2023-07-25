part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;

  const factory AuthEvent.signInEvent({required Map<String, dynamic>? user}) =
      SignInEvent;

  const factory AuthEvent.updateEvent({required bool loading}) = UpdateEvent;
}
