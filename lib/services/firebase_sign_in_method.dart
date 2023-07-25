import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirabaseSignInMethod {
  final BuildContext context;

  FirabaseSignInMethod(this.context);

  Future<void> signInHandle(String type) async {
    if (type == "email") {
      final state = context.read<SignInBloc>().state;
      final emailAddress = state.email;
      final password = state.password;

      if (emailAddress.isEmpty) {
        snackBar(context: context, msg: "You need to fill email address");
        return;
      }
      if (password.isEmpty) {
        snackBar(context: context, msg: "You need to fill password");
        return;
      }
      context.read<FireBaseAuthClass>().signInWithEmail(
            emailAddress: emailAddress,
            password: password,
            context: context,
          );
    }
  }
}
