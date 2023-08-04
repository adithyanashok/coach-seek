import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/experience/experiences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExperienceDb {
  // Adding Experience

  static Future<void> addExperience(model) async {
    final db = FirebaseFirestore.instance;
    final data = await db.collection("experience").add(model);
  }

  static Stream<List<ExperienceModel>> getExperience({String? userId}) {
    // final userId = FirebaseAuth.instance.currentUser!.uid;
    final db = FirebaseFirestore.instance;
    return db
        .collection("experience")
        .where(
          "userId",
          isEqualTo: userId,
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final id = doc.id; // Get the document id
            final experience = ExperienceModel(
              userId: data['userId'],
              role: data['role'],
              desc: data['desc'],
              id: id, // Set the id field with the document id
            );
            return experience;
          }).toList(),
        );
  }

  static Future<void> deleteExperience(id) {
    final db = FirebaseFirestore.instance;
    return db.collection("experience").doc(id).delete().then(
          (doc) => log("Document deleted"),
          onError: (e) => log("Error updating document $e"),
        );
  }
}
