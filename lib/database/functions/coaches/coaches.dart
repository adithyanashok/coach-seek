import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/user/user.dart';

class CoachDb {
  final db = FirebaseFirestore.instance;
  Future<List<UserModel>> getCoaches() async {
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("users").get();

    List<UserModel> users = [];
    for (var docSnapshot in querySnapshot.docs) {
      var userData = docSnapshot.data();
      var user = UserModel.fromMap(userData);

      users.add(user);
    }

    return users.toList();
  }

  Future<List<UserModel>> searchItems({String? searchQuery}) async {
    try {
      // Access the "items" collection in Firestore
      final db = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await db
          .collection("users")
          .where('role', isGreaterThanOrEqualTo: searchQuery)
          .where('role', isLessThanOrEqualTo: '${searchQuery!}\uf8ff')
          .get();
      log("snapshot in Coaches File: $querySnapshot");

      List<UserModel> users = [];
      for (var docSnapshot in querySnapshot.docs) {
        var userData = docSnapshot.data() as Map<String, dynamic>;

        var user = UserModel.fromMap(userData);
        users.shuffle();

        users.add(user);
      }

      return users.toList();
    } catch (e) {
      log('Error searching items: $e');
      return [];
    }
  }
}
