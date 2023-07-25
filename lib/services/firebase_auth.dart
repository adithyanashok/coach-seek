import 'package:coach_seek/database/functions/user/user.dart';
import 'package:coach_seek/database/user/user.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User _userFromFirebaseUser(FirebaseUser user)
  // Stream<FirebaseUser> get user {
  //   return _auth.onAuthStateChanged;
  // }
  User? get user => _auth.currentUser;
  Stream<User?> get authState => _auth.authStateChanges();

  Future<void> signInWithEmail(
      {required String emailAddress,
      required String password,
      required context}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user == null) {
        snackBar(context: context, msg: "user doesn't exist");
      }
      if (!credential.user!.emailVerified) {
        snackBar(
            context: context, msg: "you need to verify your email address");
        return;
      }
      final user = credential.user;
      // context.read<AuthBloc>().add(AuthEvent.signInEvent(userId: user!.uid));
      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        snackBar(context: context, msg: "Your emai is not valid");
      } else if (e.code == "user-not-found") {
        snackBar(context: context, msg: "User not found");
      } else if (e.code == "wrong-password") {
        snackBar(context: context, msg: "Wrong password");
      } else {
        snackBar(context: context, msg: "User Disabled");
      }
    }
  }

  Future<void> signUpWithEmail(
      {required name,
      required email,
      required password,
      required phone,
      required location,
      required amount,
      required desc,
      required role,
      required context}) async {
    try {
      // <---------------------------Firebase Auth----------------------->
      final credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userId = _auth.currentUser!.uid;
      // checking that user is not null
      if (credential.user != null) {
        // sending email verification
        await credential.user!.sendEmailVerification();
        // updating display name
        await credential.user!.updateDisplayName(name);

        final user = UserModel(
          name: name,
          role: role,
          location: location,
          amount: amount,
          desc: desc,
          phone: phone,
          email: email,
          userId: userId,
        );

        await UserDb().addUser(user, userId);

        snackBar(
          context: context,
          msg:
              "An email has been sent to your registered email. To activate it please check your email box",
        );
        Navigator.of(context).pushNamed("signin");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        snackBar(context: context, msg: "The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        snackBar(context: context, msg: "The email is already in use");
      } else if (e.code == "invalid-email") {
        snackBar(context: context, msg: "The email provided is not valid");
      } else {
        snackBar(context: context, msg: "The operation not allowed");
      }
    }
  }

  Future<void> updateTheData({
    required UserModel user,
  }) async {
    await UserDb().updateUser(userId: user.userId, value: user);
  }

  Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed("onboarding");
  }
}
