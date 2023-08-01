import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/coach/coach.dart';
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
}

// return db.collection("users").get().then(
//       (querySnapshot) {
//         for (var docSnapshot in querySnapshot.docs) {
//           log('${docSnapshot.id} => FETCHED ALL DATAS ${docSnapshot.data()}');
//         }
//         return const CoachModel(coach: []);
//       },
//       onError: (e) => log("Error completing: $e"),
//     );

//   Future<CoachModel?> getCoaches() async {
//     return db.collection("users").get().then(
//       (querySnapshot) {
//         List<CoachModel?> coaches = [];
//         for (var docSnapshot in querySnapshot.docs) {
//           final coachData = docSnapshot.data();
//           coaches.add(CoachModel.fromJson(coachData));
//         }
//         return CoachModel(coach: coaches);
//       },
//       onError: (e) => log("Error completing: $e"),
//     );
//   }
// }
