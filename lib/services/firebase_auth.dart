import 'dart:developer';

import 'package:coach_seek/database/functions/user/user.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to get the current user object from FirebaseUser object.
  User? get user => _auth.currentUser;

  // Stream to listen for authentication state changes.
  Stream<User?> get authState => _auth.authStateChanges();

  // Function to handle email sign-in.
  Future<void> signInWithEmail({
    required String emailAddress,
    required String password,
    required context,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user == null) {
        // If the user does not exist, show a message.
        snackBar(context: context, msg: "User doesn't exist");
      }

      if (!credential.user!.emailVerified) {
        // If the user's email is not verified, show a message.
        snackBar(
          context: context,
          msg: "You need to verify your email address",
        );
        return;
      }

      final user = credential.user;

      if (user != null) {
        // If the sign-in is successful, navigate to the main screen and remove all previous routes.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle different FirebaseAuthExceptions and show appropriate messages.
      if (e.code == "invalid-email") {
        snackBar(context: context, msg: "Your email is not valid");
      } else if (e.code == "user-not-found") {
        snackBar(context: context, msg: "User not found");
      } else if (e.code == "wrong-password") {
        snackBar(context: context, msg: "Wrong password");
      } else {
        snackBar(context: context, msg: "User Disabled");
      }
    }
  }

  // Function to handle email sign-up.
  Future<void> signUpWithEmail({
    required name,
    required email,
    required password,
    required phone,
    required location,
    required amount,
    required desc,
    required role,
    required profileImg,
    required context,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = _auth.currentUser!.uid;

      if (credential.user != null) {
        // Send email verification.
        await credential.user!.sendEmailVerification();

        // Update the display name.
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
          profileImg: profileImg,
        );

        // Add the user to the database.
        if (credential.user!.emailVerified == true) {
          await UserDb().addUser(user, userId);
        }

        snackBar(
          context: context,
          msg:
              "An email has been sent to your registered email. To activate it please check your email box",
        );

        // Navigate to the sign-in screen.
        Navigator.of(context).pushNamed("signin");
      }
    } on FirebaseAuthException catch (e) {
      // Handle different FirebaseAuthExceptions and show appropriate messages.
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

  // Function to update user data.
  Future<void> updateTheData({
    required UserModel user,
  }) async {
    log(user.toString());

    // Update the user in the database.
    await UserDb().updateUser(userId: user.userId, value: user);
  }

  // Function to sign out the user.
  Future<void> signOut(context) async {
    // Sign out from Firebase Authentication.
    await FirebaseAuth.instance.signOut();

    // Navigate to the onboarding screen.
    Navigator.of(context).pushNamedAndRemoveUntil(
      "onboarding",
      (route) => false,
    );
  }
}
