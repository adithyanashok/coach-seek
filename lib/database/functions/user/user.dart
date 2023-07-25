import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/experiences.dart';
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
    log(userId.toString());
    final profileData = db
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data()!);

    return profileData;
  }
  // updating a profile

  Future<void> updateUser(
      {required UserModel value, required String userId}) async {
    final db = FirebaseFirestore.instance;
    Map<String, dynamic> userMap = value.toMap();
    await db.collection('users').doc(userId).update(userMap);
  }

  // Adding Experience

  Future<void> addExperience(model) async {
    final db = FirebaseFirestore.instance;
    db.collection("experience").add(model);
  }

  Future<void> getExperience(userId) async {
    List<ExperienceModel> experiences = [];
    final db = FirebaseFirestore.instance;
    final exp = await db
        .collection("experience")
        .where("userId", isEqualTo: userId)
        .get();
    experiences = exp.docs.map((e) {
      return ExperienceModel.fromJson(e.data());
    }).toList();
    log("Experience()=> ${experiences[0]}");
  }
}
