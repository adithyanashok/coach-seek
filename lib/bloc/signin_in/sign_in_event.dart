part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.initialize() = Initialize;
  const factory SignInEvent.emailEvent({required String email}) = EmailEvent;
  const factory SignInEvent.passwordEvent({required String passWord}) =
      PasswordEvent;
}
