import 'dart:developer';

import 'package:coach_seek/controller/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/model/user/user.dart';
import 'package:coach_seek/services/firebase_auth/firebase_auth.dart';
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
    if (imageFile == null) {
      // Update user details only if imageFile is null
      try {
        FireBaseAuthClass().updateTheData(user: userData!);
      } catch (e) {
        log("Error updating user: $e");
        snackBar(context: context, msg: "Error updating user: $e");
      }
    } else if (userData == null) {
      // Handle signup process with profile image upload
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
        log("Error uploading file: $e");
        snackBar(context: context, msg: "Error uploading file: $e");
      }
    } else {
      // Update user data with new profile image URL
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
        FireBaseAuthClass().updateTheData(user: userData);
      } catch (e) {
        log(e.toString());
        snackBar(context: context, msg: "Error updating user data: $e");
      }
    }
  }

  // Handle the signup process with user information and profile image URL
  Future<void> handleSignUp(img) async {
    final state = context.read<SignUpBloc>().state;
    log("Type at handleSignup: ${state.type}");
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final phone = state.phone;
    final location = state.location;
    final amount = state.amount;
    final desc = state.desc;
    final role = state.role;
    final profileImg = img;
    final type = state.type;

    // Check for empty email or password fields
    if (email.isEmpty) {
      snackBar(context: context, msg: "You need to fill email address");
      return;
    }
    if (password.isEmpty) {
      snackBar(context: context, msg: "You need to fill password");
      return;
    }

    // Perform signup using Firebase Authentication
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
          type: type,
        );
  }
}
