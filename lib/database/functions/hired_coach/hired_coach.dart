import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/database/model/user/user.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HiredCoachDb {
  static const collectionUsers = 'users';
  static const collectionHired = 'hired';
  static final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  static Future<void> hireTheCoach({HiredCoacheModel? hiredCoacheModel}) async {
    final db = FirebaseFirestore.instance;
    log("$hiredCoacheModel");
    try {
      final recruterId = hiredCoacheModel!.recruterId;
      final userId = hiredCoacheModel.userId;
      final data = HiredCoacheModel.fromJson(hiredCoacheModel.toJson());
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({"available": false, "recruterId": recruterId});

      await db.collection("hired").doc(userId).set(data.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<HiredCoacheModel>> getAllHiredCoaches(userId) async {
    final db = FirebaseFirestore.instance;

    try {
      List<HiredCoacheModel> coach = [];
      await db
          .collection("hired")
          .where("recruterId", isEqualTo: userId)
          .get()
          .then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final data = HiredCoacheModel.fromJson(docSnapshot.data())
                .copyWith(id: docSnapshot.id);
            coach.add(data);
          }
        },
        onError: (e) => log("Error completing: $e"),
      );
      return coach.toList();
    } catch (e) {
      log("Exception at getAllHiredCoaches(): $e");
      return [];
    }
  }

  static Future<List<UserModel>> getHiredCoaches(
      {required String userId}) async {
    try {
      final db = FirebaseFirestore.instance;
      List<UserModel> users = [];
      final querySnapshot = await db
          .collection(collectionUsers)
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

  static Future<void> unHireCoach({required userId, required docId}) async {
    try {
      final db = FirebaseFirestore.instance;
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({"available": true, "recruterId": ""});
      await db.collection("hired").doc(docId).delete();
    } catch (e) {
      log("Error at Unhire coach: $e");
    }
  }

  static Future<List<UserModel>> getWhoHiredMe(recruterId, userId) async {
    if (recruterId == null) return [];
    if (currentUserId != userId) return [];
    try {
      final db = FirebaseFirestore.instance;
      List<UserModel> users = [];
      final querySnapshot = await db
          .collection(collectionUsers)
          .where("userId", isEqualTo: recruterId)
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

  static Future<void> completePayment(userId, paymentId) async {
    final db = FirebaseFirestore.instance;
    try {
      await db
          .collection("users")
          .doc(userId)
          .update({'isPaymentCompleted': true});

      await db
          .collection("hired")
          .doc(userId)
          .update({'isPaymentCompleted': true, 'paymentId': paymentId});
    } catch (e) {
      log(e.toString());
    }
  }
}
