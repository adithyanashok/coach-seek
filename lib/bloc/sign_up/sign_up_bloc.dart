import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initialize()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<NameEvent>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<RoleEvent>((event, emit) {
      emit(state.copyWith(role: event.role));
    });
    on<AmountEvent>((event, emit) {
      emit(state.copyWith(amount: event.amount));
    });
    on<LocationEvent>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
    on<DescEvent>((event, emit) {
      emit(state.copyWith(desc: event.desc));
    });
    on<PhoneEvent>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });
  }
}
