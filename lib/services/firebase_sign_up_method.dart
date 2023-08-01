import 'dart:developer';

import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseSignUpMethod {
  final BuildContext context;

  FirebaseSignUpMethod(this.context);

  // Function to upload an image to Firebase Storage and update user data.
  // If imageFile is null, it means we are updating only user details without changing the profile image.
  // If userData is null, it indicates a signup scenario.
  // If both imageFile and userData are provided, it means we are updating user details along with a new profile image.
  Future<void> uploadImageToFirebase({UserModel? userData, imageFile}) async {
    // If imageFile is null, update the user details only.
    if (imageFile == null) {
      try {
        // Updating user data in Firebase Authentication.
        FireBaseAuthClass().updateTheData(user: userData!);
      } catch (e) {
        log(e.toString());
        snackBar(context: context, msg: "$e");
      }
    } else if (userData == null) {
      // If userData is null, this is for signup. We upload the profile image to Firebase Storage and handle the signup process.
      try {
        String fileName = DateTime.now().toString();
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);

        // Upload the file to Firebase Storage.
        UploadTask uploadTask = firebaseStorageRef.putFile(imageFile!);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        // Get the download URL of the uploaded image.
        final profileImg = await taskSnapshot.ref.getDownloadURL();
        handleSignUp(profileImg);
      } catch (e) {
        log(e.toString());
        snackBar(context: context, msg: "$e");
      }
    } else {
      // If both imageFile and userData are provided, we upload the profile image to Firebase Storage and update the user data with the new profile image URL.
      try {
        String fileName = DateTime.now().toString();
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);

        // Upload the file to Firebase Storage.
        UploadTask uploadTask = firebaseStorageRef.putFile(imageFile!);

        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

        // Get the download URL of the uploaded image.
        final profileImg = await taskSnapshot.ref.getDownloadURL();
        userData.profileImg = profileImg;
        // Update the user data with the new profile image URL.
        FireBaseAuthClass().updateTheData(user: userData);
      } catch (e) {
        log(e.toString());
        snackBar(context: context, msg: "$e");
      }
    }
  }

  // Function to handle the signup process with the given user information and profile image URL.
  Future<void> handleSignUp(img) async {
    final state = context.read<SignUpBloc>().state;
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final phone = state.phone;
    final location = state.location;
    final amount = state.amount;
    final desc = state.desc;
    final role = state.role;
    final profileImg = img;

    // Check if email is empty.
    if (email.isEmpty) {
      snackBar(context: context, msg: "You need to fill email address");
      return;
    }

    // Check if password is empty.
    if (password.isEmpty) {
      snackBar(context: context, msg: "You need to fill password");
      return;
    }

    // Perform the signup using Firebase Authentication.
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
          profileImg: profileImg,
        );
  }
}
