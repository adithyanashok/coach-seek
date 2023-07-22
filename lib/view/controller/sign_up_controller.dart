// import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
// import 'package:coach_seek/view/core/snack_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpController {
//   final BuildContext context;

//   SignUpController(this.context);

//   Future<void> handleSignUp() async {
//     final state = context.read<SignUpBloc>().state;
//     final name = state.name;
//     final email = state.email;
//     final password = state.password;
//     final phone = state.phone;
//     final location = state.location;
//     final amount = state.amount;
//     final desc = state.desc;
//     print("password: $password");
//     if (email.isEmpty) {
//       snackBar(context: context, msg: "You need to fill email address");
//       return;
//     }
//     if (password.isEmpty) {
//       snackBar(context: context, msg: "You need to fill password");
//       return;
//     }
//     try {
//       // <---------------------------Firebase Auth----------------------->
//       final credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       // checking that user is not null
//       if (credential.user != null) {
//         // sending email verification
//         await credential.user!.sendEmailVerification();
//         // updating display name
//         await credential.user!.updateDisplayName(name);
//         // firestore instance
//         final db = FirebaseFirestore.instance;

//         // Create a new user with a first and last name
//         final user = <String, dynamic>{
//           "name": name,
//           "email": email,
//           "password": password,
//           "phone": phone,
//           "location": location,
//           "amount": amount,
//           "desc": desc,
//         };

//         // Add a new document with a generated ID
//         db.collection("users").add(user).then((DocumentReference doc) =>
//             print('DocumentSnapshot added with ID: ${doc.id}'));

//         snackBar(
//           context: context,
//           msg:
//               "An email has been sent to your registered email. To activate it please check your email box",
//         );
//         Navigator.of(context).pop();
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "weak-password") {
//         snackBar(context: context, msg: "The password provided is too weak");
//       } else if (e.code == "email-already-in-use") {
//         snackBar(context: context, msg: "The email is already in use");
//       } else if (e.code == "invalid-email") {
//         snackBar(context: context, msg: "The email provided is not valid");
//       } else {
//         snackBar(context: context, msg: "The operation not allowed");
//       }
//     }
//   }
// }
