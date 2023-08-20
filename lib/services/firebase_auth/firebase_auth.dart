import 'dart:developer';

import 'package:coach_seek/controller/db/user/user.dart';
import 'package:coach_seek/model/user/user.dart';
import 'package:coach_seek/services/firebase_notification/firebase_notification.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/main_page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        final fcmToken = await FirebaseNotificationClass().getToken();
        await UserDb().updateFcmToken(userId: user.uid, fcmToken: fcmToken);

        // If the sign-in is successful, navigate to the main screen and remove all previous routes.
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen()),
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
    required type,
  }) async {
    log("Type at signupWithEmail: $type");

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = _auth.currentUser!.uid;

      if (credential.user != null) {
        // Send email verification.
        await credential.user!.sendEmailVerification();
        // await signInWithPhone(context, phone);

        // Update the display name.
        await credential.user!.updateDisplayName(name);

        final fcmToken = await FirebaseNotificationClass().getToken();

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
          isCoach: type,
          fcmToken: fcmToken,
        );

        // Add the user to the database.
        await UserDb().addUser(user, userId);

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

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      snackBar(context: context, msg: e.message.toString());
    }
  }

  Future<void> facebookSignIn(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      snackBar(context: context, msg: e.message.toString());
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
  Future<void> signOut(context, userId) async {
    // Sign out from Firebase Authentication.
    await UserDb().updateFcmToken(userId: userId, fcmToken: "");
    await FirebaseAuth.instance.signOut();

    // Navigate to the onboarding screen.
    Navigator.of(context).pushReplacementNamed("onboarding");
  }
}
