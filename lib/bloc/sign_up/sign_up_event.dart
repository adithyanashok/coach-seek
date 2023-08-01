part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.initialize() = Initialize;
  const factory SignUpEvent.emailEvent(String email) = EmailEvent;
  const factory SignUpEvent.passwordEvent(String password) = PasswordEvent;
  const factory SignUpEvent.nameEvent(String name) = NameEvent;
  const factory SignUpEvent.roleEvent(String role) = RoleEvent;
  const factory SignUpEvent.amountEvent(String amount) = AmountEvent;
  const factory SignUpEvent.locationEvent(String location) = LocationEvent;
  const factory SignUpEvent.descEvent(String desc) = DescEvent;
  const factory SignUpEvent.phoneEvent(String phone) = PhoneEvent;
  const factory SignUpEvent.profileImg(String profileImg) = ProfileImg;
}
