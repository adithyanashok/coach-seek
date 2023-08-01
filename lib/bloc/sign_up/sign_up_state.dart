part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required String name,
    required String email,
    required String password,
    required String role,
    required String location,
    required String amount,
    required String desc,
    required String phone,
    required String profileImg,
  }) = _SignUpstate;

  factory SignUpState.initialize() => const SignUpState(
        name: "",
        email: "",
        password: "",
        role: "",
        location: "",
        amount: "",
        desc: "",
        phone: "",
        profileImg: "",
      );
}
