import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<SignInEvent>((event, emit) {
      emit(state.copyWith(user: event.user!));
    });
    on<UpdateEvent>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });
  }
}
