import 'package:bloc/bloc.dart';
import 'package:coach_seek/controller/db/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<SignInEvent>((event, emit) {
      emit(state.copyWith(user: event.user!));
    });
    on<UserEvent>((event, emit) async {
      final user = await UserDb().getAUserFromUsersDb(event.userId!);
      emit(state.copyWith(user: user!));
    });
    on<UpdateEvent>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });
    on<LoadingEvent>((event, emit) {
      emit(state.copyWith(loading: event.loading));
    });
  }
}
