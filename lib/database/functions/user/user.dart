import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/database/model/user/user.dart';

class UserDb {
  // Creating a profile
  Future<void> addUser(UserModel value, String userId) async {
    final db = FirebaseFirestore.instance;

    Map<String, dynamic> userMap = value.toMap();

    await db.collection('users').doc(userId).set(userMap);
  }
  // fetching a profile

  Stream<Map<String, dynamic>> getAUser(String userId) {
    final db = FirebaseFirestore.instance;
    final profileData = db
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data()!);

    return profileData;
  }

  Future<HiredCoacheModel> getUser(String userId) async {
    final db = FirebaseFirestore.instance;
    final profileData = await db.collection("users").doc(userId).get();
    final data = HiredCoacheModel.fromJson(profileData.data()!);

    return data;
  }
  // updating a profile

  Future<void> updateUser(
      {required UserModel value, required String userId}) async {
    log("Log at user function: ${value}");
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> userMap = value.toMap();
    await db.collection("users").doc(userId).update({
      'name': value.name,
      'amount': value.amount,
      'desc': value.desc,
      'location': value.location,
      'phone': value.phone,
      'role': value.role,
    });
    await db.collection("hired").doc(userId).update({
      'name': value.name,
      'amount': value.amount,
      'desc': value.desc,
      'location': value.location,
      'phone': value.phone,
      'role': value.role,
    });
    // await db.collection('users').doc(userId).update(userMap);
  }

  //----------------------------------------------
  static Future<UserModel> getCurrentUser(userId) async {
    final db = FirebaseFirestore.instance;
    List<UserModel> users = [];

    final docRef = db.collection("users").doc(userId);
    return docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        final user = UserModel.fromMap(data);
        users.add(user);
        return user;
        // ...
      },
      onError: (e) => log("Error getting document at who hired me: $e"),
    );
  }
}
