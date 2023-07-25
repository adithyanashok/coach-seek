import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/user/user.dart';

class UserDb {
  Future<void> addUser(UserModel value, String userId) async {
    final db = FirebaseFirestore.instance;

    Map<String, dynamic> userMap = value.toMap();

    await db.collection('users').doc(userId).set(userMap);
  }

  Stream<Map<String, dynamic>> getAUser(String userId) {
    final db = FirebaseFirestore.instance;
    log(userId.toString());
    final profileData = db
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data()!);

    return profileData;
  }

  Future<void> updateUser(
      {required UserModel value, required String userId}) async {
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> userMap = value.toMap();
    await db.collection('users').doc(userId).update(userMap);
  }
}
