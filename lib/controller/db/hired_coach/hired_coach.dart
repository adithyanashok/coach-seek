// Import necessary packages
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/model/hired_coaches/hired_coaches.dart';
import 'package:coach_seek/model/user/user.dart';
import 'package:coach_seek/services/firebase_notification/firebase_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Define a class for managing hired coaches in the database
class HiredCoachDb {
  static const collectionUsers = 'users';
  static const collectionHired = 'hired';

  // Get the current user's ID
  static final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  // Method to hire a coach
  static Future<void> hireTheCoach({
    HiredCoacheModel? hiredCoacheModel,
    required String fcmToken,
  }) async {
    final db = FirebaseFirestore.instance;
    try {
      final recruterId = hiredCoacheModel!.recruterId;
      final userId = hiredCoacheModel.userId;
      final data = HiredCoacheModel.fromJson(hiredCoacheModel.toJson());

      // Update user's availability and recruterId
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({"available": false, "recruterId": recruterId});

      // Add hired coach data to the 'hired' collection
      await db.collection(collectionHired).doc(userId).set(data.toJson());

      // Send a push notification to the hired coach
      await FirebaseNotificationClass().sendPushMessage(
        title: "Hired!",
        body: "Someone hired you. Let's check out!",
        fcmToken: fcmToken,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  // Method to get all hired coaches for a specific user
  static Future<List<HiredCoacheModel>> getAllHiredCoaches(userId) async {
    final db = FirebaseFirestore.instance;

    try {
      List<HiredCoacheModel> coach = [];
      await db
          .collection(collectionHired)
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

  // Method to get a list of hired coaches for a specific user
  static Future<List<UserModel>> getHiredCoaches({
    required String userId,
  }) async {
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

  // Method to un-hire a coach
  static Future<void> unHireCoach({
    required userId,
    required docId,
  }) async {
    try {
      final db = FirebaseFirestore.instance;

      // Update user's availability and recruterId
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({"available": true, "recruterId": ""});

      // Delete the hired coach entry
      await db.collection(collectionHired).doc(docId).delete();
    } catch (e) {
      log("Error at Unhire coach: $e");
    }
  }

  // Method to get a list of users who hired a specific user
  static Future<List<UserModel>> getWhoHiredMe(recruterId, userId) async {
    log("recruterId: $recruterId, userId: $userId");

    // Check conditions for valid input
    if (recruterId == null) return [];
    // if (currentUserId != userId) return [];

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

  // Method to delete hirings
  static Future<void> deleteHirings({
    required recruterId,
    required userId,
  }) async {
    try {
      final db = FirebaseFirestore.instance;

      // Update user's availability and recruterId
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({"available": true, "recruterId": ""});

      // Delete the hired coach entry
      await db.collection(collectionHired).doc(userId).delete();
    } catch (e) {
      log("Error at Unhire coach: $e");
    }
  }

  // Method to mark payment as completed
  static Future<void> completePayment(userId, paymentId) async {
    final db = FirebaseFirestore.instance;
    try {
      // Update user's payment status
      await db
          .collection(collectionUsers)
          .doc(userId)
          .update({'isPaymentCompleted': true});

      // Update hired coach's payment status and paymentId
      await db
          .collection(collectionHired)
          .doc(userId)
          .update({'isPaymentCompleted': true, 'paymentId': paymentId});
    } catch (e) {
      log(e.toString());
    }
  }
}
