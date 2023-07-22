import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initialize()) {
    on<EmailEvent>((event, emit) {
      print("My Email is: ${event.email}");
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      print("My password is: ${event.passWord}");
      emit(state.copyWith(password: event.passWord));
    });
  }
}
