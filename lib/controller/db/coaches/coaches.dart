import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/model/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoachDb {
  final db = FirebaseFirestore.instance;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  // Get a list of coaches
  Future<List<UserModel>> getCoaches() async {
    try {
      final querySnapshot =
          await db.collection("users").where('isCoach', isEqualTo: true).get();

      List<UserModel> users = [];
      for (var docSnapshot in querySnapshot.docs) {
        var userData = docSnapshot.data();
        var user = UserModel.fromMap(userData);
        users.add(user);
      }

      return users;
    } catch (e) {
      log('Error getting coaches: $e');
      return [];
    }
  }

  // Search for coaches based on a search query
  Future<List<UserModel>> searchItems({String? searchQuery}) async {
    try {
      // Access the "users" collection in Firestore
      QuerySnapshot querySnapshot = await db
          .collection("users")
          .where('role', isGreaterThanOrEqualTo: searchQuery)
          .where('role', isLessThanOrEqualTo: '${searchQuery!}\uf8ff')
          .get();

      List<UserModel> users = [];
      for (var docSnapshot in querySnapshot.docs) {
        var userData = docSnapshot.data() as Map<String, dynamic>;
        var user = UserModel.fromMap(userData);
        users.add(user);
      }

      return users;
    } catch (e) {
      log('Error searching for coaches: $e');
      return [];
    }
  }
}
