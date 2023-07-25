import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseSignUpMethod {
  final BuildContext context;

  FirebaseSignUpMethod(this.context);

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final phone = state.phone;
    final location = state.location;
    final amount = state.amount;
    final desc = state.desc;
    final role = state.role;
    if (email.isEmpty) {
      snackBar(context: context, msg: "You need to fill email address");
      return;
    }
    if (password.isEmpty) {
      snackBar(context: context, msg: "You need to fill password");
      return;
    }
    context.read<FireBaseAuthClass>().signUpWithEmail(
          name: name,
          email: email,
          password: password,
          phone: phone,
          location: location,
          amount: amount,
          desc: desc,
          role: role,
          context: context,
        );
  }
}
