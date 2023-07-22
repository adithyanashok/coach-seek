// import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';
// import 'package:coach_seek/view/core/snack_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignInController {
//   final BuildContext context;

//   SignInController(this.context);

//   Future<void> signInHandle(String type) async {
//     if (type == "email") {
//       final state = context.read<SignInBloc>().state;
//       final emailAddress = state.email;
//       final password = state.password;

//       if (emailAddress.isEmpty) {
//         snackBar(context: context, msg: "You need to fill email address");
//         return;
//       }
//       if (password.isEmpty) {
//         snackBar(context: context, msg: "You need to fill password");
//         return;
//       }
//       try {
//         final credential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailAddress,
//           password: password,
//         );
//         if (credential.user == null) {
//           snackBar(context: context, msg: "user doesn't exist");
//         }
//         if (!credential.user!.emailVerified) {
//           snackBar(
//               context: context, msg: "you need to verify your email address");
//           return;
//         }
//         final user = credential.user;
//         if (user != null) {
//           print(user.uid);
//           Navigator.of(context)
//               .pushNamedAndRemoveUntil("home", (route) => false);
//         }
//       } on FirebaseAuthException catch (e) {
//         if (e.code == "invalid-email") {
//           snackBar(context: context, msg: "Your emai is not valid");
//         } else if (e.code == "user-not-found") {
//           snackBar(context: context, msg: "User not found");
//         } else if (e.code == "wrong-password") {
//           snackBar(context: context, msg: "Wrong password");
//         } else {
//           snackBar(context: context, msg: "User Disabled");
//         }
//       }
//     }
//   }
// }
