import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coach_seek/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/model/user/user.dart';

class UserDb {
  // Add a user profile to the Firestore database
  Future<void> addUser(UserModel value, String userId) async {
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> userMap = value.toMap();
    await db.collection('users').doc(userId).set(userMap);
  }

  // Retrieve a user profile as a stream
  Stream<Map<String, dynamic>> getAUser(String userId) {
    final db = FirebaseFirestore.instance;
    final profileData = db
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data()!);
    return profileData;
  }

  // Retrieve a user's hired coach data from the Firestore database
  Future<HiredCoacheModel> getAUserFromHiredDb(String userId) async {
    final db = FirebaseFirestore.instance;
    final profileData = await db.collection("users").doc(userId).get();
    final data = HiredCoacheModel.fromJson(profileData.data()!);
    return data;
  }

  // Retrieve a user's data from the Firestore database
  Future<Map<String, dynamic>?> getAUserFromUsersDb(String userId) async {
    final db = FirebaseFirestore.instance;
    final profileData = await db.collection("users").doc(userId).get();

    return profileData.data();
  }

  // Update a user's profile in the Firestore database
  Future<void> updateUser(
      {required UserModel value, required String userId}) async {
    final db = FirebaseFirestore.instance;

    // Update user profile
    await db.collection("users").doc(userId).update({
      'name': value.name,
      'amount': value.amount,
      'desc': value.desc,
      'location': value.location,
      'phone': value.phone,
      'role': value.role,
    });

    // Update user's hired coach data
    await db.collection("hired").doc(userId).update({
      'name': value.name,
      'amount': value.amount,
      'desc': value.desc,
      'location': value.location,
      'phone': value.phone,
      'role': value.role,
    });
  }

  // Update a user's FCM token in the Firestore database
  Future<void> updateFcmToken(
      {required String userId, String? fcmToken}) async {
    final db = FirebaseFirestore.instance;

    try {
      await db.collection("users").doc(userId).update({
        'fcmToken': fcmToken,
      });
    } catch (e) {
      log("Exception at updateFcmToken: $e");
    }
  }

  // Retrieve the current user's data from Firestore using a static method
  static Future<UserModel> getCurrentUser(userId) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc(userId);

    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final user = UserModel.fromMap(data);
        return user;
      },
      onError: (e) => log("Error getting document: $e"),
    );
  }

  // Function to update the phone number for a specific user
  Future<void> updatePhoneNumber(
      {required String userId, required String phoneNumber}) async {
    final db = FirebaseFirestore.instance;

    try {
      await db.doc(userId).update({
        'phone': phoneNumber,
      });
    } catch (e) {
      // Handle any errors that might occur during the update
      log("Error updating phone number: $e");
      rethrow;
    }
  }
}
