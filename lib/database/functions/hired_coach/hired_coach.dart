import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/user/user.dart';

class HiredCoachDb {
  static const collectionHired = 'users';

  static Future<void> hireTheCoach({String? userId, String? recruterId}) async {
    final db = FirebaseFirestore.instance;
    try {
      await db
          .collection(collectionHired)
          .doc(userId)
          .update({"available": "Hired", "recruterId": recruterId});
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<UserModel>> getHiredCoaches(
      {required String userId}) async {
    try {
      final db = FirebaseFirestore.instance;
      List<UserModel> users = [];
      final querySnapshot = await db
          .collection(collectionHired)
          .where("recruterId", isEqualTo: userId)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        var userData = docSnapshot.data();
        var user = UserModel.fromMap(userData);

        users.add(user);
      }
      return users.toList();
    } catch (e) {
      log("Error at Get Hired Coach: $e");
      return [];
    }
  }

  static Future<void> unHireCoach({required userId}) async {
    try {
      final db = FirebaseFirestore.instance;
      await db
          .collection(collectionHired)
          .doc(userId)
          .update({"available": "Available", "recruterId": ""});
    } catch (e) {
      log("Error at Unhire coach: $e");
    }
  }
}
